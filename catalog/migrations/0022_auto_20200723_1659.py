# Generated by Django 3.0.8 on 2020-07-23 09:59

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0021_bookinstance_borrow_at'),
    ]

    operations = [
        migrations.RenameField(
            model_name='bookinstance',
            old_name='borrow_at',
            new_name='borrow_date',
        ),
    ]