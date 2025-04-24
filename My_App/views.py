from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from django.shortcuts import render, redirect
from django.contrib import messages
from django.urls import reverse
from django.views.decorators.csrf import csrf_exempt
# Create your views here.
from My_App.models import *


def login(request):
    return render(request,'login user.html')

def login_post(request):
    username=request.POST['textfield']
    password=request.POST['textfield2']
    try:
        user=Login.objects.get(username=username,password=password)
        request.session['lid']=user.id
        if user.type=='admin':
            return HttpResponse('''<script>alert("login succesfull");window.location='/admin_home'</script>''')
        elif user.type == 'owner':
            return HttpResponse('''<script>alert("login succesfull");window.location='/home'</script>''')
        else:
            return HttpResponse('''<script>alert("invalid.........");window.location='/'</script>''')

    except:
        return HttpResponse('''<script>alert("invalid..");window.location='/'</script>''')
def admin_home(request):
    return render(request,'admin/index.html')

def view_route(request):
    ob=Route.objects.all()
    return render(request,'admin/add route.html',{'data':ob})

def add_route(request):

    return render(request,'admin/add route 2.html')

def add_route_post(request):
    fromplace=request.POST['from_place']
    toplace=request.POST['to_place']

    route=Route()
    route.from_place=fromplace
    route.to_place=toplace
    route.save()
    return HttpResponse('''<script>alert("successfully saved");window.location='/view_route'</script>''')

def delete_route(request,id):
    request.session['rid']=id
    ob=Route.objects.get(id=request.session['rid'])
    ob.delete()
    return HttpResponse('''<script>alert("deleted successfully");window.location='/view_route'</script>''')






def admin_add_stops(request):
    a=Route.objects.all()
    return render(request,'admin/add stops.html',{'data':a})



def admin_add_stops_post(request):
    route=request.POST['route']
    stop=request.POST['stop']
    a=Stop()
    a.stop_name=stop
    a.latitude=request.POST['lat']
    a.longitude=request.POST['lon']
    a.ROUTE=Route.objects.get(id=route)
    a.save()
    return HttpResponse('''<script>alert(" successfully");window.location='/admin_add_stops'</script>''')





def mng_stop(request,id):
    request.session['rid'] = id
    ob = Stop.objects.filter(ROUTE_id=request.session['rid']).order_by('-id')
    return render(request,'admin/add stop.html',{'data':ob})


def delete_stop(request,id):
    request.session['rid']=id
    ob = Stop.objects.get(id=request.session['rid'])
    ob.delete()
    return HttpResponse('''<script>alert("stop deleted successfully");window.location='/view_route#services'</script>''')

def accept_bus(request,id):
    a=Bus.objects.filter(id=id).update(status='accepted')
    return HttpResponse('''<script>alert("Accepted");window.location='/verify_bus'</script>''')

def reject_bus(request,id):
    a = Bus.objects.filter(id=id).update(status='rejected')
    return HttpResponse('''<script>alert("rejected");window.location='/verify_bus'</script>''')


def add_routestop(request,id):
    ob = Route.objects.get(id=id)
    return render(request, 'admin/add stop 2.html',{'data':ob})


def add_routestop_post(request):
    id=request.POST['id']
    stop_name=request.POST['textfield']
    ob=Stop()
    ob.stop_name=stop_name
    ob.time=request.POST['time']
    ob.latitude=1.0
    ob.longitude=1.3
    ob.ROUTE=Route.objects.get(id=id)
    ob.save()
    return HttpResponse('''<script>alert("added successfully");window.location='/view_route#services'</script>''')



def add_time_schesule(request):
    ob=Route.objects.all()
    b=Bus.objects.all()
    return render(request,'admin/add time schedule.html',{"route":ob,"bus":b})

def submit_schedule(request):
    route=request.POST['route']
    bus=request.POST['bus']
    stime= request.POST['stime']
    etime = request.POST['etime']
    trip=request.POST['trip']
    busname=request.POST['busname']
    ob=Time()
    ob.routename=Route.objects.get(id=route)
    ob.BUS=Bus.objects.get(id=bus)
    ob.starttime=stime
    ob.endtime=etime
    ob.tripname=trip
    ob.busname=busname
    ob.save()
    return HttpResponse('''<script>alert("added successfully");window.location='/view_schedule'</script>''')





def view_schedule(request):
    # ob=Time.objects.all(id=id)
    ob=Time.objects.all()
    kk=Route.objects.all()

    return render(request, 'admin/view schedule.html',{'data':ob,'route':kk})

def view_schedule_search(request):
    route=request.POST['route']
    ob=Time.objects.filter(routename__id=route)
    kk = Route.objects.all()
    return render(request, 'admin/view schedule.html',{'data':ob,'route':kk})

