from django.core.validators import MinValueValidator, MaxValueValidator
from django.forms import ModelForm
from django.contrib.auth.forms import UserCreationForm
from django import forms
from accounts.models import Comment
from accounts.models import Restaurant
from django.contrib.auth import get_user_model

User = get_user_model()


class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'username', 'email', 'password1', 'password2']


class CreateCommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ['content', 'ratings']

        widgets = {'content': forms.Textarea(attrs={'class': 'form-control'})}
