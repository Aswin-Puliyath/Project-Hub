# Generated by Django 3.2.20 on 2024-07-12 10:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('proapp', '0002_project_proid'),
    ]

    operations = [
        migrations.AlterField(
            model_name='project',
            name='date',
            field=models.DateField(),
        ),
        migrations.AlterField(
            model_name='project',
            name='deadline',
            field=models.DateField(),
        ),
    ]