def dlt_schedule(request,id):

    ob = Time.objects.get(id=id)
    rid=ob.routename.id
    ob.delete()
    return HttpResponse('''<script>alert("deleted successfully");window.location='/view_schedule'</script>''')




def add_time_schedule(request,id):
    request.session['tid']=id
    ob = Time.objects.get(id=id)
    rid = ob.routename.id

    obs = Stop.objects.filter(ROUTE__id=rid)

    obtrip=Bustrip.objects.filter(TIME=id)

    return render(request, "admin/bustri.html", {"val": obs,"trip":obtrip})

def add_time_schedule_post(request):
    id=request.session['tid']
    ob = Time.objects.get(id=id)
    rid = ob.routename.id

    obs = Stop.objects.filter(ROUTE__id=rid)
    for i in obs:
        time=request.POST[str(i.id)]

        onx=Bustrip.objects.filter(stop=i,TIME=ob)
        if len(onx)>0:
            obst = Bustrip.objects.get(id=onx[0].id)
            obst.TIME = ob
            obst.stop = i
            obst.stoptime = time
            obst.save()
        else:

            obst=Bustrip()
            obst.TIME=ob
            obst.stop=i
            obst.stoptime=time
            obst.save()
    return HttpResponse('''<script>alert(" added successfully");window.location='/view_schedule'</script>''')


def verify_bus(request):
    ob=Bus.objects.all().order_by('-id')
    return render(request, 'admin/verify bus.html',{'data':ob})

def search_bus(request):
    num = request.POST['textfield']
    ob=Bus.objects.filter(bus_no__icontains=num)
    return render(request, 'admin/verify bus.html',{'data': ob})


def view_stop(request):
    a=Stop.objects.all()
    return render(request, 'admin/all stop.html',{'data':a})


def edit_stops(request,id):
    request.session['sid']=id
    obb=Stop.objects.get(id=id)
    ob = Route.objects.all()
    return render(request, 'admin/edit stops.html',{'data':ob,'val':obb})


def edit_stops_post(request):
    stop_name=request.POST['stop']
    ROUTE=request.POST['route']
    latitude = request.POST['lat']
    longitude = request.POST['lon']

    ob= Stop.objects.get(id=request.session['sid'])
    ob.longitude=longitude
    ob.latitude=latitude
    ob.ROUTE=Route.objects.get(id=ROUTE)
    ob.stop_name=stop_name
    ob.save()
    return HttpResponse('''<script>alert("edited successfully");window.location='/view_stop'</script>''')






    # stop_name = request.POST.get('textfield')
    # ROUTE = request.POST.get('route')
    # latitude = request.POST.get('lat')  # Correct syntax for fetching from POST
    # longitude = request.POST.get('lon')
    #
    # try:
    #     # Fetch the Stop object using the session-stored ID
    #     stop_instance = Stop.objects.get(id=request.session['rid'])
    #
    #     # Update the Stop object with the new data
    #     stop_instance.stop_name = stop_name
    #     stop_instance.latitude = float(latitude)  # Ensure latitude is converted to float
    #     stop_instance.longitude = float(longitude)  # Ensure longitude is converted to float
    #     stop_instance.ROUTE_id = ROUTE  # Update the ForeignKey field using the related ID
    #     stop_instance.save()
    #
    #     # Provide feedback and redirect
    #     return HttpResponse('''<script>alert("Edited successfully");window.location='/view_stop'</script>''')
    # except Stop.DoesNotExist:
    #     return HttpResponse('''<script>alert("Error: Stop not found.");window.location='/view_stop'</script>''')
    # except Exception as e:
    #     return HttpResponse(f'''<script>alert("Error: {str(e)}");window.location='/view_stop'</script>''')


def add_stop(request):
    return render(request, 'admin/all stop 2.html')

def route_edit(request,id):
    request.session['rid'] = id
    ob = Route.objects.get(id=request.session['rid'])
    return render(request, 'admin/route edit.html',{'val':ob})

def route_edit_post(request):
    from_place=request.POST['textfield']
    to_place=request.POST['textfield2']

    ob=Route.objects.get(id=request.session['rid'])
    ob.from_place=from_place
    ob.to_place=to_place
    ob.save()
    return HttpResponse('''<script>alert("edited successfully");window.location='/view_route'</script>''')

#owner------------------

def bus_form(request):
    return render(request, 'owner/bus form.html')

def bus_owner(request):
    return render(request, 'owner/bus owner.html')

def own_reg(request):
    return render(request, 'owner/own reg.html')


