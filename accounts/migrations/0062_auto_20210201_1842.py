# Generated by Django 3.1.5 on 2021-02-01 18:42

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0061_auto_20210201_1840'),
    ]

    operations = [
        migrations.RenameField(
            model_name='ingredientvalue',
            old_name='value',
            new_name='valueInGrams',
        ),
    ]
