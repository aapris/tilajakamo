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
            pth = 5
            for row in roomreader:
                 pth = pth + 1
                 r, created = RoomPage.objects.update_or_create(title=row[0],
                    defaults = {
                    'depth':5,
                    'slug':row[0], 
                    'path': str('0001000100010005{:04d}'.format(pth) ),
                    'url_path': ("/home/tilajakamo/huoneet/%s/" %row[0]),
                    #'title': row[0],
                    'body': row[1],
                    }
                )
                 print r
        #     try:
        #         poll = Poll.objects.get(pk=poll_id)
        #     except Poll.DoesNotExist:
        #         raise CommandError('Poll "%s" does not exist' % poll_id)
        #
        #     poll.opened = False
        #     poll.save()
        #
        #     self.stdout.write(self.style.SUCCESS('Successfully closed poll "%s"' % poll_id))