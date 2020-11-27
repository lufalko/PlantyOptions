import django_filters
from django_filters import NumberFilter

from .models import *


class RestaurantFilter(django_filters.FilterSet):

    rating = NumberFilter(field_name="rating", lookup_expr="gte")

    class Meta:
        model = Restaurant
        fields = '__all__'
        exclude = ['location', 'restaurant_picture', 'rating']