def own_details(request):
    try:
        name=request.POST['textfield']
        place=request.POST['textfield2']
        password=request.POST['textfield3']
        pin=request.POST['textfield4']
        email=request.POST['textfield5']
        phone=request.POST['textfield6']
        username=request.POST['textfield7']
        image=request.FILES['file']
        cp=request.POST['textfield9']
        fs=FileSystemStorage()
        fn=fs.save(image.name,image)
        if password == cp:
            ob1=Login()
            ob1.username=username
            ob1.password=password
            ob1.type='owner'
            ob1.save()
            ob=Owner()
            ob.LOGIN=ob1
            ob.name=name
            ob.place=place
            ob.pin=pin
            ob.email=email
            ob.phone=phone
            ob.image=fn
            ob.save()
            return HttpResponse('''<script>alert("added successfully");window.location='/'</script>''')
        else:
            return HttpResponse('''<script>alert("Invalid Password");window.location='/own_reg'</script>''')
    except:
        return HttpResponse('''<script>alert("Fill out all fields");window.location='/own_reg'</script>''')


def home(request):
    return render(request, 'owner/owner homepage.html')

def reg_bus(request):
    ob=Bus.objects.filter(OWNER__LOGIN__id=request.session['lid'])
    return render(request, 'owner/Reg bus.html',{"data":ob})

def reg_bus2(request):
    return render(request, 'owner/reg bus2.html')

def reg_bus2post(request):
    name=request.POST['textfield']
    bus_no=request.POST['textfield2']
    model=request.POST['textfield3']
    year=request.POST['textfield4']
    certificates=request.FILES['file']
    ob=Bus()
    ob.OWNER=Owner.objects.get(LOGIN__id=request.session['lid'])
    ob.name=name
    ob.status= 'pending'
    ob.bus_no=bus_no
    ob.model=model
    ob.year=year
    ob.certificate=certificates
    ob.save()
    return HttpResponse('''<script>alert("added successfully");window.location='/reg_bus'</script>''')


    return render(request, 'owner/reg bus2.html')

    return HttpResponse('''<script>alert("added successfully");window.location='/reg_bus.html'</script>''')

def delete_bus(request,id):
    request.session['bid'] = id
    ob = Bus.objects.get(id=request.session['bid'])
    ob.delete()
    return HttpResponse('''<script>alert("deleted successfully");window.location='/reg_bus'</script>''')

# def bus_edit(request):

def staff_mng2(request):
    a=Bus.objects.all()
    return render(request, 'owner/staff mngement 2.html',{'data':a})

def staff_mng2post(request):
     name=request.POST['textfield']
     ph_no= request.POST['textfield2']
     email= request.POST['textfield3']
     image=request.FILES['file']
     role= request.POST['select']
     bus=request.POST['select2']
     username=request.POST['textfield4']
     password=request.POST['textfield5']

     fs = FileSystemStorage()
     fp=fs.save(image.name,image)
     ow = Owner.objects.get(LOGIN=request.session['lid'])
     bu = Bus.objects.get(id=bus)


     log = Login()
     log.username=username
     log.password=password
     log.type='staff'
     log.save()

     ob=Staff()
     ob.LOGIN=log
     ob.OWNER=ow
     ob.name=name
     ob.email=email
     ob.phone=ph_no
     ob.image=fp
     ob.role=role
     ob.busname=bu
     ob.save()
     return HttpResponse('''<script>alert("added successfully");window.location='/staff_mng'</script>''')


def staff_mng(request):
    owner = Owner.objects.get(LOGIN=request.session['lid'])
    ob=Staff.objects.filter(OWNER=owner)
    return render(request, 'owner/Staff_Management.html',{'data':ob})

def staff_edit(request,id):
    request.session['sid'] = id
    ob = Staff.objects.get(id=request.session['sid'])
    data = Bus.objects.filter(OWNER__LOGIN__id=request.session['lid'])
    return render(request, 'owner/edit staff.html',{'val':ob,'data':data})

def staff_edit_post(request):
    name = request.POST['textfield']
    ph_no = request.POST['textfield2']
    email = request.POST['textfield3']
    role = request.POST['select']
    bus = request.POST['select2']

    ob=Staff.objects.get(id=request.session['sid'])
    bu = Bus.objects.get(id=bus)

    ob.name=name
    ob.email=email
    ob.phone=ph_no
    if 'file' in request.FILES:
        image = request.FILES['file']
        fs = FileSystemStorage()
        fp = fs.save(image.name, image)
        ob.image=fp
        ob.save()
    ob.role=role
    ob.busname=bu
    ob.save()
    return HttpResponse('''<script>alert("edited successfully");window.location='/staff_mng'</script>''')

def delete_staff(request,id):
    request.session['sid']=id
    ob=Staff.objects.get(id=request.session['sid'])
    ob.delete()
    return HttpResponse('''<script>alert("deleted successfully");window.location='/staff_mng'</script>''')

