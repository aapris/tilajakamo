# -*- coding: utf-8 -*-
# Generated by Django 1.9.1 on 2016-01-26 14:51
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0007_auto_20160125_1803'),
    ]

    operations = [
        migrations.RenameField(
            model_name='faqindexpage',
            old_name='question',
            new_name='intro',
        ),
    ]
