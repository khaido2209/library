# Generated by Django 3.0.8 on 2020-07-23 09:30

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0016_auto_20200723_1625'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='bookinstance',
            name='borrow_at',
        ),
    ]
