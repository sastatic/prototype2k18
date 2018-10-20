import os
import uuid

from PIL import Image
from django.db import models
from django.conf import settings


def scramble_uploaded_filename(instance, filename):
    extension = filename.split(".")[-1]
    return "{}.{}".format(uuid.uuid4(), extension)

class MVCard (models.Model):
    image = models.ImageField("Uploaded image", upload_to=scramble_uploaded_filename, null=True, blank=True)
    name = models.CharField(max_length=200, null=True, blank=True)
    address = models.CharField(max_length=300, null=True, blank=True)
    designation = models.CharField(max_length=70, null=True, blank=True)
    email = models.EmailField(max_length=70, null=True, blank=True)
    phone = models.CharField(max_length=100, null=True, blank=True)
    git = models.CharField(max_length=100, null=True, blank=True)
    linkedin = models.CharField(max_length=100, null=True, blank=True)
    website = models.CharField(max_length=100, null=True, blank=True)
    # def save(self, force_update=False, using=None, update_fields=None):
        # card = Ocr(os.path.realpath(image.filename))
        # self.email = card.email_extract()
        # super(MVCard, self).save(force_update=force_update)
