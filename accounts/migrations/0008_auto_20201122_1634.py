# Generated by Django 3.1.3 on 2020-11-22 16:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0007_user_profile_picture'),
    ]

    operations = [
        migrations.RenameField(
            model_name='user',
            old_name='name',
            new_name='firstName',
        ),
        migrations.AddField(
            model_name='restaurant',
            name='restaurant_picture',
            field=models.ImageField(blank=True, null=True, upload_to=''),
        ),
        migrations.AddField(
            model_name='user',
            name='lastName',
            field=models.CharField(max_length=200, null=True),
        ),
    ]
