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
        if fn and os.path.isfile(fn):
            self.stdout.write(self.style.SUCCESS('File "{}" exists!'.format(fn)))
        else:
            self.stdout.write(self.style.ERROR('Error with File "{}"'.format(fn)))
            exit(1)

        with open(fn, 'rb') as csvfile:
            roomreader = csv.reader(csvfile, delimiter=';', quotechar='"')
            for row in roomreader:
                 print ', '.join(row)        # RoomPage
                 # r, created = RoomPage.objects.get_or_create(id=row[0])
                 # r.info = row[1]
                 # r.save()
        #     try:
        #         poll = Poll.objects.get(pk=poll_id)
        #     except Poll.DoesNotExist:
        #         raise CommandError('Poll "%s" does not exist' % poll_id)
        #
        #     poll.opened = False
        #     poll.save()
        #
        #     self.stdout.write(self.style.SUCCESS('Successfully closed poll "%s"' % poll_id))