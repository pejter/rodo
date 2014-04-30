from django.views.generic import TemplateView
from django.shortcuts import redirect
from .models import Project
from .forms import ContactForm
from .utils import send_contact_email


class IndexView(TemplateView):
    template_name = "main/index.html"


class PricingView(TemplateView):
    template_name = "main/pricing.html"


class ProjectsView(TemplateView):
    template_name = "main/projects.html"

    def get_context_data(self, **kwargs):
        context = super(ProjectsView, self).get_context_data(**kwargs)
        context['projects'] = Project.objects.all()
        return context


class ContactView(TemplateView):
    template_name = "main/contact.html"

    def get(self, request):
        form = ContactForm()
        return self.render_to_response({'form': form})

    def post(self, request):
        form = ContactForm(request.POST)
        if form.is_valid():
            cleaned_data = form.cleaned_data
            send_contact_email(cleaned_data)
            return redirect("main:contact-sent")
        return self.render_to_response({'form': form})


class ContactSentView(TemplateView):
    template_name = "main/contact_sent.html"
