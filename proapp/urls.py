"""projecthub URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from proapp import views

urlpatterns = [
    path('', views.loginpg, name="loginpg"),
    path('signup', views.signup, name="signup"),
    path('logincode', views.logincode, name="logincode"),
    path('signupcode', views.signupcode, name="signupcode"),
    path('adminhome', views.adminhome, name="adminhome"),
    path('mngpro', views.mngpro, name="mngpro"),
    path('newpro', views.newpro, name="newpro"),
    path('projectcode', views.projectcode, name="projectcode"),
    path('editpro/<int:pid>', views.editpro, name="editpro"),
    path('dltpro/<int:pid>', views.dltpro, name="dltpro"),
    path('editprocode', views.editprocode, name="editprocode"),
    path('prosearch', views.prosearch, name="prosearch"),
    path('report', views.report, name="report"),
    path('repsearch', views.repsearch, name="repsearch"),
    path('tlhome', views.tlhome, name="tlhome"),
    path('assignedpro', views.assignedpro, name="assignedpro"),
    path('assigncode', views.assigncode, name="assigncode"),
    path('chtl', views.chtl, name="chtl"),
    path('vt/<int:aid>', views.vt, name="vt"),
    path('dlttsk/<int:tid>', views.dlttsk, name="dlttsk"),
    path('edittaskcode', views.edittaskcode, name="edittaskcode"),
    path('edittask/<int:tid>', views.edittask, name="edittask"),
    path('vt2', views.vt2, name="vt2"),
    path('tsksea', views.tsksea, name="tsksea"),
    path('searap', views.searap, name="searap"),
    path('tlreport', views.tlreport, name="tlreport"),
    path('tlreportse', views.tlreportse, name="tlreportse"),
    path('newrep', views.newrep, name="newrep"),
    path('sendrep', views.sendrep, name="sendrep"),
    path('uppro/<int:id>', views.uppro, name="uppro"),
    path('tmhome', views.tmhome, name="tmhome"),
    path('mytasks', views.mytasks, name="mytasks"),
    path('uptask/<int:id>', views.uptask, name="uptask"),
    path('sendtr', views.sendtr, name="sendtr"),
    path('tmreportse', views.tmreportse, name="tmreportse"),
    path('newtr', views.newtr, name="newtr"),
    path('sendtrep', views.sendtrep, name="sendtrep"),
    path('tr', views.tr, name="tr"),
    path('tskdt', views.tskdt, name="tskdt"),
    path('logout', views.logout, name="logout"),
]
