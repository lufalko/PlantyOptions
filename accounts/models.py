import json
import requests
from django.contrib.auth.models import User, AbstractBaseUser, BaseUserManager
from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models
from PIL import Image
from django.contrib.gis.db.models import PointField
from django.conf import settings



# Create your models here.


class AccountManager(BaseUserManager):
    def create_user(self, email, username, first_name, last_name, password=None):
        if not email:
            raise ValueError("You must enter an email adress")
        if not username:
            raise ValueError("You must enter an username")
        if not first_name:
            raise ValueError("You must enter your first Name")
        if not last_name:
            raise ValueError("You must enter your last Name")

        user = self.model(
            email=self.normalize_email(email),
            username=username,
            first_name=first_name,
            last_name=last_name
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, username, first_name, last_name, password):
        user = self.create_user(
            email=self.normalize_email(email),
            password=password,
            username=username,
            first_name=first_name,
            last_name=last_name
        )
        user.is_admin = True
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)
        return user


class Account(AbstractBaseUser):
    email = models.EmailField(verbose_name='email', max_length=200, unique=True)
    username = models.CharField(max_length=40, blank=False, null=True)
    date_joined = models.DateTimeField(verbose_name='date_joined', auto_now_add=True)
    last_login = models.DateTimeField(verbose_name='last_login', auto_now=True)

    is_admin = models.BooleanField(default=False)
    is_active = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    reset_password = models.BooleanField(default=False)

    first_name = models.CharField(max_length=200, blank=False, null=True)
    last_name = models.CharField(max_length=200, blank=False, null=True)
    initials = models.CharField(max_length=2, null=True)
    profile_picture = models.ImageField(null=True, blank=True, default='dashboard-BG.jpg', help_text='')

    # FOLLOWING ARE CUSTOM USER INFORMATIONS
    biography = models.CharField(max_length=200, null=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'first_name', 'last_name']

    objects = AccountManager()

    def __str__(self):
        return self.username

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)

        if self.profile_picture:
            img = Image.open(self.profile_picture.path)

            if img.height > 300 or img.width > 300:
                output_size = (300, 300)
                img.thumbnail(output_size)
                img.save(self.profile_picture.path)

    def has_perm(self, perm, opj=None):
        return self.is_admin

    def has_module_perms(self, app_label):
        return self.is_admin


class FriendList(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='user')
    friends = models.ManyToManyField(settings.AUTH_USER_MODEL, blank=True, related_name='friends')

    def __str__(self):
        return self.user.username

    def add_friend(self, account):
        """
        Add a new friend
        """
        if not account in self.friends.all():
            self.friends.add(account)
            self.save()

    def remove_friend(self, account):
        """
        Remove Friend
        """
        if account in self.friends.all():
            self.friends.remove(account)

    def unfriend(self, removee):
        """
        Initiate the action of unfriending
        """
        remover_friends_list = self

        remover_friends_list.remove_friend(removee)

        friends_list = FriendList.objects.get(user=removee)
        friends_list.remove_friend(self.user)

    def is_friend(self, friend):

        if friend in self.friends.all():
            return True
        return False


class FriendRequest(models.Model):
    sender = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='sender')
    receiver = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='receiver')

    is_active = models.BooleanField(blank=True, null=False, default=True)

    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.sender.username + ' to ' + self.receiver.username

    def accept(self):
        receiver_friend_list = FriendList.objects.get(user=self.receiver)
        if receiver_friend_list:
            receiver_friend_list.add_friend(self.sender)
            sender_friend_list = FriendList.objects.get(user=self.sender)
            if sender_friend_list:
                sender_friend_list.add_friend(self.receiver)
                self.is_active = False
                self.save()

    def decline(self):
        """
        Declined by receiver
        """
        self.is_active = False
        self.save()

    def cancel(self):
        """
        Canceled by the sender
        """
        self.is_active = False
        self.save()


class Tag(models.Model):
    name = models.CharField(max_length=200, null=True)

    def __str__(self):
        return self.name


