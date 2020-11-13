from django.urls import path, include
from accounts import views


urlpatterns = (
    path('', views.home),
    path('restaurants/', views.restaurants),
    path('user/', views.user),
    path('restaurants/', views.restaurants),
    path('map/', views.map),
    path('register/', views.register),
    path('login/', views.loginPage, ),
)
