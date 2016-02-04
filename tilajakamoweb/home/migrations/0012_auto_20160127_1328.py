# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import modelcluster.contrib.taggit


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0011_auto_20160126_1738'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='faqpagecarouselitem',
            name='image',
        ),
        migrations.RemoveField(
            model_name='faqpagecarouselitem',
            name='link_document',
        ),
        migrations.RemoveField(
            model_name='faqpagecarouselitem',
            name='link_page',
        ),
        migrations.RemoveField(
            model_name='faqpagecarouselitem',
            name='page',
        ),
        migrations.RemoveField(
            model_name='faqpagetag',
            name='content_object',
        ),
        migrations.RemoveField(
            model_name='faqpagetag',
            name='tag',
        ),
        migrations.RenameField(
            model_name='faqindexpage',
            old_name='intro',
            new_name='body',
        ),
        migrations.AlterField(
            model_name='faqpage',
            name='tags',
            field=modelcluster.contrib.taggit.ClusterTaggableManager(to='taggit.Tag', through='home.BlogPageTag', blank=True, help_text='A comma-separated list of tags.', verbose_name='Tags'),
        ),
        migrations.AlterField(
            model_name='formfield',
            name='choices',
            field=models.CharField(help_text='Comma separated list of choices. Only applicable in checkboxes, radio and dropdown.', max_length=512, verbose_name='Choices', blank=True),
        ),
        migrations.AlterField(
            model_name='formfield',
            name='default_value',
            field=models.CharField(help_text='Default value. Comma separated values supported for checkboxes.', max_length=255, verbose_name='Default value', blank=True),
        ),
        migrations.AlterField(
            model_name='formfield',
            name='field_type',
            field=models.CharField(max_length=16, verbose_name='Field type', choices=[('singleline', 'Single line text'), ('multiline', 'Multi-line text'), ('email', 'Email'), ('number', 'Number'), ('url', 'URL'), ('checkbox', 'Checkbox'), ('checkboxes', 'Checkboxes'), ('dropdown', 'Drop down'), ('radio', 'Radio buttons'), ('date', 'Date'), ('datetime', 'Date/time')]),
        ),
        migrations.AlterField(
            model_name='formfield',
            name='help_text',
            field=models.CharField(max_length=255, verbose_name='Help text', blank=True),
        ),
        migrations.AlterField(
            model_name='formfield',
            name='label',
            field=models.CharField(help_text='The label of the form field', max_length=255, verbose_name='Label'),
        ),
        migrations.AlterField(
            model_name='formfield',
            name='required',
            field=models.BooleanField(default=True, verbose_name='Required'),
        ),
        migrations.AlterField(
            model_name='formpage',
            name='from_address',
            field=models.CharField(max_length=255, verbose_name='From address', blank=True),
        ),
        migrations.AlterField(
            model_name='formpage',
            name='subject',
            field=models.CharField(max_length=255, verbose_name='Subject', blank=True),
        ),
        migrations.AlterField(
            model_name='formpage',
            name='to_address',
            field=models.CharField(help_text='Optional - form submissions will be emailed to this address', max_length=255, verbose_name='To address', blank=True),
        ),
        migrations.DeleteModel(
            name='FAQPageCarouselItem',
        ),
        migrations.DeleteModel(
            name='FAQPageTag',
        ),
    ]
