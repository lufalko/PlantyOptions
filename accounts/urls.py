from django.urls import path
from accounts import views

urlpatterns = (
    path('', views.home),
    path('restaurants/', views.restaurants),
    path('user/', views.user),
)