class Restaurant(models.Model):
    restaurant_picture = models.ImageField(null=True, default='dashboard-BG.jpg')
    name = models.CharField(max_length=200, null=True)
    description = models.TextField(max_length=250, null=True)

    address = models.CharField(max_length=128, blank=True)
    houseNumber = models.IntegerField(default=1)

    city = models.CharField(max_length=64, default="")
    state = models.CharField(max_length=64, default="")
    zip_code = models.CharField(max_length=5, default="86444")
    tags = models.ManyToManyField(Tag)
    affordability = models.FloatField(blank=True)
    averageRating = models.FloatField(default=0, blank=True)

    mon = models.CharField(max_length=50, blank=True, null=True)
    tue = models.CharField(max_length=50, blank=True, null=True)
    wed = models.CharField(max_length=50, blank=True, null=True)
    thu = models.CharField(max_length=50, blank=True, null=True)
    fri = models.CharField(max_length=50, blank=True, null=True)
    sat = models.CharField(max_length=50, blank=True, null=True)
    sun = models.CharField(max_length=50, blank=True, null=True)

    latitude = models.DecimalField(max_digits=10, decimal_places=7, null=True, blank=True)
    longitude = models.DecimalField(max_digits=10, decimal_places=7, null=True, blank=True)

    likes = models.ManyToManyField(Account, related_name='liked_restaurant', blank=True)

    def getAmountRating(self):
        comments = Comment.objects.all()
        count = 0
        for i in comments:
            if i.restaurant == self:
                count += 1

        if count is not None:
            return count
        else:
            return 0

    def getAveragePrice(self):
        food = Food.objects.all()
        totalPrice = 0.0
        count = 0
        for i in food:
            if i.restaurant == self:
                totalPrice += i.price
                count += 1

        if count is not 0:
            return totalPrice / count
        else:
            return 0

    def save(self, *args, **kwargs):
        price = self.getAveragePrice()
        afford = 0
        if price < 8.5:
            afford = 1
        elif 8.5 <= price < 10.5:
            afford = 2
        elif price >= 10.5:
            afford = 3
        self.affordability = afford

        comments = Comment.objects.filter(restaurant=self)
        avg = 0
        count = 0
        for i in comments:
            avg += i.ratings
            count += 1
        if count is 0:
            avg = 0
        else:
            avg = avg / count

        self.averageRating = avg

        endpoint = "http://www.mapquestapi.com/geocoding/v1/address?key=pljcJn2jh4GxsasQpqj0O11GaS4TLUJm&location=" + self.address + ",%20" + self.city + ",%20Germany,%20" + self.zip_code + ".json"
        data = requests.get(endpoint).json()

        lat = json.loads(str(data['results'][0]['locations'][0]['latLng']['lat']))
        lng = json.loads(str(data['results'][0]['locations'][0]['latLng']['lng']))

        self.latitude = lat
        self.longitude = lng

        super().save(*args, **kwargs)

    def getPK(self):
        return self.kwargs['pk']

    def getTotalLikes(self):
        return self.likes.count()

    def __str__(self):
        return self.name


class rd_update(models.Model):
    rd_opened = models.IntegerField(default=0)


class Food(models.Model):
    CATEGORY = (
        ('Vegan', 'Vegan'),
        ('Vegetarian', 'Vegetarian'),
    )

    restaurant = models.ForeignKey(Restaurant, null=True, on_delete=models.CASCADE)
    name = models.CharField(max_length=200, null=True)
    category = models.CharField(max_length=200, null=True, choices=CATEGORY)
    toGoPrice = models.FloatField(null=True, blank=True)
    rating = models.FloatField(null=True)
    tags = models.ManyToManyField(Tag)
    price = models.FloatField(null=True)
    description = models.CharField(max_length=400, null=True, blank=True)

    def getRestaurantName(self, obj):
        return obj.restaurant.name

    def save(self, *args, **kwargs):
        instance = super(Food, self).save(*args, **kwargs)
        self.restaurant.save()
        return instance

    def __str__(self):
        return self.name


