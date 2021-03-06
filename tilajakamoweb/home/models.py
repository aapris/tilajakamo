#!/usr/bin/env python
# -*- coding: utf-8 -*-

from datetime import date

from django.db import models
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse
from django import forms

from wagtail.wagtailcore.models import Page, Orderable
from wagtail.wagtailcore.fields import RichTextField, StreamField
from wagtail.wagtailadmin.edit_handlers import FieldPanel, MultiFieldPanel, \
    InlinePanel, PageChooserPanel, StreamFieldPanel
from wagtail.wagtailimages.edit_handlers import ImageChooserPanel
from wagtail.wagtaildocs.edit_handlers import DocumentChooserPanel
from wagtail.wagtailsnippets.models import register_snippet
from wagtail.wagtailforms.models import AbstractEmailForm, AbstractFormField
from wagtail.wagtailsearch import index

from wagtail.wagtailcore.blocks import TextBlock, StructBlock, StreamBlock, FieldBlock, CharBlock, RichTextBlock, RawHTMLBlock
from wagtail.wagtailimages.blocks import ImageChooserBlock
from wagtail.wagtaildocs.blocks import DocumentChooserBlock

from modelcluster.fields import ParentalKey
from modelcluster.tags import ClusterTaggableManager
from taggit.models import TaggedItemBase

from .utils import export_event


EVENT_AUDIENCE_CHOICES = (
    ('public', "Public"),
    ('private', "Private"),
)

# Global Streamfield definition


class PullQuoteBlock(StructBlock):
    quote = TextBlock("quote title")
    attribution = CharBlock()

    class Meta:
        icon = "openquote"


class ImageFormatChoiceBlock(FieldBlock):
    field = forms.ChoiceField(choices=(
        ('left', 'Wrap left'), ('right', 'Wrap right'), ('mid', 'Mid width'), ('full', 'Full width'),
    ))


class HTMLAlignmentChoiceBlock(FieldBlock):
    field = forms.ChoiceField(choices=(
        ('normal', 'Normal'), ('full', 'Full width'),
    ))


class ImageBlock(StructBlock):
    image = ImageChooserBlock()
    caption = RichTextBlock()
    alignment = ImageFormatChoiceBlock()


class AlignedHTMLBlock(StructBlock):
    html = RawHTMLBlock()
    alignment = HTMLAlignmentChoiceBlock()

    class Meta:
        icon = "code"


class HomeStreamBlock(StreamBlock):
    h2 = CharBlock(icon="title", classname="title")
    h3 = CharBlock(icon="title", classname="title")
    h4 = CharBlock(icon="title", classname="title")
    intro = RichTextBlock(icon="pilcrow")
    paragraph = RichTextBlock(icon="pilcrow")
    aligned_image = ImageBlock(label="Aligned image", icon="image")
    pullquote = PullQuoteBlock()
    aligned_html = AlignedHTMLBlock(icon="code", label='Raw HTML')
    document = DocumentChooserBlock(icon="doc-full-inverse")


# A couple of abstract classes that contain commonly used fields

class LinkFields(models.Model):
    link_external = models.URLField("External link", blank=True)
    link_page = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        blank=True,
        related_name='+'
    )
    link_document = models.ForeignKey(
        'wagtaildocs.Document',
        null=True,
        blank=True,
        related_name='+'
    )

    @property
    def link(self):
        if self.link_page:
            return self.link_page.url
        elif self.link_document:
            return self.link_document.url
        else:
            return self.link_external

    panels = [
        FieldPanel('link_external'),
        PageChooserPanel('link_page'),
        DocumentChooserPanel('link_document'),
    ]

    class Meta:
        abstract = True


class ContactFields(models.Model):
    telephone = models.CharField(max_length=20, blank=True)
    email = models.EmailField(blank=True)
    address_1 = models.CharField(max_length=255, blank=True)
    address_2 = models.CharField(max_length=255, blank=True)
    city = models.CharField(max_length=255, blank=True)
    country = models.CharField(max_length=255, blank=True)
    post_code = models.CharField(max_length=10, blank=True)

    panels = [
        FieldPanel('telephone'),
        FieldPanel('email'),
        FieldPanel('address_1'),
        FieldPanel('address_2'),
        FieldPanel('city'),
        FieldPanel('country'),
        FieldPanel('post_code'),
    ]

    class Meta:
        abstract = True


# Carousel items

