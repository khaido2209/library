# Generated by Django 3.0.8 on 2020-07-23 06:56

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0008_auto_20200723_1336'),
    ]

    operations = [
        migrations.AlterField(
            model_name='reader',
            name='borrowed',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='catalog.Book'),
        ),
        migrations.AlterField(
            model_name='reader',
            name='idcard',
            field=models.CharField(default='', help_text='9/12 Character', max_length=12, verbose_name='ID card'),
        ),
    ]
