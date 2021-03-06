from django.db.models import Avg
from django.shortcuts import render, redirect, get_object_or_404
from django.core.exceptions import ObjectDoesNotExist
from django.core.mail import EmailMessage
from django.urls.exceptions import NoReverseMatch
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.contrib.auth.forms import UserCreationForm, PasswordChangeForm

from django.contrib.auth import authenticate, login, logout, update_session_auth_hash, get_user_model

from django.contrib import messages

from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import Group
from django.contrib.sites.shortcuts import get_current_site

from django.conf import settings
from django.template.loader import render_to_string

from django.shortcuts import render

from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods

from django.views.generic import TemplateView

from django.urls import path, reverse_lazy, reverse
from django.views.generic import ListView

from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_text, force_bytes

import json

# Create your views here.
from .models import *
from .forms import *
from .filters import *
from .decorators import unauthenticated_user, allowed_users
from .serializers import *
from .utils import get_friend_request_or_false
from .friend_request_status import FriendRequestStatus
from .tokens import *

from django.conf import settings

from accounts.models import rd_update

from rest_framework.views import APIView
from rest_framework.response import Response

from itertools import chain

# from sendgrid import SendGridAPIClient
# from sendgrid.helpers.mail import Mail

User = get_user_model()



@unauthenticated_user
def register(request):
    context = {}

    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        if form.is_valid():
            form.save()
            email = form.cleaned_data.get('email')
            raw_password = form.cleaned_data.get('password1')
            account = authenticate(email=email, password=raw_password)

            name = request.POST.get('first_name')
            account = Account.objects.get(email=email)
            token = account_activation_token.make_token(account)
            uid = urlsafe_base64_encode(force_bytes(account.pk))
            href = "http://plantyoptions.de/verification/" + uid + "/" + token

            # email verification
            template = render_to_string('snippets/email_verification_template.html', {'name': name, 'hyperrefference': href})

            emailMessage = EmailMessage(
                'Danke, dass du dich auf plantyoptions.de angemeldet hast!',
                template,
                settings.EMAIL_HOST_USER,
                [email]
            )
            emailMessage.fail_silently = False
            emailMessage.send()
            # endemail verification

            return redirect('login')

        else:
            context['registration_form'] = form
    else:
        form = CreateUserForm()
        context['registration_form'] = form
    return render(request, 'accounts/register.html', context)


def VerificationView(request, uid, token):
    try:
        uid = force_text(urlsafe_base64_decode(uid))
        user = Account.objects.get(pk=uid)
    except (TypeError, ValueError, OverflowError, Account.DoesNotExist) as e:
        messages.add_message(request, messages.WARNING, str(e))
        user = None

    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True  # now we're activating the user
        user.save()
    else:
        messages.add_message(request, messages.WARNING, 'Der Aktivierungslink ist nicht vergeben.')

    return redirect('login')


@require_http_methods(["GET", "POST"])
def change_password(request):
    msg = ''
    if request.user.is_authenticated == False:
        if request.method == "POST":
            form = UserForgotPasswordForm(request.POST)
            if form.is_valid():
                email = request.POST.get('email')
                user = Account.objects.get(email=email)
                site = get_current_site(request)

                user.is_active = False  # User needs to be inactive for the reset password duration
                user.reset_password = True
                user.save()

                token = password_reset_token.make_token(user)
                uid = urlsafe_base64_encode(force_bytes(user.pk))
                href = "http://plantyoption.de/reset/" + uid + "/" + token

                # email verification
                template = render_to_string('snippets/password_reset_mail.html', {'name': user.first_name, 'username': user.username , 'hyperrefference': href})

                emailMessage = EmailMessage(
                    'Passwortwiederherstellung von plantyoptions.de',
                    template,
                    settings.EMAIL_HOST_USER,
                    [email]
                )
                emailMessage.fail_silently = False
                emailMessage.send()

                messages.add_message(request, messages.SUCCESS, 'Email {0} gesendet.'.format(email))
                msg = 'Wenn die von dir eingegebene Email in unserer Datenbank zu finden ist, senden wir eine Nachricht zu dieser Adresse.'
            else:
                messages.add_message(request, messages.WARNING, 'Keine Email angegeben.')
                return render(request, 'accounts/change_password.html', {'form': form})

        return render(request, 'accounts/change_password.html', {'form': PasswordChangeForm, 'msg': msg})

    else:
        return redirect('home')


