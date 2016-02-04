# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import modelcluster.fields


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0013_auto_20160127_1328'),
    ]

    operations = [
        migrations.AddField(
            model_name='personpage',
            name='telegram',
            field=models.CharField(max_length=255, blank=True),
        ),
        migrations.AlterField(
            model_name='blogpagetag',
            name='content_object',
            field=modelcluster.fields.ParentalKey(related_name='tagged_items', to='home.FAQPage'),
        ),
    ]
