from django.db import models

class Hit(models.Model):
    date_added = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return self.date_added.strftime('%Y-%m-%d %H:%M:%S')
