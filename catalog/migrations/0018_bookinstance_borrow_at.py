# Generated by Django 3.0.8 on 2020-07-23 09:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0017_remove_bookinstance_borrow_at'),
    ]

    operations = [
        migrations.AddField(
            model_name='bookinstance',
            name='borrow_at',
            field=models.DateTimeField(auto_now_add=True, null=True),
        ),
    ]
