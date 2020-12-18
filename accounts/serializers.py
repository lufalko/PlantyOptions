from rest_framework import serializers
from .models import *

from django import forms


class TagSerializer(serializers.ModelSerializer):

     def to_representation(self, value):
          return { "tags": value.name }

class RestaurantSerializer(serializers.ModelSerializer):
    class Meta:
        model = Restaurant
        fields = (
            'name', 'address', 'houseNumber', 'city', 'zip_code'
        )


class FoodSerializer(serializers.ModelSerializer):
    restaurantName = serializers.CharField(source="restaurant.name")
    tags = TagSerializer(many=True, read_only=True)

    class Meta:
        model = Food
        fields = (
            'restaurantName', 'category', 'tags'
        )
