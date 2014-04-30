from django.conf.urls import patterns, url

from . import views

urlpatterns = patterns(
    '',
    url(r'^$', views.IndexView.as_view(), name='index'),
    url(r'^contact/$', views.ContactView.as_view(), name='contact'),
    url(r'^contact/thank-you/$', views.ContactSentView.as_view(), name='contact-sent'),
    url(r'^pricing/$', views.PricingView.as_view(), name='pricing'),
    url(r'^projects/$', views.ProjectsView.as_view(), name='projects'),
)
