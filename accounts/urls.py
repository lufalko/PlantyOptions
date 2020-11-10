from django.urls import path
from accounts import views

urlpatterns = (
    path('', views.home),
    path('map/', views.map),
    path('user/', views.user),
    path('restaurants/', views.restaurants),
)
