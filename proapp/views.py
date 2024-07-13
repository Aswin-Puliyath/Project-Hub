from datetime import datetime

from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.shortcuts import render, redirect

# Create your views here.
from proapp.models import *


def logout(request):
    auth.logout(request)
    return render(request, 'login.html')


def loginpg(request):
    return render(request, 'LOGIN.html')


def logincode(request):
    username = request.POST['uname']
    password = request.POST['pass']
    try:
        var = login.objects.get(username=username, password=password)
        request.session['lid'] = var.id
        if var.type == 'Admin':
            ob = auth.authenticate(username="aswin", password="aswin")
            if ob is not None:
                auth.login(request, ob)
            return HttpResponse('''<script>window.location='/adminhome'</script>''')
        elif var.type == 'TL':
            request.session['name'] = var.username
            ob = auth.authenticate(username="aswin", password="aswin")
            if ob is not None:
                auth.login(request, ob)
            return HttpResponse('''<script>window.location='/tlhome'</script>''')
        elif var.type == 'TM':
            request.session['name'] = var.username
            ob = auth.authenticate(username="aswin", password="aswin")
            if ob is not None:
                auth.login(request, ob)
            return HttpResponse('''<script>window.location='/tmhome'</script>''')
        else:
            return HttpResponse('''<script>alert("INVALID");window.location='/'</script>''')
    except:
        return HttpResponse('''<script>alert("INVALID");window.location='/'</script>''')


def signup(request):
    return render(request, 'signup.html')


def signupcode(request):
    username = request.POST['uname']
    ob = login.objects.filter(username=username)
    if len(ob) == 0:
        password = request.POST['pass']
        type = request.POST['select']
        obj = login()
        obj.username = username
        obj.password = password
        obj.type = type
        obj.save()
        return HttpResponse('''<script>alert("Signup Completed");window.location='/'</script>''')
    else:
        return HttpResponse('''<script>alert("Username Unavailable");window.location='/'</script>''')


@login_required(login_url='/')
def adminhome(request):
    ou = assign_project.objects.all()
    cou = len(ou)
    request.session['ttcount'] = int(cou)
    ov = assign_project.objects.filter(status="To-Do")
    cov = len(ov)
    request.session['tdcount'] = int(cov)
    ow = assign_project.objects.filter(status="In Progress")
    cow = len(ow)
    request.session['ipcount'] = int(cow)
    ox = assign_project.objects.filter(status="Completed")
    cox = len(ox)
    request.session['cocount'] = int(cox)
    oy = login.objects.filter(type="TL")
    cob = len(oy)
    request.session['leadcount'] = int(cob)
    oz = login.objects.filter(type="TM")
    coj = len(oz)
    request.session['mcount'] = int(coj)
    return render(request, 'admin/index.html', {'cob': int(cob), 'coj': int(coj)})


@login_required(login_url='/')
def mngpro(request):
    obj = assign_project.objects.all().order_by("-id")
    return render(request, 'admin/manage project.html', {'obj': obj})


@login_required(login_url='/')
def prosearch(request):
    title = request.POST['title']
    obj = assign_project.objects.filter(PROJECT__ptitle__istartswith=title).order_by("-id")
    return render(request, 'admin/manage project.html', {'obj': obj, 'tt': str(title)})


@login_required(login_url='/')
def dltpro(request, pid):
    ob = project.objects.get(id=pid)
    ob.delete()
    adminhome(request)
    return HttpResponse('''<script>alert("Removed");window.location='/mngpro#about'</script>''')


@login_required(login_url='/')
def newpro(request):
    obj = login.objects.filter(type="TL").order_by("type")
    return render(request, 'admin/new project.html', {'obj': obj})


@login_required(login_url='/')
def editpro(request, pid):
    request.session['pid'] = pid
    oj = assign_project.objects.get(PROJECT__id=pid)
    obj = login.objects.filter(type="TL").order_by("type")
    return render(request, 'admin/edit project.html', {'obj': obj, 'oj': oj, 'dd': str(oj.deadline)})


@login_required(login_url='/')
def editprocode(request):
    id = request.POST['id']
    title = request.POST['name']
    dead = request.POST['dead']
    desc = request.POST['desc']
    lid = request.POST['select']
    obj = project.objects.get(id=request.session['pid'])
    obj.proid = id
    obj.ptitle = title
    obj.pdesc = desc
    obj.deadline = dead
    obj.save()
    obj1 = assign_project.objects.get(PROJECT__id=request.session['pid'])
    obj1.LOGIN = login.objects.get(id=lid)
    obj1.deadline = datetime.today()
    obj1.save()
    return HttpResponse('''<script>alert("Updated");window.location='/mngpro#about'</script>''')