@require_http_methods(["GET", "POST"])
def reset(request, uid, token):

    if request.method == 'POST':
        try:
            uid = force_text(urlsafe_base64_decode(uid))
            user = Account.objects.get(pk=uid)
        except (TypeError, ValueError, OverflowError, User.DoesNotExist) as e:
            messages.add_message(request, messages.WARNING, str(e))
            user = None

        if user is not None and password_reset_token.check_token(user, token):
            form = PasswordChangeForm(user, request.POST)
            if form.is_valid():
                form.save()
                update_session_auth_hash(request, form.user)

                user.is_active = True
                user.reset_password = False
                user.save()
                messages.add_message(request, messages.SUCCESS, 'Passwort erfolgreich zur??ckgesetzt.')
                return redirect('login')
            else:
                context = {
                    'form': form,
                    'uid': uid,
                    'token': token
                }
                messages.add_message(request, messages.WARNING, 'Passwort konnte nicht zur??ckgesetzt werden.')
                return render(request, 'accounts/change_password.html', context)
        else:
            messages.add_message(request, messages.WARNING, 'Link zum Zur??cksetzen des Passwortes ung??ltig.')
            messages.add_message(request, messages.WARNING, 'Bitte fordere einen erneutes Zur??cksetzen des Passwortes an.')

    try:
        uid = force_text(urlsafe_base64_decode(uid))
        user = Account.objects.get(pk=uid)
    except (TypeError, ValueError, OverflowError, User.DoesNotExist) as e:
        messages.add_message(request, messages.WARNING, str(e))
        user = None

    if user is not None and password_reset_token.check_token(user, token):
        context = {
            'form': PasswordChangeForm(user, request.POST),
            'uid': uid,
            'token': token
        }
        return render(request, 'accounts/snippets/reset_password.html', context)
    else:
        messages.add_message(request, messages.WARNING, 'Link zum Zur??cksetzen des Passwortes ung??ltig.')
        messages.add_message(request, messages.WARNING, 'Bitte fordere einen erneutes Zur??cksetzen des Passwortes an.')

    return redirect('login')


def loginPage(request):
    if request.user.is_authenticated:
        return redirect('home')
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        usr = authenticate(request, username=username, password=password)

        if usr is not None and usr.is_active == True:
            login(request, usr)
            return redirect('home')
        elif usr is None:
            messages.info(request, 'Nutzername oder Passwort inkorrekt')
        elif usr.is_active == False:
            messages.info(request, 'Account muss verifiziert werden')


    context = {}
    return render(request, 'accounts/login.html', context)


def logoutPage(request):
    logout(request)
    return redirect('login')



def home(request):
    articles = Article.objects.all()[::-1][:3]
    comments = Comment.objects.all()

    restaurants = Restaurant.objects.all()
    foods = Food.objects.all()

    context = {'articles': articles, 'comments': comments,
               'restaurants': restaurants, 'foods': foods}

    return render(request, 'accounts/home.html', context)


def best_restaurants():

    rating = 5
    request.session['rating'] = rating

    return HttpResonseRedirect(reverse(search_results))

def comment_template():
    comments = Comment.objects.all()

    restaurants = Restaurant.objects.all()

    homeFilter = HomepageFilter(request.GET, queryset=restaurants)
    restaurants = homeFilter.qs

    context = {'restaurants': restaurants, 'comments': comments,}

    return render(request, 'accounts/snippets/comment_template.html', context)


def userMap(request):
    return render(request, 'accounts/map.html')


def restaurants(request, average=None):
    restaurants = Restaurant.objects.annotate(avg_rating=Avg('comment__ratings'))

    foods = Food.objects.all()
    comments = Comment.objects.all()

    myFilter = RestaurantFilter(request.GET, queryset=restaurants)

    addressFilter = GetAddressFilter(request.GET, queryset=restaurants)

    if average:
        restaurants = Restaurant.objects.filter(averageRating=average)
    elif request.GET.get('search'):
        restaurants = Restaurant.objects.filter(name=request.GET.get('search'))
    else:
        restaurants = myFilter.qs

    context = {'restaurants': restaurants, 'myFilter': myFilter,'addressFilter': addressFilter, 'foods': foods, 'comments': comments}

    return render(request, 'accounts/restaurants.html', context)


