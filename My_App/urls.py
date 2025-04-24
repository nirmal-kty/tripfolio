from django.urls import path

from My_App import views

urlpatterns = [
    path('', views.login),
    path('login_post', views.login_post),
    path('admin_home', views.admin_home),
    path('view_route', views.view_route),

    path('admin_add_stops', views.admin_add_stops),
    path('admin_add_stops_post', views.admin_add_stops_post),

    path('edit_stops/<int:id>', views.edit_stops),

    path('add_route', views.add_route),
    path('edit_stops_post', views.edit_stops_post),
    path('mng_stop/<int:id>', views.mng_stop),
    path('add_routestop/<id>', views.add_routestop),
    path('add_time_schesule', views.add_time_schesule),
    path('view_schedule', views.view_schedule),
    path('verify_bus', views.verify_bus),
    path('search_bus', views.search_bus),
    path('view_stop', views.view_stop),
    path('add_stop', views.add_stop),
    path('route_edit/<int:id>', views.route_edit),
    path('add_route_post', views.add_route_post),
    path('delete_route/<int:id>', views.delete_route),
    path('route_edit_post', views.route_edit_post),
    path('add_routestop_post', views.add_routestop_post),
    path('delete_stop/<int:id>', views.delete_stop),
    path('accept_bus/<id>', views.accept_bus),
    path('reject_bus/<id>', views.reject_bus),

    path('submit_schedule', views.submit_schedule),
    path('view_schedule_search', views.view_schedule_search),
    path('dlt_schedule/<int:id>', views.dlt_schedule),
    path('reschedule', views.reschedule),


    # --------owner--------

    path('bus_form', views.bus_form),

    path('bus_owner', views.bus_owner),

    path('own_reg', views.own_reg),

    path('home', views.home),

    path('reg_bus', views.reg_bus),
    path('delete_bus/<id>', views.delete_bus),
    path('edit_bus/<id>', views.edit_bus),
    path('edit_bus_post', views.edit_bus_post),

    path('staff_mng', views.staff_mng),
    path('staff_mng2', views.staff_mng2),
    path('staff_mng2post', views.staff_mng2post),
    path('own_details', views.own_details),


    # path('ow_view_schedule', views.ow_view_schedule, name='ow_view_schedule'),
    # path('ow_view_schedule_search', views.ow_view_schedule_search, name='ow_view_schedule_search'),
    # path('reg_bus',views.reg_bus)


    path('ow_view_schedule/', views.ow_view_schedule),
    path('ow_view_schedule_search/', views.ow_view_schedule_search),
    path('ow_view_schedule/view_collection/<int:id>/', views.view_collection, name='view_collection'),
    path('ow_view_schedule_search/view_collection/<int:id>/', views.view_collection, name='view_collection'),

    path('reg_bus2', views.reg_bus2),
    path('reg_bus2post', views.reg_bus2post),
    path('staff_edit/<id>', views.staff_edit),
    path('staff_edit_post', views.staff_edit_post),
    path('delete_staff/<int:id>', views.delete_staff),
    path('feedback', views.feedback),
    path('view_bus_schedule/', views.view_bus_schedule, name='view_bus_schedule'),
    path('search_buses/', views.search_buses, name='search_buses'),

    # path('map_view/', views.map_view, name='map_view'),


    #----------flutter----------

    path('andrologin',views.andrologin),
    path('registrationcode',views.registrationcode),
    path('view_routes',views.view_routes),
    path('view_stops', views.view_stops),
    path('view_bus', views.view_bus),
    path('add_time_schedule/<id>', views.add_time_schedule),
    path('view_collection/<id>', views.view_collection),
    path('add_time_schedule_post', views.add_time_schedule_post),
    path('view_stoptime', views.view_stoptime),
    path('user_send_feedback', views.user_send_feedback),
    path('update_bus_status', views.update_bus_status),
    path('view_routes_staff', views.view_routes_staff),
    path('staff_send_collection',views.staff_send_collection),
    path('view_bus1',views.view_bus1),
    path('user_viewprofile',views.user_viewprofile),
    path('staff_viewprofile',views.staff_viewprofile),
    path('updatelocation',views.updatelocation),
    path('get_stops', views.get_stops, name='get_stops'),
    path('live_tracking/<id>', views.live_tracking, name='live_tracking'),
    path('get_bus_location', views.get_bus_location, name='get_bus_location'),
    path('live_loc1', views.live_loc1, name='live_loc1'),
    path('get-location/', views.getlocation, name='getlocation'),
    path('get_all_stops/', views.get_all_stops, name='get_all_stops'),



]
