# Generated by Django 3.1.4 on 2021-01-08 18:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0032_auto_20210108_1843'),
    ]

    operations = [
        migrations.AddField(
            model_name='article',
            name='ingredientList',
            field=models.BooleanField(default=False, null=True),
        ),
    ]