@login_required(login_url='/')
def projectcode(request):
    id = request.POST['id']
    title = request.POST['name']
    dead = request.POST['dead']
    desc = request.POST['desc']
    lid = request.POST['select']
    obj = project()
    obj.proid = id
    obj.ptitle = title
    obj.pdesc = desc
    obj.deadline = dead
    obj.date = datetime.today()
    obj.save()
    obj1 = assign_project()
    obj1.PROJECT = obj
    obj1.LOGIN = login.objects.get(id=lid)
    obj1.date = datetime.today()
    obj1.deadline = datetime.today()
    obj1.status = "To-Do"
    obj1.save()
    adminhome(request)
    return HttpResponse('''<script>alert("Project Added");window.location='/mngpro#about'</script>''')


@login_required(login_url='/')
def report(request):
    ob = project_report.objects.all().order_by('-id')
    return render(request, 'admin/project report.html', {'ob': ob})


@login_required(login_url='/')
def repsearch(request):
    title = request.POST['title']
    ob = project_report.objects.filter(ASSIGN__PROJECT__ptitle__istartswith=title).order_by('-id')
    return render(request, 'admin/project report.html', {'ob': ob, 'tt': str(title)})


# ____________________________________________________________________________________________________________________________________
# ____________________________________________________________________________________________________________________________________
# ____________________________________________________________________________________________________________________________________


@login_required(login_url='/')
def tlhome(request):
    ox = assign_project.objects.filter(LOGIN__id=request.session['lid'], status="Completed")
    cox = len(ox)
    request.session['tct'] = int(cox)
    oy = assign_project.objects.filter(LOGIN__id=request.session['lid'], status="In Progress")
    cob = len(oy)
    request.session['tip'] = int(cob)
    oz = assign_project.objects.filter(LOGIN__id=request.session['lid'], status="To-Do")
    coj = len(oz)
    request.session['ttd'] = int(coj)
    return render(request, 'tl/index.html', {'cob': int(cob), 'coj': int(coj)})


@login_required(login_url='/')
def assignedpro(request):
    obj = assign_project.objects.filter(LOGIN__id=request.session['lid']).order_by("-id")
    return render(request, 'tl/assigned project.html', {'obj': obj})


@login_required(login_url='/')
def searap(request):
    dt = request.POST['dt']
    obj = assign_project.objects.filter(LOGIN__id=request.session['lid'], date=dt).order_by("-id")
    return render(request, 'tl/assigned project.html', {'obj': obj, 'dt': str(dt)})


@login_required(login_url='/')
def chtl(request):
    obj = login.objects.filter(type="TM").order_by("type")
    return render(request, 'tl/select tm.html', {'val': obj})


@login_required(login_url='/')
def assigncode(request):
    tk = request.POST['task']
    desc = request.POST['desc']
    dead = request.POST['dead']
    tl = request.POST['select']
    ob = task()
    ob.ASSIGN = assign_project.objects.get(id=request.session['aid'])
    ob.LOGIN = login.objects.get(id=tl)
    ob.ttitle = tk
    ob.date = datetime.today()
    ob.deadline = dead
    ob.tdesc = desc
    ob.status = "To-Do"
    ob.save()
    return HttpResponse('''<script>alert("Task Assigned");window.location='/vt2#about'</script>''')


@login_required(login_url='/')
def vt(request, aid):
    request.session['aid'] = aid
    return redirect('vt2')


@login_required(login_url='/')
def vt2(request):
    oj = task.objects.filter(ASSIGN__id=request.session['aid'])
    return render(request, 'tl/view task.html', {'oj': oj})


@login_required(login_url='/')
def tr(request):
    ob = task_report.objects.filter(TASK__ASSIGN__id=request.session['aid']).order_by('-id')
    return render(request, 'tl/task report.html', {'ob': ob})


@login_required(login_url='/')
def tskdt(request):
    dt = request.POST['dt']
    ob = task_report.objects.filter(TASK__ASSIGN__id=request.session['aid'], date=dt).order_by('-id')
    return render(request, 'tl/task report.html', {'ob': ob, 'dt': str(dt)})


@login_required(login_url='/')
def dlttsk(request, tid):
    ob = task.objects.get(id=tid)
    ob.delete()
    return HttpResponse('''<script>alert("Task Removed");window.location='/vt2#about'</script>''')


@login_required(login_url='/')
def edittask(request, tid):
    request.session['tid'] = tid
    oj = task.objects.get(id=tid)
    obj = login.objects.filter(type="TM").order_by("type")
    return render(request, 'tl/edit task.html', {'val': obj, 'oj': oj, 'dd': str(oj.deadline)})


@login_required(login_url='/')
def edittaskcode(request):
    tk = request.POST['task']
    desc = request.POST['desc']
    dead = request.POST['dead']
    tm = request.POST['select']
    ob = task.objects.get(id=request.session['tid'])
    ob.LOGIN = login.objects.get(id=tm)
    ob.ttitle = tk
    ob.deadline = dead
    ob.tdesc = desc
    ob.save()
    return HttpResponse('''<script>alert("Updated");window.location='/vt2#about'</script>''')


