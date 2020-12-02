from django.urls import path
from accounts import views

from django.conf.urls import url
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('user/', views.user, name='user'),
    path('restaurants/', views.restaurants, name='restaurants'),
    path('about/', views.about, name='about'),
    path('map/', views.map, name='map'),
    path('register/', views.register, name='register'),
    path('login/', views.loginPage, name='login'),
    path('logout/', views.logoutPage, name='logout'),
    path('map/', views.map, name="map"),
    path('articles/', views.articlePage, name='articles'),
    path('restaurant_detail/<str:pk>/', views.restaurant_detail, name='restaurant_detail'),
    path('article_detail/<str:pk>/', views.article_detail, name='article_detail'),
]
