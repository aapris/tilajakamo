# -*- coding: utf-8 -*-
# Generated by Django 1.9.1 on 2016-03-01 14:01
from __future__ import unicode_literals

from django.db import migrations
import wagtail.wagtailcore.fields


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0026_auto_20160301_1136'),
    ]

    operations = [
        migrations.AddField(
            model_name='roompage',
            name='ad',
            field=wagtail.wagtailcore.fields.RichTextField(blank=True),
        ),
    ]
