# Generated by Django 3.0.8 on 2020-07-23 10:10

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0022_auto_20200723_1659'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='bookinstance',
            name='borrow_date',
        ),
    ]
