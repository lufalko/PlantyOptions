# Generated by Django 3.1.4 on 2021-01-08 18:43

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0031_auto_20210108_1831'),
    ]

    operations = [
        migrations.AddField(
            model_name='article',
            name='carbs',
            field=models.IntegerField(blank=True, null=True, validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(3000)]),
        ),
        migrations.AddField(
            model_name='article',
            name='fat',
            field=models.IntegerField(blank=True, null=True, validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(3000)]),
        ),
        migrations.AddField(
            model_name='article',
            name='protein',
            field=models.IntegerField(blank=True, null=True, validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(3000)]),
        ),
    ]
