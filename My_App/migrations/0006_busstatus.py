# Generated by Django 5.1.4 on 2025-02-15 05:22

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('My_App', '0005_alter_feedback_rating'),
    ]

    operations = [
        migrations.CreateModel(
            name='BusStatus',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.TextField()),
                ('STAFF', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='My_App.staff')),
                ('TIME', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='My_App.time')),
            ],
        ),
    ]
