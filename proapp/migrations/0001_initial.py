# Generated by Django 3.2.20 on 2024-07-12 07:30

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='assign_project',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField()),
                ('deadline', models.DateTimeField()),
                ('status', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='login',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=20)),
                ('password', models.CharField(max_length=20)),
                ('type', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='project',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ptitle', models.CharField(max_length=20)),
                ('pdesc', models.TextField()),
                ('date', models.DateTimeField()),
                ('deadline', models.DateTimeField()),
            ],
        ),
        migrations.CreateModel(
            name='task',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ttitle', models.CharField(max_length=20)),
                ('tdesc', models.TextField()),
                ('date', models.DateTimeField()),
                ('deadline', models.DateTimeField()),
                ('status', models.CharField(max_length=20)),
                ('ASSIGN', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='proapp.assign_project')),
                ('LOGIN', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='proapp.login')),
            ],
        ),
        migrations.CreateModel(
            name='task_report',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField()),
                ('report', models.TextField()),
                ('TASK', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='proapp.task')),
            ],
        ),
        migrations.CreateModel(
            name='project_report',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField()),
                ('report', models.TextField()),
                ('ASSIGN', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='proapp.assign_project')),
            ],
        ),
        migrations.AddField(
            model_name='assign_project',
            name='LOGIN',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='proapp.login'),
        ),
        migrations.AddField(
            model_name='assign_project',
            name='PROJECT',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='proapp.project'),
        ),
    ]
