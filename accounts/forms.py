from django.core.validators import MinValueValidator, MaxValueValidator
from django.forms import ModelForm
from django.contrib.auth.forms import UserCreationForm
from django import forms
from accounts.models import Comment, Account
from django.contrib.auth import get_user_model

User = get_user_model()


class CreateUserForm(UserCreationForm):
    email = forms.EmailField(widget=forms.TextInput(attrs={'placeholder': 'Email Adresse ...'}), required=True)
    password1 = forms.CharField(widget=forms.PasswordInput(attrs={'placeholder': 'Passwort ...'}), required=True)
    password2 = forms.CharField(widget=forms.PasswordInput(attrs={'placeholder': 'Passwort bestätigen ...'}), required=True)

    class Meta:
        model = Account
        fields = ('first_name', 'last_name', 'email', 'username', 'password1', 'password2')

        widgets = {'first_name': forms.TextInput(attrs={'placeholder': 'Vorname ...'}),
                   'last_name': forms.TextInput(attrs={'placeholder': 'Nachname ...'}),
                   'username': forms.TextInput(attrs={'placeholder': 'Nutzername ...'}),
                   }


class UserUpdateForm(forms.ModelForm):
    email = forms.EmailField()

    class Meta:
        model = Account
        fields = ['username', 'email', 'first_name', 'last_name', 'biography']

        widgets = {'biography': forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Biographie'}),
                   'username': forms.TextInput(attrs={'placeholder': 'Benutzername'})
                   }


class PictureUpdateForm(forms.ModelForm):
    class Meta:
        model = Account
        fields = ['profile_picture']


class CreateCommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ['content', 'ratings']

        widgets = {'content': forms.Textarea(attrs={'class': 'form-control'}),
                   'ratings': forms.NumberInput}
