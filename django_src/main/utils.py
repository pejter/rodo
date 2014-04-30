from django.core.mail import EmailMessage
from django.conf import settings
from django.template.loader import render_to_string


def first_line(data):
    return data.strip().splitlines()[0]


def send_contact_email(contact_data):
    subject = render_to_string("main/mail/contact_subject.txt", contact_data)
    message = render_to_string("main/mail/contact_body.txt", contact_data)
    email = EmailMessage(first_line(subject), message,
                         settings.CONTACT_FROM_EMAIL,
                         [settings.CONTACT_TO_EMAIL],
                         headers={'Reply-To': first_line(
                             contact_data['email'])})
    email.send()
