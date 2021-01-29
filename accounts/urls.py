from django.urls import path, re_path, include
from accounts import views

from django.conf.urls import url
from . import views
from accounts.views import rd_update_counter

urlpatterns = [
    path('', views.home, name='home'),
    path('user/', views.user, name='user'),
    path('profile/<str:pk>/', views.profile, name='profile'),
    path('friend_requests', views.send_friend_request, name='friend_requests'),
    path('friend_requests/<user_id>/', views.friend_requests, name='friend_requests'),

    path('restaurants/', views.restaurants, name='restaurants'),
    path('restaurants/<int:average>', views.restaurants, name='restaurants'),

    path('like/<int:pk>', views.likeView, name='like_restaurant'),
    path('about/', views.about, name='about'),
    path('social/', views.social, name='social'),
    path('register/', views.register, name='register'),
    path('login/', views.loginPage, name='login'),
    path('logout/', views.logoutPage, name='logout'),
    path('map/', views.map, name='map'),

    path('articles/', views.articlePage, name='articles'),
    path('article_detail/<str:pk>/', views.article_detail, name='article_detail'),
    path('restaurant_detail/<str:pk>/', views.restaurant_detail, name='restaurant_detail'),
    path('restaurant_detail/<str:pk>/<int:underpage>', views.restaurant_detail, name='restaurant_detail'),

    path('api-auth/', include('rest_framework.urls')),
    path('data_api/', views.DataApi.as_view(), name='data_api'),
    path('food_api/', views.FoodsApi.as_view(), name='food_api'),
    re_path(r'^rd_update_counter/$', views.rd_update_counter, name="rd_update_counter"),
    re_path(r'^rd_update_counter/(?P<query>.+)/$', views.rd_update_counter, name="rd_update_counter"),

    path('verification/<str:pk>/', views.VerifivationView, name='verification')
]
