from django.urls import path
from . import views
from .views import news_list, news_detail, indexView ,ContactsView , nimadir,ichiga, searchBlog, rahbariyat_view, indexViewEN, indexViewRU, news_detailEN, news_detailRU
urlpatterns = [
    path("", indexView, name="indexView"), 
    path("ru", indexViewRU, name="indexViewRU"), 
    path("en", indexViewEN, name="indexViewEN"), 
    path("all/", news_list, name="all_news_list"), 
    path("<slug:news1>/", news_detail, name="news_detail_page"),
    path("en/<slug:news1>/", news_detailEN, name="news_detail_pageEN"),
    path("ru/<slug:news1>/", news_detailRU, name="news_detail_pageRU"),
    path("contacts/", ContactsView, name="contacts"),
    path("nimadir/", nimadir, name="nimadir"),
    path("ichiga", ichiga, name="ichiga"),
    path('news/<int:news_id>/', views.ichiga, name="ichiga"),
    path('signin', views.signin, name="signin"),
    path('reg', views.reg, name='reg'),
    path('category/<slug:slug>/', views.category_view, name='category_view'),
    path('category/en/<slug:slug>/', views.category_view_en, name='category_view_en'),
    path('category/ru/<slug:slug>/', views.category_view_ru, name='category_view_ru'),
    path('allblogs', views.allblogs, name='allblogs'),
    path('search', views.searchBlog, name='search_blog'),  # Add this line for the search functionality
    path('search/en', views.searchBlog_en, name='search_blog_en'),  # Add this line for the search functionality
    path('search/ru', views.searchBlog_ru, name='search_blog_ru'),  # Add this line for the search functionality
    path('allnews', views.allnews, name='allnews'),  # Add this line for the search functionality
    path('allnews/ru', views.allnews_ru, name='allnews_ru'),  # Add this line for the search functionality
    path('allnews/en', views.allnews_en, name='allnews_en'),  # Add this line for the search functionality
    path('rahbariyat', rahbariyat_view, name='rahbariyat'),  # Update to the new function name
    path('rahbariyat/en', views.rahbariyat_viewEN, name='rahbariyat_en'),  # Update to the new function name
    path('rahbariyat/ru', views.rahbariyat_viewRU, name='rahbariyat_ru'),  # Update to the new function name

]