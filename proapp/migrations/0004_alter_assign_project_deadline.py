# Generated by Django 3.2.20 on 2024-07-12 10:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('proapp', '0003_auto_20240712_1536'),
    ]

    operations = [
        migrations.AlterField(
            model_name='assign_project',
            name='deadline',
            field=models.DateField(),
        ),
    ]