from django.contrib import admin
#from django.contrib.gis.admin import OSMGeoAdmin

# Register your models here.

from .models import *

admin.site.register(Account)


class FriendListAdmin(admin.ModelAdmin):
    list_filter = ['user']
    list_display = ['user']
    search_filter = ['user']
    readonly_filter = ['user']

    class Meta:
        model = FriendList


admin.site.register(FriendList, FriendListAdmin)


class FriendRequestAdmin(admin.ModelAdmin):
    list_filter = ['sender', 'receiver']
    list_display = ['sender', 'receiver']
    search_filter = ['sender__username', 'sender__email', 'receiver__username', 'receiver__email']
    readonly_filter = ['sender', 'receiver']

    class Meta:
        model = FriendRequest

admin.site.register(FriendRequest, FriendRequestAdmin)
admin.site.register(Food)
admin.site.register(Tag)
admin.site.register(Comment)
admin.site.register(Article)
admin.site.register(Coworker)
admin.site.register(Restaurant)

