import django_filters
from django_filters import NumberFilter
from django.db.models import Avg

from .models import *


class RestaurantFilter(django_filters.FilterSet):

    Restaurant.objects.annotate(avg_rating=Avg('comment__ratings'))
    rating = NumberFilter(field_name="avg_rating", lookup_expr="gte")

    class Meta:
        model = Restaurant
        fields = '__all__'
        exclude = ['location', 'restaurant_picture', 'address', 'houseNumber', 'state']


class HomepageFilter(django_filters.FilterSet):
    restaurant_name = django_filters.CharFilter(field_name='name', label='')

    class Meta:
        model = Restaurant
        fields = ['restaurant_name']
        # exclude = ['location', 'restaurant_picture', 'rating', 'tags', 'affordability']

