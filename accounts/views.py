from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.forms import UserCreationForm

from django.contrib.auth import authenticate, login, logout

from django.contrib import messages

from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import Group

# Create your views here.
from .models import *
from .forms import CreateUserForm, CreateCommentForm
from .filters import RestaurantFilter, HomepageFilter
from .decorators import unauthenticated_user, allowed_users

from django.shortcuts import render

from django.views.generic import TemplateView


@unauthenticated_user
def register(request):
    form = CreateUserForm()

    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        if form.is_valid():
            usr = form.save()
            username = form.cleaned_data.get('username')

            group = Group.objects.get(name='users')
            usr.groups.add(group)

            messages.success(request, 'Account was created for ' + username)

            return redirect('/login')

    context = {'form': form}
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

    context = {'articles': articles, 'comments': comments, 'restaurants': restaurants, 'homeFilter': homeFilter,
               'foods': foods}

    return render(request, 'accounts/home.html', context)


def userMap(request):
    return render(request, 'accounts/map.html')


def restaurants(request):
    restaurants = Restaurant.objects.all()
    foods = Food.objects.all();

    myFilter = RestaurantFilter(request.GET, queryset=restaurants)
    restaurants = myFilter.qs

    context = {'restaurants': restaurants, 'myFilter': myFilter, 'foods': foods}
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
    return render(request, 'accounts/user.html')


def map(request):
    return render(request, 'accounts/map.html', {})


def restaurant_detail(request, pk):
    foods = Food.objects.all()
    queryset = Restaurant.objects.get(pk=pk)
    comments = Comment.objects.all()
    form_class = CreateCommentForm

    if request.method == 'POST':
        comment_form = CreateCommentForm(request.POST or None)
        if request.method == 'POST':

            if comment_form.is_valid():
                content = request.POST.get('content')
                comment = Comment.objects.create(restaurant=queryset, account=request.user, content=content)
                comment.save()
                return HttpResponseRedirect(request.path_info)

    else:
        comment_form = CreateCommentForm()

    context = {
        'queryset': queryset, 'comments': comments, 'comment_form': comment_form,'foods': foods
    }
    return render(request, 'restaurant_detail.html', context)


def article_detail(request, pk):
    queryset = Article.objects.get(pk=pk)
    context = {
        'queryset': queryset
    }
    return render(request, 'restaurant_detail.html', context)


