from django.contrib import admin
from .models import Restaurant


# Register your models here.

from .models import *

admin.site.register(Account)
admin.site.register(Food)

admin.site.register(Tag)
admin.site.register(Comment)
admin.site.register(Article)
admin.site.register(Coworker)
admin.site.register(Restaurant)