def ow_view_schedule(request):
    # ob=Time.objects.all(id=id)
    ob=Time.objects.all()
    kk=Route.objects.all()
    res=[]
    for i in ob:
        lob=BusStatus.objects.filter(TIME__id=i.id)
        loc=""
        for j in lob:
            obl=Location.objects.filter(staff__id=j.STAFF.id)
            print(obl)
            if len(obl)>0:
                loc="http://maps.google.com?q="+str(obl[0].latitude)+","+str(obl[0].longitude)
                print(loc)
                i.loc=loc
                print(i.BUS.bus_no)
                break
        else:
            i.loc=loc
        res.append(i)
    print("++++++++++++++++++++++++++++++++++++++")
    print(res)
    return render(request, 'owner/view schedule.html',{'data':res,'route':kk})

def view_collection(request,id):
    print(id)
    ob=Collection.objects.filter(staff__busname__id=id)
    print(ob,"kkkkkkkkkkkkkkk")

    return render(request, 'owner/view collection.html',{'data':ob})




#
#
# def ow_view_schedule_search(request):
#     res=[]
#     print(request.POST)
#     route=request.POST['route']
#     ob=Time.objects.filter(routename__id=route)
#     kk = Route.objects.all()
#     for i in ob:
#         lob=BusStatus.objects.filter(TIME__id=i.id)
#         loc=""
#         for j in lob:
#             obl=Location.objects.filter(staff__id=j.STAFF.id)
#             if len(obl)>0:
#                 loc="http://maps.google.com?q="+str(obl[0].latitude)+","+str(obl[0].longitude)
#                 i.loc=loc
#                 break
#         res.append(i)
#     print("++++++++++++++++++++++++++++++++++++++")
#     print(res)
#     return render(request, 'owner/view schedule.html',{'data':res,'route':kk})




# def ow_view_schedule_search(request):
#     if request.method == 'POST':
#         try:
#             route_id = request.POST.get('route')
#             if not route_id:
#                 messages.error(request, "Please select a route")
#                 return redirect('ow_view_schedule')
#             # Optimized query with prefetch_related
#             schedules = Time.objects.filter(
#                 routename__id=route_id
#             ).select_related('BUS', 'routename').prefetch_related(
#                 'busstatus_set__STAFF__location_set'
#             )
#
#             all_routes = Route.objects.all()
#             results = []
#
#             for schedule in schedules:
#                 schedule.loc = ""
#                 for status in schedule.busstatus_set.all():
#                     if hasattr(status.STAFF, 'location_set') and status.STAFF.location_set.exists():
#                         location = status.STAFF.location_set.first()
#                         schedule.loc = f"http://maps.google.com?q={location.latitude},{location.longitude}"
#                         break
#
#                 results.append(schedule)
#
#             return render(request, 'owner/view schedule.html', {
#                 'data': results,
#                 'route': all_routes,
#                 'selected_route': int(route_id)
#             })
#
#         except ValueError:
#             messages.error(request, "Invalid route selection")
#             # return redirect('ow_view_schedule')
#             return redirect(reverse('ow_view_schedule'))  # Use reverse()
#         except Exception as e:
#             messages.error(request, f"An error occurred: {str(e)}")
#             return redirect('ow_view_schedule')
#
#     return redirect('ow_view_schedule')

def ow_view_schedule_search(request):
    if request.method == 'POST':
        try:
            route_id = request.POST.get('route')

            # Validate route selection
            if not route_id or route_id == '----SELECT---':
                messages.error(request, "Please select a route")
                return redirect('/ow_view_schedule/')

            # Convert to integer safely
            try:
                route_id = int(route_id)
            except ValueError:
                messages.error(request, "Invalid route selection")
                return redirect('/ow_view_schedule/')

            # Optimized query with prefetch_related
            schedules = Time.objects.filter(
                routename__id=route_id
            ).select_related('BUS', 'routename').prefetch_related(
                'busstatus_set__STAFF__location_set'
            )

            all_routes = Route.objects.all()
            results = []

            for schedule in schedules:
                schedule.loc = ""
                for status in schedule.busstatus_set.all():
                    if hasattr(status.STAFF, 'location_set') and status.STAFF.location_set.exists():
                        location = status.STAFF.location_set.first()
                        schedule.loc = f"http://maps.google.com?q={location.latitude},{location.longitude}"
                        break

                results.append(schedule)

            return render(request, 'owner/view schedule.html', {
                'data': results,
                'route': all_routes,
                'selected_route': route_id
            })

        except Exception as e:
            messages.error(request, f"An error occurred: {str(e)}")
            return redirect('ow_view_schedule')

    return redirect('/ow_view_schedule/')









def feedback(request):
    feedback_data = Feedback.objects.all().order_by('-id')
    return render(request,'admin/feedback.html',{"data":feedback_data})

