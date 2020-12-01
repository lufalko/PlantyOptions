from django.contrib import admin

# Register your models here.

from .models import *

admin.site.register(Account)
admin.site.register(Food)
admin.site.register(Restaurant)
admin.site.register(Tag)
admin.site.register(Comment)
admin.site.register(Article)
admin.site.register(Coworker)