def about(request):
    team = Coworker.objects.all()
    context = {'team': team}
    return render(request, 'accounts/about.html', context)


def articlePage(request):
    articles = Article.objects.all()

    context = {'articles': articles}
    return render(request, 'accounts/articles.html', context)


@login_required(login_url='login')
def user(request):
    currentUser = request.user
    comments = Comment.objects.filter(account=request.user)
    liked = Restaurant.objects.filter(likes=currentUser)
    foods = Food.objects.all()

    if request.method == 'POST':
        #comment_form = CreateCommentForm(request.POST or None)
        userForm = UserUpdateForm(request.POST, instance=currentUser)
        pictureForm = PictureUpdateForm(request.POST,
                                        request.FILES,
                                        instance=currentUser)
        if userForm.is_valid():

            userForm.save()
            pictureForm.save()
            messages.success(request, f'Your account hast been updated')
            return redirect('user')

    else:
        userForm = UserUpdateForm(instance=currentUser)
        pictureForm = PictureUpdateForm(instance=currentUser)
        #comment_form = CreateCommentForm()

    context = {'user': currentUser, 'userForm': userForm, 'pictureForm': pictureForm, 'comments': comments, 'liked': liked, 'foods': foods
    }
    return render(request, 'accounts/user.html', context)



def profile(request, pk):
    user = Account.objects.get(pk=pk)
    account = request.user

    if account == user.is_authenticated:
        return rediredct("user")

    try:
        friend_list = FriendList.objects.get(user=user)
    except FriendList.DoesNotExist:
        friend_list = FriendList(user=user)
        friend_list.save()
    friends = friend_list.friends.all()

    #check if the profile we're looking at is not ours
    is_self = True
    is_friend = False
    request_sent = FriendRequestStatus.NO_REQUEST_SENT.value
    friend_request = None
    if user.is_authenticated and user != account:
        is_self = False
        if friends.filter(pk=pk):
            is_friend = True
        else:
            is_friend = False
            # CASE1: Request from them sent to us
            if get_friend_request_or_false(sender=account, receiver=user) != False:
                request_sent = FriendRequestStatus.THEM_SENT_TO_YOU.value
                context['pending_friend_request_id'] = get_friend_request_or_false(
                    sender=account, receiver=user).id
            # CASE2: Request sent from us to them
            if get_friend_request_or_false(sender=account, receiver=user) != False:
                request_sent = FriendRequestStatus.YOU_SENT_TO_THEM.value
            # CASE3: No request has ben sent
            else:
                request_sent = FriendRequestStatus.NO_REQUEST_SENT.value

    elif not user.is_authenticated:
        is_self = False
    else:
        try:
            friend_request = FriendRequest.objects.filter(receiver=user, is_active=True)
        except Exception as e:
            pass

    context = {'user': user, 'friends': friends, 'is_self': is_self, 'is_friend': is_friend, 'request_sent': request_sent, 'friend_request': friend_request}
    return render(request, 'accounts/profile.html', context)


def send_friend_request(request, id,*args, **kwargs):
    user = request.user
    receiver = None
    payload = {}
    if request.method == "POST" and user.is_authenticated:
        account_id = request.POST.get("receiver_account_id")
        if account_id:
            receiver = Account.objects.get(pk=account_id)
            try:
                # Get any friend requests
                friend_request = FriendRequest.objects.filter(sender=user, receiver=receiver)
                # find active requests
                try:
                    for request in friend_requests:
                        if request.ist_active:
                            raise Exception("Friend request already sent.")
                    friend_request = FriendRequest(sender=user, receiver=receiver)
                    friend_request.save()
                    payload['response'] = "Friend request sent."
                except Exception as e:
                    payload['response'] = "Wupsey! " + str(e)
            except FriendRequest.DoesNotExist:
                # No friend requests -> create one
                friend_request = FriendRequest(sender=user, receiver=receiver)
                friend_request.save()
                payload['response'] = "Friend requeste sent."

            if payload['response'] == None:
                payload['response'] = "Wupsey! Something went wrong."
        else:
            payload['response'] = "Unable to send a friend request."
    else:
        payload['response'] = "You must be authenticated to send a friend request."
    return HttpResponse(json.dumps(payload), content_type="application/json")


