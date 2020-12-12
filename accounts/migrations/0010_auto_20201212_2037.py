# Generated by Django 3.1.4 on 2020-12-12 20:37

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0009_auto_20201211_1921'),
    ]

    operations = [
        migrations.RenameField(
            model_name='rating',
            old_name='Restaurant',
            new_name='restaurant',
        ),
        migrations.AddField(
            model_name='rating',
            name='account',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL),
        ),
    ]
