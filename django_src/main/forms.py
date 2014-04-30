from django import forms

PACKAGE_CHOICES = tuple(
    (c, c) for c in
    ["Starter", "Streamer", "YouTuber", "All Rounder"]
)


class ContactForm(forms.Form):
    name = forms.CharField(label="Your name")
    email = forms.EmailField(label="Your email")
    needs = forms.CharField(widget=forms.Textarea(
        attrs={'rows': 3}), label="Your needs")
    package = forms.ChoiceField(choices=PACKAGE_CHOICES,
                                label="Which package are you interested in?")
    special_requests = forms.CharField(required=False, widget=forms.Textarea(
        attrs={'rows': 3}), label="Any special requests?")
    how_found = forms.CharField(required=False, label="How did you find me?")
