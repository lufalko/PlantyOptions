from django.contrib import admin
from .models import Restaurant
from leaflet.admin import LeafletGeoAdmin

# Register your models here.

from .models import *

admin.site.register(Account)
admin.site.register(Food)

admin.site.register(Tag)
admin.site.register(Comment)
admin.site.register(Article)
admin.site.register(Coworker)


class RestaurantAdmin(LeafletGeoAdmin):
    list_display = ('name', 'location')

admin.site.register(Restaurant, RestaurantAdmin)
