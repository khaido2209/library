# Generated by Django 3.0.8 on 2020-07-23 06:57

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0009_auto_20200723_1356'),
    ]

    operations = [
        migrations.RenameField(
            model_name='reader',
            old_name='borrowed',
            new_name='book',
        ),
    ]