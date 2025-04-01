"""
URL configuration for piyoz project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('/k5#M@9xQ2pL8v$Y!nZ7cR1tW3eD6gH4jU9iK0oP5lA7sS2dF4gH7jK8lO3iU9yT2rE5wQ@m8B#v6N*k9L2pX4sD7fG1hJ3kL9oP0iU8yT2rE5wQ3tY7uI1oP9iK8lO3jU4hG6fDq3W$e5R%t7Y*u8I(o9P0iA1sS2dF4gH7jK8lO3iU9yT2rE5wQ3tY7uI1oP9iK8lO3jU/', admin.site.urls),
    path("", include("blog.urls"))
]

if settings.DEBUG:
    urlpatterns+=static(settings.STATIC_URL, document_root=settings.MEDIA_ROOT)
    urlpatterns+=static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

