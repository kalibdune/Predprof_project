# Generated by Django 3.2.16 on 2023-01-27 16:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='site',
            name='name',
            field=models.CharField(max_length=100, verbose_name='название'),
        ),
    ]
