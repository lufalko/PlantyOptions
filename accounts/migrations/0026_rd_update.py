# Generated by Django 3.1.4 on 2021-01-04 20:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0025_delete_rd_update'),
    ]

    operations = [
        migrations.CreateModel(
            name='rd_update',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rd_opened', models.IntegerField(default=0)),
            ],
        ),
    ]
