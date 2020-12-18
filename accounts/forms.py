from django.core.validators import MinValueValidator, MaxValueValidator
from django.forms import ModelForm
from django.contrib.auth.forms import UserCreationForm
from django import forms
from accounts.models import Comment, Account
from django.contrib.auth import get_user_model

User = get_user_model()


class CreateUserForm(UserCreationForm):
    email = forms.EmailField(max_length=200, help_text='Required Field. Add your email address.')

    class Meta:
        model = Account
        fields = ('first_name', 'last_name', 'email', 'username', 'password1', 'password2')


class UserUpdateForm(forms.ModelForm):
    email = forms.EmailField()

    class Meta:
        model = Account
        fields = ['username', 'email', 'first_name', 'last_name', 'biography']


class PictureUpdateForm(forms.ModelForm):
    class Meta:
        model = Account
        fields = ['profile_picture']


class CreateCommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ['content', 'ratings']

        widgets = {'content': forms.Textarea(attrs={'class': 'form-control'})}
