# Generated by Django 3.1.4 on 2021-01-22 14:12

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0041_auto_20210122_1411'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='food',
            name='toGo',
        ),
    ]