def friend_requests(request, *args, **kwargs):
    context = {}
    user = request.user
    user_id = None
    friend_requests = None
    if user.is_authenticated:
        user_id = user.pk
        account = Account.objects.get(pk=user_id)
        if account == user:
            friend_requests = FriendRequest.objects.filter(receiver=account, is_active=True)
            context['friend_requests'] = friend_requests
        else:
            return HttpResponse("You can't ciew another users fried requests.")
    else:
        redirect("login")
    return render(request, "accounts/snippets/friend_requests.html", context)


def social(request):
    user = request.user
    if user.is_authenticated:
        profiles = Account.objects.exclude(id=request.user.id)
        friend = FriendList.objects.filter(user=request.user)

        context = {'profiles': profiles, 'friend': friend}
        return render(request, 'accounts/social.html', context)
    else:
        return redirect('login')


def map(request):
    restaurants = Restaurant.objects.all()
    foods = Food.objects.all()


    context = {
        'restaurants': restaurants,
        'foods': foods
    }
    return render(request, 'accounts/map.html', context)


def restaurant_detail(request, pk, underpage=1, **kwargs):

    queryset = Restaurant.objects.get(pk=pk)
    foods = Food.objects.filter(restaurant=queryset)

    comments = Comment.objects.all()
    ratings = comments.filter(restaurant=pk)
    ratingCount = len(ratings)

    totalLikes = queryset.getTotalLikes()
    session = rd_update.objects.get(id=1)
    underpage = underpage
    pk_value = pk

    myFilter = CommentFilter(request.GET, queryset=comments)
    comments = myFilter.qs

    liked = None

    if request.user.is_authenticated:
        liked = Restaurant.objects.filter(likes=request.user)

    isLiked = False

    if request.method == 'POST':
        comment_form = CreateCommentForm(request.POST or None)

        if comment_form.is_valid():
            content = request.POST.get('content')
            ratings = request.POST.get('ratings')
            comment = Comment.objects.create(restaurant=queryset, account=request.user, content=content, ratings=ratings)
            comment.save()
            return HttpResponseRedirect(request.path_info)

    else:
        comment_form = CreateCommentForm()

    context = {
        'queryset': queryset, 'comments': comments, 'comment_form': comment_form,
        'foods': foods, 'ratingCount': ratingCount, 'totalLikes': totalLikes,
        'session': session, 'underpage': underpage, 'pk_value': pk_value, 'myFilter': myFilter, 'isLiked': isLiked, 'liked': liked
    }
    return render(request, 'restaurant_detail.html', context)


def likeView(request, pk):
    restaurant = get_object_or_404(Restaurant, id=request.POST.get('restaurant_id'))
    restaurant.likes.add(request.user)

    return HttpResponseRedirect(reverse('restaurant_detail', args=[str(pk)]))


def article_detail(request, pk):
    article = Article.objects.get(pk=pk)
    if article.recipe:
        recipe = article.recipe
        duration = None
        unit = ''
        if recipe.duration < 1:
            duration = int(recipe.duration * 60)
            unit = 'min'
        else:
            duration = recipe.duration
            unit = 'h'
        ingredients = recipe.ingredients.all()
    else:
        recipe = None;
        ingredients = None;
        duration = None;
        unit = None;


    context = {
        'article': article, 'recipe': recipe, 'duration': duration, 'unit': unit, 'ingredients': ingredients
    }
    return render(request, 'article_detail.html', context)


@csrf_exempt
def rd_update_counter(request):

    if request.method == 'POST':
        session = rd_update.objects.get(id=1)
        session.rd_opened = request.POST['counter']
        session.save()
        message = 'update successful'
    context = {'session': session, "message": message}
    return HttpResponse(session)
    return HttpResponseRedirect(reverse('search', kwargs={'query': ticker}))


class DataApi(APIView):
    @staticmethod
    def get(self, *args, **kwargs):
        qs = Restaurant.objects.all()
        serializer = RestaurantSerializer(qs, many=True)
        return Response(serializer.data)

    @staticmethod
    def post(self, request, *args, **kwargs):
        serializer = RestaurantSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors)


class FoodsApi(APIView):
    @staticmethod
    def get(self, *args, **kwargs):
        qs = Food.objects.all()
        serializer = FoodSerializer(qs, many=True)
        return Response(serializer.data)
