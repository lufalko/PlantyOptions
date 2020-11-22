from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.forms import UserCreationForm

from django.contrib.auth import authenticate, login, logout

from django.contrib import messages

# Create your views here.
from .models import *
from .forms import CreateUserForm
from .filters import RestaurantFilter


def register(request):
    form = CreateUserForm()

    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        if form.is_valid():
            form.save()
            usr = form.cleaned_data.get('username')
            messages.success(request, 'Account was created for ' + usr)

            return redirect('/login')

    myFilter = RestaurantFilter()

    context = {'form': form}
    return render(request, 'accounts/register.html', context)


def loginPage(request):
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
    return render(request, 'accounts/home.html')


def userMap(request):
    return render(request, 'accounts/map.html')


def restaurants(request):
    restaurants = Restaurant.objects.all()

    myFilter = RestaurantFilter(request.GET, queryset=restaurants)
    restaurants = myFilter.qs

    context = {'restaurants': restaurants, 'myFilter': myFilter}
    return render(request, 'accounts/restaurants.html', context)


def user(request):
    return render(request, 'accounts/user.html')
