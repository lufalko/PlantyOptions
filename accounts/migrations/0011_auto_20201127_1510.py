# Generated by Django 3.1.3 on 2020-11-27 15:10

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0010_article'),
    ]

    operations = [
        migrations.RenameField(
            model_name='article',
            old_name='articleBody',
            new_name='article_body',
        ),
    ]
