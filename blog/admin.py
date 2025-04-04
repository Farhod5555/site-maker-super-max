from django.contrib import admin

from .models import *
# admin.site.register(News)
admin.site.register(Category)

@admin.register(News)
class NewsAdmin(admin.ModelAdmin):
    list_display = ["title", "slug", "publish_time", "status"]
    list_filter = ["status", "publish_time"]
    prepopulated_fields = {"slug" : ("title",)}
    date_hierarchy = "publish_time"
    search_fields = ['title', 'body']
@admin.register(Rahbariyat)
class RahbariyatAdmin(admin.ModelAdmin):
    list_display = ["name", "publish_time", "status"]
    list_filter = ["status", "publish_time"]
    date_hierarchy = "publish_time"

