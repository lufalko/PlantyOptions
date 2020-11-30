from django.forms import ModelForm
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django import forms
from accounts.models import Comment
from accounts.models import Restaurant


class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'username', 'email', 'password1', 'password2']


class AddComment(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ('content',)
        widgets = {
            'Content': forms.TextInput(attrs={'class': 'form-control'})
        }