from django.urls import path
from accounts import views


urlpatterns = (
    path('', views.home, name='home'),
    path('user/', views.user, name='user'),
    path('restaurants/', views.restaurants, name='restaurants'),
    path('map/', views.userMap, name='map'),
    path('register/', views.register, name='register'),
    path('login/', views.loginPage, name='login'),
    path('logout/', views.logoutPage, name='logout'),
    path('profile/', views.profile, name='profile')
)
