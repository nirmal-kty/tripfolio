from django.db import models

# Create your models here.
class Login(models.Model):
    username = models.CharField(max_length=50)
    password = models.CharField(max_length=50)
    type = models.CharField(max_length=15)

class Owner(models.Model):
    LOGIN = models.ForeignKey(Login,on_delete=models.CASCADE)
    name = models.CharField(max_length=40)
    place = models.CharField(max_length=40)
    pin = models.IntegerField()
    email = models.CharField(max_length=40)
    phone = models.BigIntegerField()
    image = models.FileField()

class Route(models.Model):
    from_place = models.CharField(max_length=40)
    to_place = models.CharField(max_length=40)

class Stop(models.Model):
    stop_name = models.CharField(max_length=40)
    time=models.CharField(max_length=100)
    ROUTE = models.ForeignKey(Route,on_delete=models.CASCADE)
    latitude=models.FloatField()
    longitude=models.FloatField()

class Bus(models.Model):
    OWNER = models.ForeignKey(Owner,on_delete=models.CASCADE)
    name = models.CharField(max_length=50)
    bus_no = models.CharField(max_length=100,null=True)
    model = models.CharField(max_length=50)
    year = models.IntegerField()
    certificate = models.FileField()
    status = models.CharField(max_length=50)


class Time(models.Model):
    BUS = models.ForeignKey(Bus,on_delete=models.CASCADE)
    routename = models.ForeignKey(Route,on_delete=models.CASCADE)
    busname = models.CharField(max_length=50)
    starttime = models.CharField(max_length=50)
    endtime = models.CharField(max_length=50)
    tripname = models.CharField(max_length=50)


class Staff(models.Model):
    LOGIN = models.ForeignKey(Login,on_delete=models.CASCADE)
    OWNER = models.ForeignKey(Owner,on_delete=models.CASCADE)
    name = models.CharField(max_length=50)
    email = models.CharField(max_length=40)
    phone = models.BigIntegerField()
    image = models.FileField()
    role = models.CharField(max_length=50)
    busname=models.ForeignKey(Bus,on_delete=models.CASCADE)


class User(models.Model):
    name = models.CharField(max_length=50)
    place = models.CharField(max_length=50)
    phone = models.BigIntegerField()
    email = models.CharField(max_length=50)
    LOGIN = models.ForeignKey(Login,on_delete=models.CASCADE)


class Feedback(models.Model):
    date = models.DateField()
    USER = models.ForeignKey(User, on_delete=models.CASCADE)
    feedback=models.TextField()
    rating=models.FloatField()


class Bustrip(models.Model):
   TIME = models.ForeignKey(Time,on_delete=models.CASCADE)
   stop = models.ForeignKey(Stop,on_delete=models.CASCADE)
   stoptime= models.CharField(max_length=50)

class BusStatus(models.Model):
    STAFF=models.ForeignKey(Staff,on_delete=models.CASCADE)
    TIME=models.ForeignKey(Time,on_delete=models.CASCADE)
    status=models.TextField()

class Collection(models.Model):
    staff= models.ForeignKey(Staff, on_delete=models.CASCADE)
    date = models.DateField(max_length=50)
    count = models.CharField(max_length=50)
    amount = models.CharField(max_length=50)

class Location(models.Model):
    staff= models.ForeignKey(Staff, on_delete=models.CASCADE)
    latitude = models.CharField(max_length=50)
    longitude = models.CharField(max_length=50)


class NewLocation(models.Model):
    STOP=models.ForeignKey(Stop,on_delete=models.CASCADE)
    date=models.DateField()
    time=models.TimeField()



