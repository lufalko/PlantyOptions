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

        widgets = {'first_name': forms.TextInput(attrs={'placeholder': 'Vorname...'}),
                   'last_name': forms.TextInput(attrs={'placeholder': 'Nachname...'}),
                   'email': forms.TextInput(attrs={'placeholder': 'Email Adresse...'}),
                   'username': forms.TextInput(attrs={'placeholder': 'Nutzername...'}),
                   'password1': forms.TextInput(attrs={'placeholder': 'Passwort...'}),
                   'password2': forms.TextInput(attrs={'placeholder': 'Passwort bestätigen'})
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
