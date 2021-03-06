# Generated by Django 3.1.4 on 2021-01-09 11:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0034_auto_20210108_2159'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='article_body',
            field=models.TextField(default='Lorem Ipsum', max_length=4000),
        ),
        migrations.AlterField(
            model_name='article',
            name='ingredients',
            field=models.ManyToManyField(blank=True, to='accounts.Ingredient'),
        ),
    ]
