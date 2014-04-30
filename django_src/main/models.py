from django.db import models


class Project(models.Model):
    """
    The projects showcased on the website.
    """

    name = models.CharField(max_length=31)
    slug = models.SlugField()
    sidebar_image = models.FileField(upload_to="projects/sidebar/",
                                     help_text="The sidebar image for this project.")
    large_image = models.FileField(upload_to="projects/large/",
                                   help_text="The large image for this project.")
    content_html = models.TextField(
        help_text="The content to display for this project.")
    order = models.PositiveSmallIntegerField(
        help_text="The order of the projects on the project page.")

    class Meta:
        ordering = ["order"]

    def __unicode__(self):
        return self.name
