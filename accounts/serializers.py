from rest_framework import serializers

from .models import *

from django import forms


class RestaurantSerializer(serializers.ModelSerializer):
    class Meta:
        model = Restaurant
        fields = (
            'name', 'address', 'houseNumber', 'city', 'zip_code'
        )


class FoodSerializer(serializers.ModelSerializer):
    class Meta:
        model = Food
        fields = (
            'restaurant', 'category'
        )
