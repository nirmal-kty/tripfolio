# Generated by Django 5.1.4 on 2025-03-12 07:41

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('My_App', '0008_collection_staff'),
    ]

    operations = [
        migrations.CreateModel(
            name='Location',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('latitude', models.CharField(max_length=50)),
                ('longitude', models.CharField(max_length=50)),
                ('staff', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='My_App.staff')),
            ],
        ),
    ]
