from django.core.management.base import BaseCommand, CommandError
from home.models import RoomPage
import os
import csv

class Command(BaseCommand):
    help = 'Import RoomPage data from CSV file'
        
    def add_arguments(self, parser):
        parser.add_argument('-f', '--file',
            dest='filename',
            help='Path to file containing room data in CSV format')

    def handle(self, *args, **options):
        fn = options['filename']
        # if fn and os.path.isfile(fn):
        #     self.stdout.write(self.SUCCESS('File "{}" exists!'.format(fn)))
        # else:
        #     self.stdout.write(self.ERROR('Error with File "{}"'.format(fn)))
        #     exit(1)

        with open(fn, 'rb') as csvfile:
            roomreader = csv.reader(csvfile, delimiter=';', quotechar='"')
            pth = 00010001000100050005
            for row in roomreader:
                 pth = pth + 1
                 #print ', '.join(row[0])        # RoomPage
                 #print ', '.join(row[1])        # RoomPage
                 r, created = RoomPage.objects.get_or_create(title=row[0],
                    defaults = {
                    'title': row[0],
                    'body': row[1],
                    'free': False,
                    'public': True,
                    'depth': 5,
                    #r.numclhild = 0
                    'live': True,
                    'slug': row[0],
                    'path': str(pth),
                 #r.has_unpublished_changes = False
                 #r.path = ''
                 #r.url_path = "/home/tilajakamo/huoneet/%s/",row[0]
                     'seo_title': row[0],
                     'show_in_menus': False,
                     #r.search_description = row[1]
                     'expired': False,
                     'content_type_id': 15,
                     'locked': False,
                     'owner_id': 1,
                    }
                )
                 print r.path
                 print created
        #     try:
        #         poll = Poll.objects.get(pk=poll_id)
        #     except Poll.DoesNotExist:
        #         raise CommandError('Poll "%s" does not exist' % poll_id)
        #
        #     poll.opened = False
        #     poll.save()
        #
        #     self.stdout.write(self.style.SUCCESS('Successfully closed poll "%s"' % poll_id))