# Generated by Django 3.2.20 on 2024-07-12 18:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('proapp', '0006_alter_task_deadline'),
    ]

    operations = [
        migrations.AlterField(
            model_name='assign_project',
            name='date',
            field=models.DateField(),
        ),
    ]
