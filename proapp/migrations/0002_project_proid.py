# Generated by Django 3.2.20 on 2024-07-12 09:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('proapp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='project',
            name='proid',
            field=models.CharField(default=1, max_length=20),
            preserve_default=False,
        ),
    ]
