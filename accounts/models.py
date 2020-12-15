from django.contrib.auth.models import User, AbstractBaseUser, BaseUserManager
from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models
from PIL import Image
from django.contrib.gis.db.models import PointField


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
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)

    first_name = models.CharField(max_length=200, blank=False, null=True)
    last_name = models.CharField(max_length=200, blank=False, null=True)
    initials = models.CharField(max_length=2, null=True)
    profile_picture = models.ImageField(null=True, blank=True)

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


class Friend(models.Model):
    users = models.ManyToManyField(Account)
    current_user = models.ForeignKey(Account, related_name='owner', on_delete=models.CASCADE)

    @classmethod
    def make_friend(cls, current_user, new_friend):
        friend, created = cls.objects.get_or_create(
            current_user=current_user
        )
        friend.users.add(new_friend)

    @classmethod
    def lose_friend(cls, current_user, new_friend):
        friend, created = cls.objects.get_or_create(
            current_user=current_user
        )
        friend.users.remove(new_friend)


class Tag(models.Model):
    name = models.CharField(max_length=200, null=True)

    def __str__(self):
        return self.name


class RestaurantLocation(models.Model):
    point = PointField()

    @property
    def lat_lng(self):
        return list(getattr(self.point, 'coords', [])[::-1])


class Restaurant(models.Model):
    restaurant_picture = models.ImageField(null=True, default='dashboard-BG.jpg')
    name = models.CharField(max_length=200, null=True)

    address = models.CharField(max_length=128, blank=True)
    houseNumber = models.IntegerField(default=1)

    city = models.CharField(max_length=64, default="")
    state = models.CharField(max_length=64, default="")
    zip_code = models.CharField(max_length=5, default="86444")

    tags = models.ManyToManyField(Tag)
    affordability = models.FloatField(validators=[MaxValueValidator(3), MinValueValidator(1)], null=True)
    objects = models.Manager()

    point = models.ForeignKey(RestaurantLocation, null=True, on_delete=models.SET_NULL)

    def getAverageRating(self):
        comments = Comment.objects.all()
        avg = 0
        count = 0
        for i in comments:
            if i.restaurant == self:
                avg += i.ratings
                if count is 0:
                    count += 1
                else:
                    avg = avg / 2
        if avg is not 0:
            avg = round(avg)
        return avg

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
    account = models.ForeignKey(Account, null=True, on_delete=models.SET_NULL)
    restaurant = models.ForeignKey(Restaurant, null=True, on_delete=models.SET_NULL)
    date_created = models.DateTimeField(auto_now_add=True)
    content = models.TextField(default='enter text')
    ratings = models.IntegerField(validators=[MinValueValidator(1), MaxValueValidator(5)], default=5)
    fields = '__all__'

    def __str__(self):
        return self.account.username + ' | Rating: ' + str(self.ratings)


class Article(models.Model):
    banner = models.ImageField(null=True, default='dashboard-BG.jpg')
    headline = models.CharField(max_length=200, null=False, default='Unnamed')
    subtitle = models.CharField(max_length=300, null=False, default='Unnamed')
    article_body = models.CharField(max_length=4000, null=False, default='Lorem Ipsum')
    date_created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.headline


class Coworker(models.Model):
    name = models.CharField(max_length=50, null=False, default='Unnamed')
    picture = models.ImageField(null=False, default='dashboard-BG.jpg')
    email = models.CharField(max_length=150, null=False)
    social = models.CharField(max_length=250, null=False)
    title = models.CharField(max_length=50)
    bio = models.CharField(max_length=250)