def edit_bus(request,id):
    request.session['bid']=id
    ob=Bus.objects.get(id=request.session['bid'])
    return render(request,'owner/edit bus.html',{'val':ob})

def edit_bus_post(request):
    name = request.POST['textfield']
    bus_no = request.POST['textfield2']
    model = request.POST['textfield3']
    year = request.POST['textfield4']

    if 'file' in request.FILES:
        image = request.FILES['file']

        fs = FileSystemStorage()
        fp = fs.save(image.name, image)
        ob = Bus.objects.get(id=request.session['bid'])
        ob.certificate = fp
        ob.name = name
        ob.bus_no = bus_no
        ob.model = model
        ob.year = year
        ob.save()
        return HttpResponse('''<script>alert("edited successfully");window.location='/reg_bus'</script>''')

    else:
        ob = Bus.objects.get(id=request.session['bid'])
        ob.name = name
        ob.bus_no = bus_no
        ob.model = model
        ob.year = year
        ob.save()
        return HttpResponse('''<script>alert("edited successfully");window.location='/reg_bus'</script>''')


# ---------------------android-------------------


def andrologin(request):
    uname=request.POST["username"]
    pwd=request.POST["password"]
    try:
        user = Login.objects.get(username=uname, password=pwd)
        return JsonResponse({'status':'ok','lid':str(user.id),'type':user.type})
    except:
        return JsonResponse({'status':'not'})



def view_routes(request):
   ob=Route.objects.all()
   data=[]
   for i in ob:
       r={"id":i.id,"from":i.from_place,"to":i.to_place}
       data.append(r)
   return JsonResponse({"status":"ok","data":data})

def view_stops(request):
    rid=request.POST['rid']
    ob=Stop.objects.filter(ROUTE__id=rid)
    data=[]
    for i in ob:
       r={"id":i.id,"Stop Name":i.stop_name,"Latitude":i.latitude,"Longitude":i.longitude}
       data.append(r)
    print(data)
    return JsonResponse({"status":"ok","data":data})

def view_bus(request):
    rid = request.POST.get('rid', 1)  # Use `request.POST.get` to fetch `rid` and default to 1 if not provided
    obu=Staff.objects.get(LOGIN__id=rid)
    ob = Time.objects.filter(BUS=obu.busname)  # Fetch buses based on `rid`
    data = []
    for i in ob:
        status_obj = BusStatus.objects.filter(TIME=i).order_by('-id').first()  # Get latest status
        status = status_obj.status if status_obj else "No Status Available"
        data.append({
            'id': i.id,
            'bus_name': i.BUS.name,
            'start time': i.starttime,
            'end time': i.endtime,
            'bus_no': i.BUS.bus_no,
            'status': status,
        })
    print(data)
    return JsonResponse({"status": "ok", "data": data})




def view_bus1(request):
    rid = request.POST.get('rid', 1)  # Use `request.POST.get` to fetch `rid` and default to 1 if not provided

    ob = Time.objects.filter(routename=rid) # Fetch buses based on `rid`
    data = []
    for i in ob:
        status_obj = BusStatus.objects.filter(TIME=i).order_by('-id').first()  # Get latest status
        status = status_obj.status if status_obj else "No Status Available"
        loc="Na"
        obl=Location.objects.filter(staff__busname__id=i.BUS.id)
        if len(obl)>0:
            loc="http://maps.google.com?q="+str(obl[0].latitude)+","+str(obl[0].longitude)
        data.append({
            'id': i.id,
            'bus_name': i.BUS.name,
            'start time': i.starttime,
            'end time': i.endtime,
            'bus_no': i.BUS.bus_no,
            'status': status,
            'loc': loc,
        })
    print(data)
    return JsonResponse({"status": "ok", "data": data})

def view_stoptime(request):
    tid=request.POST['rid']

    print(tid,"==")
    ob=Bustrip.objects.filter(TIME_id=tid)
    data = []
    for i in ob:
        data.append({
            'id':i.id,
            'stop':i.stop.stop_name,
            'stoptime':i.stoptime,
        })
    return JsonResponse({"status": "ok", "data": data})



def user_viewprofile(request):
    # print(request.POST,'kkkkkkkkkkkkk')
    # lid = request.POST['lid']
    # ob = User.objects.get(LOGIN_id=lid)
    # data = {
    #     'id': ob.id,
    #     'name': ob.name,
    #     'place': ob.place,
    #     'email': ob.email,
    #     'phone': str(ob.phone),
    # }
    # print(data)
    # return JsonResponse({"status": "ok", "data": data})
        try:
            lid = request.POST['lid']
            ob = User.objects.get(LOGIN_id=lid)
            data = {
                'status': 'ok',
                'name': ob.name,
                'place': ob.place,
                'email': ob.email,
                'phone': str(ob.phone),
            }
            return JsonResponse(data)
        except ObjectDoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'User not found'}, status=404)
        except KeyError:
            return JsonResponse({'status': 'error', 'message': 'Invalid request'}, status=400)
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)


