from django.db.models import Avg
from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.contrib.auth.forms import UserCreationForm

from django.contrib.auth import authenticate, login, logout

from django.contrib import messages

from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import Group

# Create your views here.
from .models import *
from .forms import *
from .filters import RestaurantFilter, HomepageFilter, GetAddressFilter
from .decorators import unauthenticated_user, allowed_users
from .serializers import *

from rest_framework.views import APIView
from rest_framework.response import Response

from django.shortcuts import render

from itertools import chain

from django.views.generic import TemplateView


from django.urls import path
from django.views.generic import ListView


class RestaurantLocationList(ListView):
    queryset = RestaurantLocation.objects.filter(point__isnull=False)


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
            login(request, account)
            return redirect('home')
        else:
            context['registration_form'] = form
    else:
        form = CreateUserForm()
        context['registration_form'] = form
    return render(request, 'accounts/register.html', context)


def loginPage(request):
    if request.user.is_authenticated:
        return redirect('home')
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        usr = authenticate(request, username=username, password=password)

        if usr is not None:
            login(request, usr)
            return redirect('home')
        else:
            messages.info(request, 'Username or password is incorrect')

    context = {}
    return render(request, 'accounts/login.html', context)


def logoutPage(request):
    logout(request)
    return redirect('login')


def home(request):
    articles = Article.objects.all()
    comments = Comment.objects.all()

    restaurants = Restaurant.objects.all()
    foods = Food.objects.all()

    homeFilter = HomepageFilter(request.GET, queryset=restaurants)
    restaurants = homeFilter.qs

    context = {'articles': articles, 'comments': comments,
               'restaurants': restaurants, 'homeFilter': homeFilter,
               'foods': foods}

    return render(request, 'accounts/home.html', context)


def userMap(request):
    object_list = RestaurantLocationList

    context = {'object_list': object_list}

    return render(request, 'accounts/map.html', context)


def restaurants(request):
    restaurants = Restaurant.objects.annotate(avg_rating=Avg('comment__ratings'))

    foods = Food.objects.all()
    comments = Comment.objects.all()

    myFilter = RestaurantFilter(request.GET, queryset=restaurants)
    addressFilter = GetAddressFilter(request.GET, queryset=restaurants)


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
    if request.method == 'POST':
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

    context = {'user': currentUser, 'userForm': userForm, 'pictureForm': pictureForm}
    return render(request, 'accounts/user.html', context)


def profile(request, pk=None):
    if pk:
        user = Account.objects.get(pk=pk)
    else:
        user = request.user

    context = {'user': user}
    return render(request, 'accounts/profile.html', context)


def social(request):
    profiles = Account.objects.all()

    context = {'profiles': profiles}
    return render(request, 'accounts/social.html', context)


def map(request):
    return render(request, 'accounts/map.html', {})


def restaurant_detail(request, pk):

    foods = Food.objects.all()
    queryset = Restaurant.objects.get(pk=pk)
    comments = Comment.objects.all()
    ratings = comments.filter(restaurant=pk)
    ratingCount = len(ratings)

    if request.method == 'POST':
        comment_form = CreateCommentForm(request.POST or None)

        if comment_form.is_valid():
            content = request.POST.get('content')
            comment = Comment.objects.create(restaurant=queryset, account=request.user, content=content)
            comment.save()
            return HttpResponseRedirect(request.path_info)

    else:
        comment_form = CreateCommentForm()

    context = {
        'queryset': queryset, 'comments': comments, 'comment_form': comment_form,
        'foods': foods, 'ratingCount': ratingCount
    }
    return render(request, 'restaurant_detail.html', context)


def article_detail(request, pk):
    queryset = Article.objects.get(pk=pk)
    context = {
        'queryset': queryset
    }
    return render(request, 'restaurant_detail.html', context)


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
