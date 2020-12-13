from django.contrib import admin
from .models import Restaurant
#anne from django.contrib.gis.admin import OSMGeoAdmin


# Register your models here.

from .models import *

admin.site.register(Account)
admin.site.register(Food)
admin.site.register(Tag)
admin.site.register(Comment)
admin.site.register(Article)
admin.site.register(Coworker)
admin.site.register(Restaurant)


#anne @admin.site.register(Restaurant)
#anne class RestaurantAdmin(OSMGeoAdmin):
#anne    default_lon = 1400000
#anne    default_lat = 7495000
#anne    default_zoom = 12
