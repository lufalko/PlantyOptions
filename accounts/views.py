from django.shortcuts import render
from django.http import HttpResponse


# Create your views here.

def home(request):
    return render(request, 'accounts/dashboard.html')


def map(request):
    return render(request, 'accounts/map.html')


def user(request):
    return render(request, 'accounts/user.html')
