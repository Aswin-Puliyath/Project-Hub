from django.db import models

# Create your models here.
class login(models.Model):
    username=models.CharField(max_length=20)
    password=models.CharField(max_length=20)
    type=models.CharField(max_length=20)

class project(models.Model):
    proid=models.CharField(max_length=20)
    ptitle=models.TextField()
    pdesc=models.TextField()
    date=models.DateField()
    deadline=models.DateField()

class assign_project(models.Model):
    PROJECT=models.ForeignKey(project,on_delete=models.CASCADE)
    LOGIN=models.ForeignKey(login,on_delete=models.CASCADE)
    date=models.DateField()
    deadline=models.DateField()
    status=models.CharField(max_length=20)

class task(models.Model):
    ASSIGN=models.ForeignKey(assign_project,on_delete=models.CASCADE)
    LOGIN=models.ForeignKey(login,on_delete=models.CASCADE)
    ttitle=models.CharField(max_length=20)
    tdesc=models.TextField()
    date=models.DateTimeField()
    deadline=models.DateField()
    status=models.CharField(max_length=20)

class project_report(models.Model):
    ASSIGN=models.ForeignKey(assign_project,on_delete=models.CASCADE)
    date=models.DateTimeField()
    report=models.TextField()

class task_report(models.Model):
    TASK=models.ForeignKey(task,on_delete=models.CASCADE)
    date=models.DateTimeField()
    report=models.TextField()