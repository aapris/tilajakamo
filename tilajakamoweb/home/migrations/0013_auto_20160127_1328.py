# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0012_auto_20160127_1328'),
    ]

    operations = [
        migrations.RenameField(
            model_name='faqindexpage',
            old_name='body',
            new_name='intro',
        ),
    ]