@login_required(login_url='/')
def tsksea(request):
    tsk = request.POST['task']
    oj = task.objects.filter(ASSIGN__id=request.session['aid'], ttitle__istartswith=tsk)
    return render(request, 'tl/view task.html', {'oj': oj, 'tt': str(tsk)})


@login_required(login_url='/')
def uppro(request, id):
    ob = assign_project.objects.get(id=id)
    if ob.status == "To-Do":
        ob.status = "In Progress"
        ob.save()
        tlhome(request)
        return HttpResponse('''<script>alert("Updated");window.location='/assignedpro#about'</script>''')
    elif ob.status == "In Progress":
        ob.status = "Completed"
        ob.save()
        tlhome(request)
        return HttpResponse('''<script>alert("Updated");window.location='/assignedpro#about'</script>''')


@login_required(login_url='/')
def tlreport(request):
    ob = project_report.objects.filter(ASSIGN__LOGIN__id=request.session['lid']).order_by('-id')
    return render(request, 'tl/project report.html', {'ob': ob})


@login_required(login_url='/')
def tlreportse(request):
    ttl = request.POST['title']
    ob = project_report.objects.filter(ASSIGN__LOGIN__id=request.session['lid'],
                                       ASSIGN__PROJECT__ptitle__istartswith=ttl).order_by('-id')
    return render(request, 'tl/project report.html', {'ob': ob, 'tt': str(ttl)})


@login_required(login_url='/')
def newrep(request):
    ob = assign_project.objects.filter(LOGIN__id=request.session['lid']).order_by('-id')
    return render(request, 'tl/new rep.html', {'val': ob})


@login_required(login_url='/')
def sendrep(request):
    rep = request.POST['rep']
    aid = request.POST['select']
    ob = project_report()
    ob.report = rep
    ob.ASSIGN = assign_project.objects.get(id=aid)
    ob.date = datetime.today()
    ob.save()
    return HttpResponse('''<script>alert("Delivered");window.location='/tlreport#about'</script>''')


# ______________________________________________________________________________________________________________________
# ______________________________________________________________________________________________________________________
# ______________________________________________________________________________________________________________________
# ______________________________________________________________________________________________________________________


@login_required(login_url='/')
def tmhome(request):
    ox = task.objects.filter(LOGIN_id=request.session['lid'], status="Completed")
    cox = len(ox)
    request.session['mct'] = int(cox)
    oy = task.objects.filter(LOGIN_id=request.session['lid'], status="In Progress")
    cob = len(oy)
    request.session['mip'] = int(cob)
    oz = task.objects.filter(LOGIN_id=request.session['lid'], status="To-Do")
    coj = len(oz)
    request.session['mtd'] = int(coj)
    return render(request, 'tm/index.html', {'cob': int(cob), 'coj': int(coj)})


@login_required(login_url='/')
def mytasks(request):
    ob = task.objects.filter(LOGIN_id=request.session['lid']).order_by('-id')
    return render(request, 'tm/assigned tasks.html', {'ob': ob})


@login_required(login_url='/')
def uptask(request, id):
    ob = task.objects.get(id=id)
    if ob.status == "To-Do":
        ob.status = "In Progress"
        ob.save()
        tmhome(request)
        return HttpResponse('''<script>alert("Updated");window.location='/mytasks#about'</script>''')
    elif ob.status == "In Progress":
        ob.status = "Completed"
        ob.save()
        tmhome(request)
        return HttpResponse('''<script>alert("Updated");window.location='/mytasks#about'</script>''')


@login_required(login_url='/')
def sendtr(request):
    ob = task_report.objects.filter(TASK__LOGIN__id=request.session['lid']).order_by('-id')
    return render(request, 'tm/task report.html', {'ob': ob})


@login_required(login_url='/')
def tmreportse(request):
    tt = request.POST['title']
    ob = task_report.objects.filter(TASK__LOGIN__id=request.session['lid'],
                                    TASK__ASSIGN__PROJECT__ptitle__istartswith=tt).order_by('-id')
    return render(request, 'tm/task report.html', {'ob': ob, 'tt': str(tt)})


@login_required(login_url='/')
def newtr(request):
    ob = task.objects.filter(LOGIN__id=request.session['lid']).order_by('-id')
    return render(request, 'tm/new rep.html', {'val': ob})


@login_required(login_url='/')
def sendtrep(request):
    rep = request.POST['rep']
    tid = request.POST['select']
    ob = task_report()
    ob.report = rep
    ob.TASK = task.objects.get(id=tid)
    ob.date = datetime.today()
    ob.save()
    return HttpResponse('''<script>alert("Delivered");window.location='/sendtr#about'</script>''')
