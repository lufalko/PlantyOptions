
from django.db import models
from django.db.models import Count


# Create your models here.

class User(models.Model):
    firstName = models.CharField(max_length=200, blank=False, null=True)
    lastName = models.CharField(max_length=200, blank=False, null=True)
    initials = models.CharField(max_length=2, null=True)
    email = models.CharField(max_length=200, blank=False, null=True)
    password = models.CharField(max_length=200, blank=False, null=True)
    username = models.CharField(max_length=200, blank=False, null=True)
    profile_picture = models.ImageField(null=True, blank=True)
    date_created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name


class Tag(models.Model):
    name = models.CharField(max_length=200, null=True)

    def __str__(self):
        return self.name


class Restaurant(models.Model):
    restaurant_picture = models.ImageField(null=True, blank=True)
    name = models.CharField(max_length=200, null=True)
    location = models.CharField(max_length=200, null=True)
    rating = models.FloatField(null=True)
    tags = models.ManyToManyField(Tag)
    affordability = models.FloatField(null=True)


    def __str__(self):
        return self.name


class Food(models.Model):
    CATEGORY = (
        ('Vegan', 'Vegan'),
        ('Vegetarian', 'Vegetarian'),
    )

    restaurant = models.ForeignKey(Restaurant, null=True, on_delete=models.SET_NULL)
    name = models.CharField(max_length=200, null=True)
    category = models.CharField(max_length=200, null=True, choices=CATEGORY)
    rating = models.FloatField(null=True)
    tags = models.ManyToManyField(Tag)
    price = models.FloatField(null=True)
    description = models.CharField(max_length=400, null=True)

    def __str__(self):
        return self.name


class Comment(models.Model):
    user = models.ForeignKey(User, null=True, on_delete=models.SET_NULL)
    date_created = models.DateTimeField(auto_now_add=True)
    content = models.FloatField(null=True)
