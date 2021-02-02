from django.core.validators import MinValueValidator, MaxValueValidator
from django.forms import ModelForm
from django.contrib.auth.forms import UserCreationForm, PasswordResetForm, SetPasswordForm
from django import forms
from accounts.models import Comment, Account
from django.contrib.auth import get_user_model

User = get_user_model()


class CreateUserForm(UserCreationForm):
    email = forms.EmailField(widget=forms.TextInput(attrs={'placeholder': 'Email Adresse ...'}), required=True)
    password1 = forms.CharField(widget=forms.PasswordInput(attrs={'placeholder': 'Passwort ...'}), required=True)
    password2 = forms.CharField(widget=forms.PasswordInput(attrs={'placeholder': 'Passwort bestätigen ...'}),
                                required=True)

    class Meta:
        model = Account
        fields = ('first_name', 'last_name', 'email', 'username', 'password1', 'password2')

        # helper = FormHelper()
        # helper.form_class = 'form-group'
        # helper.layout = Layout(
        #    Field('username', css_class='form-control mt-2 mb-3'),
        # )

        widgets = {'first_name': forms.TextInput(attrs={'id': 'registration_username',
                                                        'placeholder': 'Vorname ...'
                                                        }),
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


class UserPasswordResetForm(SetPasswordForm):
    new_password1 = forms.CharField(label='Password', help_text="<ul class='errorlist text-muted'><li>Your password can 't be too similar to your other personal information.</li><li>Your password must contain at least 8 characters.</li><li>Your password can 't be a commonly used password.</li> <li>Your password can 't be entirely numeric.<li></ul>",
                                    max_length=100, required=True, widget=forms.PasswordInput(
                                        attrs={'class': 'form-control', 'placeholder': 'password', 'type': 'password', 'id': 'user_password'}))

    new_password2 = forms.CharField(label='Confirm password', help_text=False, max_length=100, required=True, widget=forms.PasswordInput(
                                        attrs={'class': 'form-control', 'placeholder': 'confirm password', 'type': 'password', 'id': 'user_password',}))


class UserForgotPasswordForm(PasswordResetForm):
    email = forms.EmailField(label='Email address', max_length=254, required=True, widget=forms.TextInput(
                                 attrs={'class': 'form-control', 'placeholder': 'Email Adresse', 'type': 'text', 'id': 'email_address'}))