def staff_viewprofile(request):
        try:
            print("Request Data:", request.POST)  # Debugging: Print request data
            lid = request.POST['lid']
            print("LID:", lid)  # Debugging: Print LID

            ob = Staff.objects.get(LOGIN_id=lid)
            print("Staff Object:", ob)  # Debugging: Print staff object

            data = {
                'status': 'ok',
                'name': ob.name,
                'email': ob.email,
                'phone': str(ob.phone),
                'role': ob.role,
                'busname': ob.busname.name,
                'image': request.build_absolute_uri(ob.image.url) if ob.image else None,
            }
            print("Response Data:", data)  # Debugging: Print response data
            return JsonResponse(data)

        except Staff.DoesNotExist:
            print("Staff not found")  # Debugging: Print error
            return JsonResponse({'status': 'error', 'message': 'Staff not found'}, status=404)

        except KeyError:
            print("Invalid request: Missing 'lid'")  # Debugging: Print error
            return JsonResponse({'status': 'error', 'message': 'Invalid request'}, status=400)

        except Exception as e:
            print("Error:", str(e))  # Debugging: Print error
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)




def registrationcode(request):
        print(request.POST, "uuuki")
        name=request.POST['name']
        place = request.POST['place']
        email=request.POST['email']
        ph_no=request.POST['phone']
        username=request.POST['username']
        pwd=request.POST['password']
        lob1=Login()
        lob1.username = username
        lob1.password = pwd
        lob1.type = 'user'
        lob1.save()
        lob=User()
        lob.name = name
        lob.place =place
        lob.phone = ph_no
        lob.email = email
        lob.LOGIN =lob1
        lob.save()
        print("uuuuuuuuu",lob)
        return JsonResponse({'task':'success'})

def bustrip(request):
        return render(request, 'bustri.html')
def bustrip2(request):
    return


def user_send_feedback(request):
    from datetime import datetime
    feedback = request.POST['feedback']
    rating = request.POST['rating']
    lid = request.POST['lid']
    user=User.objects.get(LOGIN=lid)

    ob=Feedback()
    ob.date=datetime.today()
    ob.USER=user
    ob.feedback=feedback
    ob.rating=rating
    ob.save()
    return JsonResponse({'status':'ok'})
def staff_send_collection(request):
    # from datetime import datetime

    print(request.POST)
    amount = request.POST['amount']
    count = request.POST['count']
    lid = request.POST['lid']
    date = request.POST['date'].split('T')[0]



    s=Staff.objects.get(LOGIN=lid)
    obx = Collection.objects.filter(staff=s,date__exact=date)

    if len(obx)>0:
        return JsonResponse({'status': 'exist'})
    else:

        ob=Collection()
        ob.date=date
        ob.staff=s
        ob.amount=amount
        ob.count=count
        ob.save()
        return JsonResponse({'status':'ok'})

def update_bus_status(request):
    if request.method == "POST":
        try:
            lid = request.POST.get('lid')
            status = request.POST.get('status')

            staff = Staff.objects.get(LOGIN=lid)
            bus = staff.busname

            time_entry = Time.objects.get(BUS=bus)

            bus_status, created = BusStatus.objects.update_or_create(
                STAFF=staff,
                TIME=time_entry,
                defaults={'status': status}
            )

            return JsonResponse({'status': 'ok', 'message': 'Bus status updated successfully'})

        except Staff.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Staff not found'})

        except Time.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Time entry not found'})

        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})

    return JsonResponse({'status': 'error', 'message': 'Invalid request method'})

# def view_shedule(request):
#     tid=request.POST['rid']
#     ob=Bustrip.objects.filter(TIME_id=tid)
#     data = []
#     for i in ob:
#         data.append({
#             'id':i.id,
#             'stop':i.stop.stop_name,
#             'stoptime':i.stoptime,
#         })
#     return JsonResponse({"status": "ok", "data": data})




def view_routes_staff(request):
   ob=Route.objects.all()
   data=[]
   for i in ob:
       r={"id":i.id,"from":i.from_place,"to":i.to_place}
       data.append(r)
   return JsonResponse({"status":"ok","data":data})



def view_stop_user(request):
   ob=Stop.objects.all()
   data=[]
   for i in ob:
       r={"id":i.id,"from":i.from_place,"to":i.to_place}
       data.append(r)
   return JsonResponse({"status":"ok","data":data})




from datetime import datetime, timedelta