class Comment(models.Model):
    account = models.ForeignKey(Account, null=True, on_delete=models.CASCADE)
    # parent = models.ForeignKey('self', on_delete=models.CASCADE, blank=True, null=True, related_name='subcomment')
    restaurant = models.ForeignKey(Restaurant, null=True, on_delete=models.CASCADE)
    date_created = models.DateTimeField(auto_now_add=True)
    content = models.TextField(default='')
    ratings = models.IntegerField(validators=[MinValueValidator(1), MaxValueValidator(5)], default=5)

    def value(self):
        if self.restaurant:
            return self.restaurant.name
        else:
            return ' '

    name = property(value)

    def save(self, *args, **kwargs):
        instance = super(Comment, self).save(*args, **kwargs)
        self.restaurant.save()
        return instance

    def __str__(self):
        return self.account.username + ' on ' + self.name + '| Rating: ' + str(self.ratings)


class Ingredient(models.Model):
    name = models.CharField(max_length=200, null=False)
    kcal = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(1000)], blank=True, default=0)
    carbs = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(99)], blank=True, default=0)
    protein = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(99)], blank=True, default=0)
    fat = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(99)], blank=True, default=0)

    def __str__(self):
        return self.name


class IngredientValue(models.Model):
    ingredient = models.ForeignKey(Ingredient, on_delete=models.CASCADE)
    valueInGrams = models.IntegerField(null=False, default=0)
    otherValue = models.IntegerField(null=True, blank=True)
    otherValueName = models.CharField(max_length=50, null=True, blank=True)

    def __str__(self):
        return self.ingredient.name + ' | ' + str(self.valueInGrams)


class Recipe(models.Model):
    name = models.CharField(max_length=200, null=False)
    duration = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(12)], blank=True, default=0)
    portions = models.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(12)], null=False)
    instructions = models.TextField(max_length=6000, null=False)
    ingredients = models.ManyToManyField(IngredientValue, blank=True)

    def __str__(self):
        return self.name


class Article(models.Model):
    banner = models.ImageField(null=True, default='dashboard-BG.jpg')
    headline = models.CharField(max_length=200, null=False, default='Unnamed')
    subtitle = models.CharField(max_length=300, null=False, default='Unnamed')
    article_body = models.TextField(max_length=4000, null=False, default='Lorem Ipsum')
    date_created = models.DateTimeField(auto_now_add=True)

    ingredientList = models.BooleanField(null=True, default=False)
    recipe = models.ForeignKey(Recipe, blank=True, null=True, on_delete=models.CASCADE)

    kcal = models.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(3000)], null=True, blank=True)
    carbs = models.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(3000)], null=True, blank=True)
    protein = models.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(3000)], null=True, blank=True)
    fat = models.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(3000)], null=True, blank=True)

    # def save(self, *args, **kwargs):
    #    data = serializers.serialize("json", self.ingredients)

    # def save(self, *args, **kwargs):
    #    super().save(*args, **kwargs)
    #    ingredients = self.ingredients.all()
    #    totalCalories = 0
    #    totalCarbs = 0
    #    totalProtein = 0
    #    totalFat = 0

    #    for i in ingredients:
    #        totalCalories += i.kcal
    #        totalCarbs += i.carbs
    #        totalProtein += i.protein
    #        totalFat += i.fat
    #       if i == 0:
    #           return

    #    self.kcal = totalCalories
    #   self.carbs = totalCarbs
    #   self.protein = totalProtein
    #   self.fat = totalFat
    #   self.save()

    def __str__(self):
        return self.headline


class Coworker(models.Model):
    name = models.CharField(max_length=50, null=False, default='Unnamed')
    picture = models.ImageField(null=False, default='dashboard-BG.jpg')
    email = models.CharField(max_length=150, null=False)
    social = models.CharField(max_length=250, null=False)
    title = models.CharField(max_length=50)
    bio = models.CharField(max_length=35)

    def __str__(self):
        return self.name
