# Generated by Django 3.1.4 on 2021-01-08 21:59

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0033_article_ingredientlist'),
    ]

    operations = [
        migrations.CreateModel(
            name='Recipe',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('duration', models.FloatField(blank=True, default=0, validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(12)])),
                ('portions', models.IntegerField(validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(12)])),
                ('instructions', models.TextField(max_length=6000)),
            ],
        ),
        migrations.AlterField(
            model_name='article',
            name='ingredients',
            field=models.ManyToManyField(blank=True, null=True, to='accounts.Ingredient'),
        ),
        migrations.AddField(
            model_name='article',
            name='recipe',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='accounts.recipe'),
        ),
    ]
