# Generated by Django 3.1.4 on 2021-01-23 15:45

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0045_auto_20210123_1544'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='food',
            name='toGoAv',
        ),
    ]