class CarouselItem(LinkFields):
    image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    embed_url = models.URLField("Embed URL", blank=True)
    caption = models.CharField(max_length=255, blank=True)

    panels = [
        ImageChooserPanel('image'),
        FieldPanel('embed_url'),
        FieldPanel('caption'),
        MultiFieldPanel(LinkFields.panels, "Link"),
    ]

    class Meta:
        abstract = True


# Related links

class RelatedLink(LinkFields):
    title = models.CharField(max_length=255, help_text=u"Link title")

    panels = [
        FieldPanel('title'),
        MultiFieldPanel(LinkFields.panels, "Link"),
    ]

    class Meta:
        abstract = True


# Advert Snippet

class AdvertPlacement(models.Model):
    page = ParentalKey('wagtailcore.Page', related_name='advert_placements')
    advert = models.ForeignKey('home.Advert', related_name='+')


class Advert(models.Model):
    page = models.ForeignKey(
        'wagtailcore.Page',
        related_name='adverts',
        null=True,
        blank=True
    )
    url = models.URLField(null=True, blank=True)
    text = models.CharField(max_length=255)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )


    panels = [
        PageChooserPanel('page'),
        FieldPanel('url'),
        FieldPanel('text'),
        ImageChooserPanel('feed_image'),
    ]

    def __unicode__(self):
        return self.text

register_snippet(Advert)


# Home Page

class HomePageCarouselItem(Orderable, CarouselItem):
    page = ParentalKey('home.HomePage', related_name='carousel_items')


class HomePageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('home.HomePage', related_name='related_links')


class HomePage(Page):
    body = RichTextField(blank=True)
    bg_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    # search_fields = Page.search_fields + [
    #     index.SearchField('body'),
    # ]

    def rooms(self):
        rooms = RoomPage.objects.live()
        return rooms.filter(free=True)

    def mypages(self, request):
        mypages = PersonPage.objects.live()
        return mypages#.filter(owner=request.user.id)

    class Meta:
        verbose_name = "Homepage"

HomePage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('body', classname="text"),
    ImageChooserPanel('bg_image'),

]

HomePage.promote_panels = Page.promote_panels


# Standard index page

class StandardIndexPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('home.StandardIndexPage', related_name='related_links')


# Standard page

class StandardIndexPage(Page):
    intro = RichTextField(blank=True)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    search_fields = Page.search_fields + [
        index.SearchField('intro'),
    ]

StandardIndexPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full"),
    InlinePanel('related_links', label="Related links"),
]

StandardIndexPage.promote_panels = Page.promote_panels + [
    ImageChooserPanel('feed_image'),
]



class StandardPageCarouselItem(Orderable, CarouselItem):
    page = ParentalKey('home.StandardPage', related_name='carousel_items')


class StandardPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('home.StandardPage', related_name='related_links')


class StandardPage(Page):
    intro = RichTextField(blank=True)
    body = RichTextField(blank=True)
    public = models.BooleanField(default=True)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    search_fields = Page.search_fields + [
        index.SearchField('intro'),
        index.SearchField('body'),
    ]

StandardPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full"),
    FieldPanel('public', classname="public"),
    # InlinePanel('carousel_items', label="Carousel items"),
    FieldPanel('body', classname="full"),
    ImageChooserPanel('feed_image'),
    InlinePanel('related_links', label="Related links"),
]

StandardPage.promote_panels = Page.promote_panels + [
    ImageChooserPanel('feed_image'),
]

# Room

class RoomPage(Page):
    free = models.BooleanField(default=False, help_text=u"Jos haluat ilmoittaa huoneen olevan osittain, kokonaan tai määräaikaisesti vuokrattavissa.")
    body = RichTextField(blank=True)
    public = models.BooleanField(verbose_name="public", default=True, help_text=u"Onko huoneen tiedot julkiset myös osuuskunnan ulkopuolisille?")
    start = models.DateField("From", blank=True, null=True,help_text=u"Vapaa alkaen")
    end = models.DateField("To", blank=True, null=True, help_text=u"Vapaa asti")
    ad = RichTextField(blank=True,help_text=u"Vuokrauksen mainosteksti. Kerro huoneestasi jotain mukavaa.")
    # member = models.ForeignKey('home.PersonPage',         
    #     null=True,
    #     blank=True,
    #     on_delete=models.SET_NULL,
    #     related_name='+'
    # )
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    search_fields = Page.search_fields + [
        index.SearchField('body'),
        index.SearchField('free'),
    ]

    api_fields = ('public', 'member', 'body','free','start','end')

    def member(self):
        try:
            member = PersonPage.objects.filter(room = self).values('title','first_name','last_name','slug','public','intro','telegram')
            return member
        except:
            return
            
