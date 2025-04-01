from django.db import models
from django.utils import timezone
from django.urls import reverse
from django.utils.text import slugify

class Category(models.Model):
    name = models.CharField(max_length=255)
    slug = models.SlugField(unique=True, blank=True)

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.name)  # Kategoriya nomidan slug yaratish
        super().save(*args, **kwargs)

    def __str__(self):
        return self.name
    

class News(models.Model):
    class Status(models.TextChoices):
        Draft = "DF", "Draft"
        Published = "PB", "Published"

    title = models.CharField(max_length=255)
    slug = models.SlugField(max_length=255, unique=True)  # Slugni unikal qilib belgilash
    body = models.TextField()
    image = models.ImageField(upload_to='news/images')
    category = models.ForeignKey(Category, related_name='news', on_delete=models.CASCADE)
    created_time = models.DateTimeField(auto_now_add=True)
    publish_time = models.DateTimeField(default=timezone.now)
    update_time = models.DateTimeField(auto_now=True)
    status = models.CharField(max_length=2, choices=Status.choices)

    def __str__(self):
        return self.title
    
    def get_absolute_url(self):
        return reverse("news_detail_page", args=[self.slug])
    def get_absolute_url_en(self):
        return reverse("news_detail_pageEN", args=[self.slug])
    def get_absolute_url_ru(self):
        return reverse("news_detail_pageRU", args=[self.slug])
class Rahbariyat(models.Model):
    class Status(models.TextChoices):
        Draft = "DF", "Draft"
        Published = "PB", "Published"

    name = models.CharField(max_length=255)
    job = models.CharField(max_length=1600)
    image = models.ImageField(upload_to='news/images')
    created_time = models.DateTimeField(auto_now_add=True)
    publish_time = models.DateTimeField(default=timezone.now)
    update_time = models.DateTimeField(auto_now=True)
    status = models.CharField(max_length=2, choices=Status.choices)

    def __str__(self):
        return self.name
    

from django.db import models
from django.utils import timezone

class CurrencyRate(models.Model):
    code = models.CharField(max_length=3, verbose_name="Valyuta kodi")
    name = models.CharField(max_length=50, verbose_name="Valyuta nomi")
    rate = models.FloatField(verbose_name="Kurs")
    date = models.DateTimeField(default=timezone.now, verbose_name="Sana")
    
    class Meta:
        verbose_name = "Valyuta kursi"
        verbose_name_plural = "Valyuta kurslari"
        ordering = ['-date']
    
    def __str__(self):
        return f"{self.code} - {self.rate}"