def get_dates_between(start_date, end_date):

    # Convert the input strings to datetime objects
    start = datetime.strptime(start_date, "%Y-%m-%d")
    end = datetime.strptime(end_date, "%Y-%m-%d")

    date_list = []

    # Loop through the dates from start to end (inclusive)
    current_date = start
    while current_date <= end:
        date_list.append(current_date.strftime("%Y-%m-%d"))  # Append the formatted date
        current_date += timedelta(days=1)  # Move to the next day

    return date_list




from .forecast import generate_data,forecastdata
def view_bus_schedule(request):
    # Fetch all records from the Time model
    bus_schedules = Time.objects.select_related('BUS', 'routename').all()

    reslist=[]
    obc = Collection.objects.all().order_by("date")
    sd=obc[0].date
    ed=obc[len(obc)-1].date
    dates=get_dates_between(str(sd),str(ed))
    print("dates")
    print(dates)
    reslist=[]
    for i in bus_schedules:
        x=[]
        y=[]
        r=[]
        try:
            for j in dates:

                coll_data = Collection.objects.filter(date=j, staff__busname=i.BUS).first()
                if coll_data:
                    x.append(int(coll_data.amount))
                else:
                    x.append(0)
                y.append(j)
            print(x)
            print("=============++++++++++++++++++")
            print("=============++++++++++++++++++")
            print("=============++++++++++++++++++")
            res=forecastdata(x)

            print(res)

            xx=[]
            for kk in res:
                xx.append(str(kk).replace("[","").replace("]",""))
            i.fd = ', '.join(xx)
        except Exception as e:
            print(e)
            i.fd="No Data"
        reslist.append(i)
        print("==========================================")


    # Pass the data to the template
    context = {
        'bus_schedules': reslist
    }

    return render(request, 'owner/view_bus_schedule.html', context)





# def reschedule(request):
#     bus_schedules = Time.objects.select_related('BUS', 'routename').all()
#
#     reslist = []
#     obc = Collection.objects.all().order_by("date")
#     sd = obc[0].date
#     ed = obc[len(obc) - 1].date
#     dates = get_dates_between(str(sd), str(ed))
#     print("dates")
#     print(dates)
#     reslist = []
#     fdet=[]
#     for i in bus_schedules:
#         x = []
#         y = []
#         r = []
#         try:
#             for j in dates:
#
#                 coll_data = Collection.objects.filter(date=j, staff__busname=i.BUS).first()
#                 if coll_data:
#                     x.append(int(coll_data.amount))
#                 else:
#                     x.append(0)
#                 y.append(j)
#             print(x)
#             print("=============++++++++++++++++++")
#             print("=============++++++++++++++++++")
#             print("=============++++++++++++++++++")
#             res = forecastdata(x)
#
#             print(res)
#
#             xx = []
#             for kk in res:
#                 xx.append(str(kk).replace("[", "").replace("]", ""))
#             fdet.append(xx)
#
#         except Exception as e:
#             print(e)
#             fdet.append([0])
#         reslist.append(i)
#         print("==========================================")
#
#     # Pass the data to the template
#     context = {
#         'bus_schedules': reslist
#     }
#
#     return render(request, 'owner/view_bus_schedule.html', context)
#


def reschedule(request):
    # Fetch all bus schedules with related BUS and Route data
    bus_schedules = Time.objects.select_related('BUS', 'routename').all()

    reslist = []
    fdet = []

    # Fetch collection data and calculate dates
    obc = Collection.objects.all().order_by("date")
    sd = obc[0].date
    ed = obc[len(obc) - 1].date
    dates = get_dates_between(str(sd), str(ed))

    print("Dates:", dates)

    # Process each bus schedule
    for i in bus_schedules:
        x = []
        try:
            # Fetch collection data for each date
            for j in dates:
                coll_data = Collection.objects.filter(date=j, staff__busname=i.BUS).first()
                if coll_data:
                    x.append(int(coll_data.amount))
                else:
                    x.append(0)

            # Generate forecasting data
            res = forecastdata(x)
            xx = [float(str(kk).replace("[", "").replace("]", "")) for kk in res]
            fdet.append({"rid":i.routename.id,"fc":sum(xx)/len(xx)})

        except Exception as e:
            print("Error:", e)
            xx=[0]
            fdet.append({"rid": i.routename.id, "fc": sum(xx) / len(xx)})
            # Default forecasting data in case of error

        reslist.append(i)
    sorted_fdet = sorted(fdet, key=lambda x: x["fc"], reverse=True)
    # Sort reslist based on seat capacity (descending order)
    reslist.sort(key=lambda x: int(x.BUS.model), reverse=True)
    sorted_fdet1=[]
    for i in sorted_fdet:
        obr=Route.objects.get(id=i['rid'])
        i["from_place"]=obr.from_place
        i["to_place"]=obr.to_place
        sorted_fdet1.append(i)

    # Pair reslist with forecasting data
    paired_data = list(zip(reslist, sorted_fdet1))

    # Sort paired_data based on forecasting data (descending order)
    # paired_data.sort(key=lambda x: max(map(float, x[1])), reverse=True)
    print(paired_data)
    # Prepare the context for the template
    context = {
        'bus_schedules': paired_data,  # Pass the paired data to the template
    }

    return render(request, 'owner/rescheduled.html', context)


