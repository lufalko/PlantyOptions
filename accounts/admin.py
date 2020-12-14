from django.contrib import admin
from .models import RestaurantLocation
from django.contrib.gis.admin import OSMGeoAdmin


# Register your models here.

from .models import *

admin.site.register(Account)
admin.site.register(Food)
admin.site.register(Tag)
admin.site.register(Comment)
admin.site.register(Article)
admin.site.register(Coworker)
admin.site.register(Restaurant)


@admin.register(RestaurantLocation)
class RestaurantLocationAdmin(OSMGeoAdmin):
    default_lon = 1400000
    default_lat = 7495000
    default_zoom = 12