RoomPage.content_panels = [
    FieldPanel('title', classname="room number"),
    FieldPanel('public', classname="public"),
    FieldPanel('body', classname="description"),
    ImageChooserPanel('feed_image'),
    FieldPanel('free', classname="not rented"),
    FieldPanel('start', classname="free from"),
    FieldPanel('end', classname="free until"),
    FieldPanel('ad', classname="ad"),    

]

RoomPage.promote_panels = Page.promote_panels + [
        
]

class RoomIndexPage(Page):
    subpage_types = ['home.RoomPage','home.RoomIndexPage']

    intro = RichTextField(blank=True)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    search_fields = Page.search_fields + [
        index.SearchField('title'),
        index.SearchField('member'),
        index.SearchField('body'),
    ]

    def rooms(self):
        # Get list of live blog pages that are descendants of this page
        rooms = RoomPage.objects.live().child_of(self)
        # rooms.append(RoomIndexPage.objects.live().child_of(self))

        # Order by most recent date first
        rooms = rooms.order_by('title')

        return rooms
    
    def rooms2(self):
        # Get list of live blog pages that are descendants of this page
        rooms = RoomIndexPage.objects.live().child_of(self)
        # rooms.append(RoomIndexPage.objects.live().child_of(self))

        # Order by most recent date first
        rooms = rooms.order_by('title')

        return rooms
        
    # @property
    # def rooms(self):
    #     # Get list of live blog pages that are descendants of this page
    #     rooms = RoomPage.objects.live().descendant_of(self)

    #     # Order by most recent date first
    #     rooms = rooms.order_by('-date')

    #     return rooms

RoomIndexPage.content_panels = Page.content_panels + [
    FieldPanel('intro', classname="intro"),
    ImageChooserPanel('feed_image'),
]


# Blog page

class BlogPageCarouselItem(Orderable, CarouselItem):
    page = ParentalKey('home.BlogPage', related_name='carousel_items')


class BlogPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('home.BlogPage', related_name='related_links')


class BlogPageTag(TaggedItemBase):
    content_object = ParentalKey('home.BlogPage', related_name='tagged_items')


class BlogPage(Page):
    body = RichTextField(blank=True)
    tags = ClusterTaggableManager(through=BlogPageTag, blank=True)
    public = models.BooleanField(verbose_name="public", default=True)
    date = models.DateField("Post date")
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    search_fields = Page.search_fields + [
        index.SearchField('body'),
    ]

    api_fields = ('public', 'date', 'body')


    @property
    def blog_index(self):
        # Find closest ancestor which is a blog index
        return self.get_ancestors().type(BlogIndexPage).last()

BlogPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('date'),
    FieldPanel('body', classname="body"),
    FieldPanel('public', classname="public"),    
    # InlinePanel('carousel_items', label="Carousel items"),
    ImageChooserPanel('feed_image'),

]

BlogPage.promote_panels = Page.promote_panels + [
    FieldPanel('tags'),
    InlinePanel('related_links', label="Related links"),
]

# Blog index page

class BlogIndexPage(Page):
    intro = RichTextField(blank=True)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    search_fields = Page.search_fields + [
        index.SearchField('intro'),
    ]

    @property
    def blogs(self):
        # Get list of live blog pages that are descendants of this page
        blogs = BlogPage.objects.live().descendant_of(self)

        # Order by most recent date first
        blogs = blogs.order_by('-date')

        return blogs

    def get_context(self, request):
        # Get blogs
        blogs = self.blogs

        # Filter by tag
        tag = request.GET.get('tag')
        if tag:
            blogs = blogs.filter(tags__name=tag)

        # Pagination
        page = request.GET.get('page')
        paginator = Paginator(blogs, 10)  # Show 10 blogs per page
        try:
            blogs = paginator.page(page)
        except PageNotAnInteger:
            blogs = paginator.page(1)
        except EmptyPage:
            blogs = paginator.page(paginator.num_pages)

        # Update template context
        context = super(BlogIndexPage, self).get_context(request)
        context['blogs'] = blogs
        return context

BlogIndexPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full"),
    ImageChooserPanel('feed_image'),
    InlinePanel('related_links', label="Related links"),
]

BlogIndexPage.promote_panels = Page.promote_panels

class BlogIndexPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('home.BlogIndexPage', related_name='related_links')


# FAQ page

class FAQPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('home.FAQPage', related_name='related_links')

class FAQPageTag(TaggedItemBase):
    content_object = ParentalKey('home.FAQPage', related_name='tagged_items')

