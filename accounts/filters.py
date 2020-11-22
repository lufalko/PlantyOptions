import django_filters
from django_filters import DateFilter

from .models import *


class RestaurantFilter(django_filters.FilterSet):

    class Meta:
        model = Restaurant
        fields = '__all__'
        exclude = ['location', 'restaurant_picture']