def updatelocation(request):
    print(request.POST)
    lid = request.POST['lid']
    lat = request.POST['lat']
    long = request.POST['lon']
    ob = Location.objects.filter(staff__LOGIN__id=lid)
    if len(ob)==0:
        ob=Location()
        ob.staff =Staff.objects.get(LOGIN_id=lid)
        ob.latitude = lat
        ob.longitude = long
        ob.save()
    else:
        ob=ob[0]
        ob.latitude = lat
        ob.longitude = long
        ob.save()
    return JsonResponse({'status': 'ok'})

def search_buses(request):
    from_location = request.GET.get('from')
    to_location = request.GET.get('to')

    if not from_location or not to_location:
        print("qwertyu")
        return JsonResponse({'error': 'Missing parameters'}, status=400)

    from_stops = Stop.objects.filter(stop_name__icontains=from_location)
    to_stops = Stop.objects.filter(stop_name__icontains=to_location)
    print(from_stops)
    print(to_stops)
    bus_routes = []
    for from_stop in from_stops:
        for to_stop in to_stops:
            if from_stop.ROUTE == to_stop.ROUTE:
                times = Time.objects.filter(routename=from_stop.ROUTE)
                for time in times:
                    loc = "Na"
                    obl = Location.objects.filter(staff__busname__id=time.BUS.id)
                    if len(obl) > 0:
                        loc = "http://maps.google.com?q=" + str(obl[0].latitude) + "," + str(obl[0].longitude)
                    bus_routes.append({
                        'id': time.id,
                        'bus_name': time.busname,
                        'start_time': time.starttime,
                        'end_time': time.endtime,
                        'trip_name': time.tripname,
                        'loc': loc,
                        'bid': time.BUS.id
                    })
    print(bus_routes)
    return JsonResponse({'routes': bus_routes})




def get_stops(request):
    stops = Stop.objects.values_list('stop_name', flat=True)
    return JsonResponse({"status": "ok", "stops": list(stops)})


def live_tracking(request,id):
    request.session['bid']=id



    return render(request, "owner/map.html")
    return render(request, "owner/map.html", {"lat": 11.7763068, "lon":75.5134902})
import random
def get_bus_location(request):


    random_number = random.uniform(11.12, 11.89)
    print(random_number)
    lat=random_number
    random_number = random.uniform(75.400, 75.67)
    print(random_number)

    return  JsonResponse({"lat": lat, "lon":random_number})


def view_nearest_ambulances(request):
    try:
        ambulances = ambulance_table.objects.all()
        mdata = []

        for ambulance in ambulances:
            location = location_table.objects.filter(LOGIN=ambulance.LOGIN).order_by('-date').first()

            data = {
                'Ambulance': ambulance.VehicleNumber,
                'Hospital': ambulance.Hospital.name,
                'Type': ambulance.Type,
                'Status': ambulance.Status,
                'id': ambulance.id,
                'Latitude': str(location.Latitude) if location else None,
                'Longitude': str(location.Longitude) if location else None,
            }
            mdata.append(data)


        return JsonResponse({"status": "ok", "data": mdata})
    except:
        pass

def live_loc1(request):
    request.session['bid']=request.GET['bid']
    bid = request.session['bid']
    obl = Location.objects.filter(staff__busname__id=bid)
    latitude = 11
    longitude = 75
    if len(obl) > 0:
        latitude = float(obl[0].latitude)
        longitude = float(obl[0].longitude)
    print(latitude, longitude)

    return render(request,"owner/sampleloc.html",{
        'latitude': latitude,
        'longitude': longitude,
    })
def getlocation(request):
    bid=request.session['bid']
    print(bid)
    obl = Location.objects.filter(staff__busname__id=bid)
    print(obl)
    latitude=11
    longitude=75
    if len(obl) > 0:
        latitude=float(obl[0].latitude)
        longitude=float(obl[0].longitude)
    print(latitude,longitude)
    return JsonResponse({
        'latitude': latitude,
        'longitude': longitude,
    })


def get_all_stops(request):
    try:
        # Get all unique stop names ordered alphabetically
        stops = Stop.objects.values_list('stop_name', flat=True).distinct().order_by('stop_name')

        return JsonResponse({
            'status': 'ok',
            'stops': list(stops)
        })

    except Exception as e:
        return JsonResponse({
            'status': 'error',
            'message': str(e)
        }, status=500)