class FAQPage(Page):
    body = RichTextField(blank=True)
    public = models.BooleanField(default=True)
    tags = ClusterTaggableManager(through=FAQPageTag, blank=True)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    search_fields = Page.search_fields + [
        index.SearchField('body'),
        index.SearchField('free'),
    ]

    @property
    def faq_index(self):
        # Find closest ancestor which is a faq index
        return self.get_ancestors().type(FAQIndexPage).last()

    api_fields = ('public', 'body')

FAQPage.content_panels = [
    FieldPanel('title', classname="Question"),
    FieldPanel('public', classname="Public"),
    FieldPanel('body', classname="Anwser"),
    FieldPanel('tags', classname="Tagit"),
    InlinePanel('related_links', label="Related links"),

]

FAQPage.promote_panels = Page.promote_panels + [
    ImageChooserPanel('feed_image'),
]

class FAQIndexPage(Page):
    subpage_types = ['home.FAQPage']

    intro = RichTextField(blank=True)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    search_fields = Page.search_fields + [
        index.SearchField('title'),
        index.SearchField('body'),
    ]

    def faqs(self):
        # Get list of live blog pages that are descendants of this page
        FAQ = FAQPage.objects.live().descendant_of(self)

        # Order by most recent date first
        FAQ = FAQ.order_by('title')

        return FAQ

    @property
    def FAQ(self):
        # Get list of live blog pages that are descendants of this page
        FAQ = FAQPage.objects.live().descendant_of(self)

        # Order by most recent date first
        FAQ = FAQ.order_by('tags')

        return FAQ

FAQIndexPage.content_panels = [
    FieldPanel('title', classname="title"),
    FieldPanel('intro', classname="intro"),
    ImageChooserPanel('feed_image'),   
]


# Person page

class PersonPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('home.PersonPage', related_name='related_links')


class PersonPage(Page, ContactFields):
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    telegram = models.CharField(blank=True, max_length=255, help_text=u"Telegram-linkki")
    public = models.BooleanField(verbose_name="public", default=True, help_text=u"Onko sivusi julkinen myös osuuskunnan ulkopuolisille")
    room = models.ForeignKey('home.RoomPage',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
        help_text=u"Huoneesi numero"
    )
    intro = RichTextField(blank=True, help_text=u"Lyhyt esittely, joka näkyy myös Telergram-botin kyselyssä!")
    biography = RichTextField(blank=True, help_text=u"Pidempi kuvaus itsestäsi.")
    image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
        help_text=u"Huoneen tai muu kuva, joka näkyy myös huoneesi sivulla."
    )

    search_fields = Page.search_fields + [
        index.SearchField('first_name'),
        index.SearchField('last_name'),
        index.SearchField('telegram'),
        index.SearchField('intro'),
        index.SearchField('biography'),
        index.FilterField('first_name'),
        index.FilterField('last_name'),
        index.FilterField('telegram'),
        index.FilterField('intro'),
        index.FilterField('biography'),
    ]

    api_fields = ('public', 'room','telegram','last_name','first_name','intro')

PersonPage._meta.get_field('owner').editable=True

PersonPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="telegram intro"),
    FieldPanel('first_name', classname="first name"),
    FieldPanel('last_name', classname="last name"),
    FieldPanel('telegram', classname="telegram contact"),
    FieldPanel('room', classname="room #"),
    FieldPanel('public', classname="public"),
    FieldPanel('biography', classname="full"),
    ImageChooserPanel('image'),
    MultiFieldPanel(ContactFields.panels, "Contact"),
    InlinePanel('related_links', label="Related links"),
]

PersonPage.promote_panels = Page.promote_panels + [
]

PersonPage.settings_panels = Page.settings_panels + [
    FieldPanel('owner', classname="owner"),
]


class PersonIndexPage(Page):
    subpage_types = ['home.PersonPage']

    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    intro = RichTextField(blank=True)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    room = models.ForeignKey('home.RoomPage',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )  

    def persons(self):
        # Get list of live blog pages that are descendants of this page
        persons = PersonPage.objects.live().descendant_of(self)

        # Order by most recent date first
        persons = persons.order_by('last_name')

        return persons

    @property
    def name_display(self):
        return self.first_name + " " + self.last_name

    # @property
    # def persons(self):
    #     # Get list of live blog pages that are descendants of this page
    #     persons = PersonPage.objects.live().descendant_of(self)

    #     # Order by most recent date first
    #     persons = persons.order_by('title')

    #     return persons

PersonIndexPage.content_panels = [
    FieldPanel('title', classname="title"),
    FieldPanel('intro', classname="intro"),
    ImageChooserPanel('feed_image'),

]

# Contact page

class ContactPage(Page, ContactFields):
    body = RichTextField(blank=True)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    search_fields = Page.search_fields + [
        index.SearchField('body'),
    ]

ContactPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('body', classname="full"),
    MultiFieldPanel(ContactFields.panels, "Contact"),
]

ContactPage.promote_panels = Page.promote_panels + [
    ImageChooserPanel('feed_image'),
]


# Event index page

class EventIndexPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('home.EventIndexPage', related_name='related_links')


class EventIndexPage(Page):
    intro = RichTextField(blank=True)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    search_fields = Page.search_fields + [
        index.SearchField('intro'),
    ]

    @property
    def events(self):
        # Get list of live event pages that are descendants of this page
        events = EventPage.objects.live().descendant_of(self)

        # Filter events list to get ones that are either
        # running now or start in the future
        events = events.filter(date_from__gte=date.today())

        # Order by date
        events = events.order_by('date_from')

        return events

EventIndexPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full"),
    ImageChooserPanel('feed_image'),
    InlinePanel('related_links', label="Related links"),
]

EventIndexPage.promote_panels = Page.promote_panels


# Event page

class EventPageCarouselItem(Orderable, CarouselItem):
    page = ParentalKey('home.EventPage', related_name='carousel_items')


class EventPageRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('home.EventPage', related_name='related_links')


class EventPageSpeaker(Orderable, LinkFields):
    page = ParentalKey('home.EventPage', related_name='speakers')
    first_name = models.CharField("Name", max_length=255, blank=True)
    last_name = models.CharField("Surname", max_length=255, blank=True)
    image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    @property
    def name_display(self):
        return self.first_name + " " + self.last_name

    panels = [
        FieldPanel('first_name'),
        FieldPanel('last_name'),
        ImageChooserPanel('image'),
        MultiFieldPanel(LinkFields.panels, "Link"),
    ]


class EventPage(Page):
    date_from = models.DateField("Start date")
    date_to = models.DateField(
        "End date",
        null=True,
        blank=True,
        help_text=u"Not required if event is on a single day"
    )
    time_from = models.TimeField("Start time", null=True, blank=True)
    time_to = models.TimeField("End time", null=True, blank=True)
    audience = models.CharField(max_length=255, choices=EVENT_AUDIENCE_CHOICES)
    location = models.CharField(max_length=255)
    body = RichTextField(blank=True)
    cost = models.CharField(max_length=255)
    signup_link = models.URLField(blank=True)
    feed_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    search_fields = Page.search_fields + [
        index.SearchField('get_audience_display'),
        index.SearchField('location'),
        index.SearchField('body'),
    ]

    @property
    def event_index(self):
        # Find closest ancestor which is an event index
        return self.get_ancestors().type(EventIndexPage).last()

    def serve(self, request):
        if "format" in request.GET:
            if request.GET['format'] == 'ical':
                # Export to ical format
                response = HttpResponse(
                    export_event(self, 'ical'),
                    content_type='text/calendar',
                )
                response['Content-Disposition'] = 'attachment; filename=' + self.slug + '.ics'
                return response
            else:
                # Unrecognised format error
                message = 'Could not export event\n\nUnrecognised format: ' + request.GET['format']
                return HttpResponse(message, content_type='text/plain')
        else:
            # Display event page as usual
            return super(EventPage, self).serve(request)

EventPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('date_from'),
    FieldPanel('date_to'),
    FieldPanel('time_from'),
    FieldPanel('time_to'),
    FieldPanel('location'),
    FieldPanel('audience'),
    FieldPanel('cost'),
    FieldPanel('body', classname="full"),
    ImageChooserPanel('feed_image'),

]

EventPage.promote_panels = Page.promote_panels + [
    FieldPanel('signup_link'),
    InlinePanel('speakers', label="Speakers"),
    InlinePanel('related_links', label="Related links"),
]


class FormField(AbstractFormField):
    page = ParentalKey('FormPage', related_name='form_fields')


class FormPage(AbstractEmailForm):
    intro = RichTextField(blank=True)
    thank_you_text = RichTextField(blank=True)

FormPage.content_panels = [
    FieldPanel('title', classname="full title"),
    FieldPanel('intro', classname="full"),
    InlinePanel('form_fields', label="Form fields"),
    FieldPanel('thank_you_text', classname="full"),
    MultiFieldPanel([
        FieldPanel('to_address', classname="full"),
        FieldPanel('from_address', classname="full"),
        FieldPanel('subject', classname="full"),
    ], "Email")
]
