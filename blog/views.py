from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from .models import News, Category
import requests
# Create your views here.
from django.shortcuts import render

from django.contrib.auth.models import User
from django.contrib import messages
from django.shortcuts import redirect
from django.db import IntegrityError
from django.core.exceptions import ValidationError
from .models import Rahbariyat  # Adjust the import based on your project structure
from .models import News  # Adjust the import based on your project structure
from django.views.decorators.cache import cache_page
from django.utils.decorators import method_decorator

from django.contrib.auth.decorators import login_required


from django.contrib.auth import authenticate, login, logout
import requests
from datetime import datetime

# Create your views here.
from .models import Category

from django.shortcuts import render
from django.db.models import Q
from .models import *  # Ensure you import your News model

from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Q

def searchBlog(request):
    query = request.GET.get("search", "")  # Qidiruv so'rovi, bo'sh string default
    categories_list = Category.objects.all()
    
    # Qidiruv so'rovi bo'yicha yangiliklarni filtrlash
    queryset = News.objects.filter(
        Q(title__icontains=query) 
    ).order_by("-publish_time") if query else News.objects.none()

    total = queryset.count()
    
    # Sahifalashni sozlash (har sahifada 6 ta yangilik)
    paginator = Paginator(queryset, 9)
    page = request.GET.get('page')
    
    try:
        posts = paginator.page(page)
    except PageNotAnInteger:
        posts = paginator.page(1)
    except EmptyPage:
        posts = paginator.page(paginator.num_pages)

    context = {
        "total": total,
        "posts": posts,
        "categories_list": categories_list,
        "query": query  # Qidiruv so'rovini saqlab qolish
    }

    return render(request, "news/search-blogs.html", context)

















from django.db.models import Q
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from googletrans import Translator  # Tarjima qilish uchun import
from django.shortcuts import render
from .models import News, Category

def searchBlog_en(request):
    query = request.GET.get("search", "")  # Qidiruv so'rovi, bo'sh string default
    categories_list = Category.objects.all()

    # Tarjima qilish
    translator = Translator()

    # Qidiruv so'rovini aniqlash
    if query:
        # Faqat inglizcha qidiruv so'rovi uchun
        if query.isascii():  # Agar qidiruv so'rovi ingliz tilida bo'lsa
            # Ingliz tilidagi qidiruv so'rovini o'zbek tiliga tarjima qilish
            translated_query = translator.translate(query, dest='uz').text

            # Qidiruv so'rovi bo'yicha yangiliklarni filtrlash
            queryset = News.objects.filter(
                Q(title__icontains=translated_query)
            ).order_by("-publish_time")
        else:
            # O'zbekcha qidiruv so'rovi bo'lsa, to'g'ridan-to'g'ri qidirish
            queryset = News.objects.filter(
                Q(title__icontains=query)
            ).order_by("-publish_time")
    else:
        queryset = News.objects.none()  # Qidiruv so'rovi bo'lmasa, natija bo'lmaydi

    total = queryset.count()
    
    # Sahifalashni sozlash (har sahifada 9 ta yangilik)
    paginator = Paginator(queryset, 9)
    page = request.GET.get('page')
    
    try:
        posts = paginator.page(page)
    except PageNotAnInteger:
        posts = paginator.page(1)
    except EmptyPage:
        posts = paginator.page(paginator.num_pages)

    # Kategoriyalarni tarjima qilish
    for category in categories_list:
        category.name_en = translator.translate(category.name, dest='en').text

    # Yangiliklarni tarjima qilish
    for item in posts:
        item.title_en = translator.translate(item.title, dest='en').text

    context = {
        "total": total,
        "posts": posts,
        "categories_list": categories_list,
        "query": query  # Qidiruv so'rovini saqlab qolish
    }

    return render(request, "news/search-blogsEN.html", context)










def searchBlog_ru(request):
    query = request.GET.get("search", "")  # Qidiruv so'rovi, bo'sh string default
    categories_list = Category.objects.all()

    # Tarjima qilish
    translator = Translator()
    
    # Rus tilidagi qidiruv so'rovini o'zbek tiliga tarjima qilish
    translated_query_uz = translator.translate(query, dest='uz').text if query else ""

    # Qidiruv so'rovi bo'yicha yangiliklarni filtrlash
    queryset = News.objects.filter(
        Q(title__icontains=translated_query_uz)
    ).order_by("-publish_time") if translated_query_uz else News.objects.none()

    total = queryset.count()
    
    # Sahifalashni sozlash (har sahifada 9 ta yangilik)
    paginator = Paginator(queryset, 9)
    page = request.GET.get('page')
    
    try:
        posts = paginator.page(page)
    except PageNotAnInteger:
        posts = paginator.page(1)
    except EmptyPage:
        posts = paginator.page(paginator.num_pages)

    # Kategoriyalarni tarjima qilish
    for category in categories_list:
        category.name_ru = translator.translate(category.name, dest='ru').text

    # Yangiliklarni tarjima qilish
    for item in posts:
        item.title_ru = translator.translate(item.title, dest='ru').text

    context = {
        "total": total,
        "posts": posts,
        "categories_list": categories_list,
        "query": query  # Qidiruv so'rovini saqlab qolish
    }

    return render(request, "news/search-blogsRU.html", context)


























from .models import News, Category  # Adjust according to your models
from googletrans import Translator
from django.http import Http404

def translate_text(text, target='en'):
    try:
        translator = Translator()
        translation = translator.translate(text, dest=target)
        return translation.text
    except Exception as e:
        print(f"Tarjima qilishda xato: {e}")
        return text  # Asl matnni qaytarish







def news_list(request):
    news_list = News.objects.all()
    context = {
        "news_list": news_list
    }
    return render(request, "news/news_list.html", context)
# def allnews(request):
#     news = News.objects.all()
#     context = {
#         "news": news
#     }
    
#     return render(request, "news/allnews.html", context)
from django.core.paginator import Paginator

def allnews(request):
    news_list = News.objects.all().order_by("-publish_time")
    paginator = Paginator(news_list, 9)  # 6 tadan yangilik ko'rsatish
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    categories_list = Category.objects.all()

    return render(request, 'news/allnews.html', {'page_obj': page_obj, 'categories_list': categories_list})







def allnews_ru(request):
    news_list = News.objects.all().order_by("-publish_time")
    paginator = Paginator(news_list, 9)  # 9 tadan yangilik ko'rsatish
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    categories_list = Category.objects.all()

    # Tarjima qilish
    translator = Translator()
    
    # Kategoriyalarni tarjima qilish
    for category in categories_list:
        category.name_ru = translator.translate(category.name, dest='ru').text

    # Yangiliklarni tarjima qilish
    for item in page_obj:
        item.title_ru = translator.translate(item.title, dest='ru').text

    return render(request, 'news/allnewsRU.html', {
        'page_obj': page_obj,
        'categories_list': categories_list
    })










def allnews_en(request):
    news_list = News.objects.all().order_by("-publish_time")
    paginator = Paginator(news_list, 9)  # 9 tadan yangilik ko'rsatish
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    categories_list = Category.objects.all()

    # Tarjima qilish
    translator = Translator()
    
    # Kategoriyalarni tarjima qilish
    for category in categories_list:
        category.name_en = translator.translate(category.name, dest='en').text

    # Yangiliklarni tarjima qilish
    for item in page_obj:
        item.title_en = translator.translate(item.title, dest='en').text

    return render(request, 'news/allnewsEN.html', {
        'page_obj': page_obj,
        'categories_list': categories_list
    })









def news_detail(request, news1):
    news = get_object_or_404(News, slug = news1)
    categories_list = Category.objects.all()
    context = {
        "news": news,
        "categories_list": categories_list,
    }
    return render(request, "news/single_page.html", context)









def news_detailEN(request, news1):
    news = get_object_or_404(News, slug=news1)
    categories_list = Category.objects.all()

    # Tarjima qilish
    translator = Translator()

    # Kategoriyalarni tarjima qilish
    for category in categories_list:
        category.name_en = translator.translate(category.name, dest='en').text

    # Yangilikni ingliz tiliga tarjima qilish
    news.title_en = translator.translate(news.title, dest='en').text
    news.body_en = translator.translate(news.body, dest='en').text

    context = {
        "news": news,
        "categories_list": categories_list,
    }
    
    return render(request, "news/single_pageEN.html", context)







def news_detailRU(request, news1):
    news = get_object_or_404(News, slug=news1)
    categories_list = Category.objects.all()

    # Tarjima qilish
    translator = Translator()

    # Kategoriyalarni rus tiliga tarjima qilish
    for category in categories_list:
        category.name_ru = translator.translate(category.name, dest='ru').text

    # Yangilikni rus tiliga tarjima qilish
    news.title_ru = translator.translate(news.title, dest='ru').text
    news.body_ru = translator.translate(news.body, dest='ru').text

    context = {
        "news": news,
        "categories_list": categories_list,
    }
    
    return render(request, "news/single_pageRU.html", context)












def indexView(request):
    # Yangiliklar so'rovlari
    news = News.objects.all().order_by("-publish_time")[0:12]
    categories_list = Category.objects.all()
    yangilik = News.objects.all().filter(category_id__name="Yangiliklar").order_by("-publish_time")[:3]
    yangilik_one = News.objects.all().filter(category_id__name="Yangiliklar").order_by("-publish_time")[0]
    gazeta = News.objects.all().filter(category_id__name="“Iste’mol madaniyati” gazetasi").order_by("-publish_time")[:3]
    gazeta_one = News.objects.all().filter(category_id__name="“Iste’mol madaniyati” gazetasi").order_by("-publish_time")[0]
    tadbirlar = News.objects.all().filter(category_id__name="O'tkazilgan tadbirlardan fotolavhalar").order_by("-publish_time")[:3]
    tadbirlar_one = News.objects.all().filter(category_id__name="O'tkazilgan tadbirlardan fotolavhalar").order_by("-publish_time")[0]

    # Valyuta kurslari
    currency_rates = []
    try:
        response = requests.get('https://cbu.uz/uz/arkhiv-kursov-valyut/json/', timeout=5)
        data = response.json()
        
        # Kerakli valyutalar ro'yxati
        needed_currencies = {
            'USD': 'AQSH dollari',
            'EUR': 'Yevro',
            'RUB': 'Rossiya rubli',
            'GBP': 'Angliya funti',
            'CNY': 'Xitoy yuani'
        }
        
        for curr in data:
            if curr['Ccy'] in needed_currencies:
                currency_rates.append({
                    'code': curr['Ccy'],
                    'name': needed_currencies[curr['Ccy']],
                    'rate': float(curr['Rate']),
                    'diff': float(curr['Diff'])
                })
                # Faqat 5 ta valyutani olish
                if len(currency_rates) == 5:
                    break
                    
    except Exception as e:
        print(f"Valyuta kurslarini olishda xato: {e}")
        # Agar xato bo'lsa, bo'sh ro'yxat qaytariladi

    context = {
        "news": news,
        "categories_list": categories_list,
        "yangilik": yangilik,
        "yangilik_one": yangilik_one,
        "gazeta": gazeta,
        "gazeta_one": gazeta_one,
        "tadbirlar": tadbirlar,
        "tadbirlar_one": tadbirlar_one,
        "currency_rates": currency_rates,
        "rates_last_update": datetime.now().strftime("%d.%m.%Y %H:%M")
    }

    return render(request, "news/index.html", context)





def indexViewRU(request):
    return render(request, 'index.html')







def ContactsView(request):
    return render(request, "news/contact.html")
def signin(request):
    return render(request, "news/signin.html")
def ichiga(request):
    return render(request, "news/single_page.html")
    # context = {
    #     "news": News.objects.get(pk = news)
    # }
def nimadir(request):
    return render(request, "news/404.html")



    


def reg(request):
    if(request.POST):
        first_name  = request.POST['first_name']
        last_name   = request.POST['last_name']
        email       = request.POST['email']
        username    = request.POST['username']
        password    = request.POST['password']
        confirm     = request.POST['confirm']
        if(password != confirm):
            messages.error(request, 'Password mismatch')
            return redirect('signin')
        
        try: 
            user = User.objects.create_user(username, email, password)
            user.first_name = first_name
            user.last_name = last_name
            user.save()
            messages.success(request, 'Пользователь успешно создан!')
            return redirect('signin')
        except IntegrityError: # Проверка уникальности
            messages.error(request, 'Пользователь с таким именем или username или email уже существует')
            return redirect('signin')
        except ValidationError as e: # проверка валидации
            messages.error(request, f'Ошибка валидации: {e}')
            return redirect('signin')
        except Exception as e: # другие ошибки
            messages.error(request, f'Произошла ошибка: {e}')
            return redirect('signin')
        
    else:
        return redirect('signin')    










def category_view(request, slug):
    category = get_object_or_404(Category, slug=slug)
    
    # Faqat chop etilgan yangiliklarni filtirlash va tartiblash
    news_list = News.objects.filter(
        category=category, 
        status=News.Status.Published
    ).order_by('-publish_time')
    
    categories_list = Category.objects.all()
    
    # Sahifalashni sozlash (har sahifada 9 ta yangilik)
    paginator = Paginator(news_list, 9)
    page_number = request.GET.get('page')
    
    try:
        page_obj = paginator.page(page_number)
    except PageNotAnInteger:
        page_obj = paginator.page(1)
    except EmptyPage:
        page_obj = paginator.page(paginator.num_pages)

    return render(request, 'news/category_detail.html', {
        'category': category,
        'page_obj': page_obj,  # Sahifalangan natijalar
        'categories_list': categories_list,
    })






def category_view_en(request, slug):
    # Asosiy ma'lumotlarni olish
    category = get_object_or_404(Category, slug=slug)
    news_list = News.objects.filter(
        category=category, 
        status=News.Status.Published
    ).order_by('-publish_time')
    categories_list = Category.objects.all()
    
    # Tarjima qilish uchun sozlash
    translator = Translator()
    
    
        # Kategoriya nomini tarjima qilish
    for category in categories_list:
            category.name_en = translator.translate(category.name, dest='en').text
            
        # Yangiliklarni tarjima qilish
    for news in news_list:
            news.title_en = translator.translate(news.title, dest='en').text
            news.body_en = translator.translate(news.body, dest='en').text
        
        # Kategoriyalar ro'yxatini tarjima qilish
        
    
    # Sahifalash
    paginator = Paginator(news_list, 9)
    page_number = request.GET.get('page')
    try:
        page_obj = paginator.page(page_number)
    except PageNotAnInteger:
        page_obj = paginator.page(1)
    except EmptyPage:
        page_obj = paginator.page(paginator.num_pages)

    return render(request, 'news/category_detailEN.html', {
        'category': category,
        'page_obj': page_obj,
        'categories_list': categories_list,
    })





def category_view_ru(request, slug):
    # Asosiy ma'lumotlarni olish
    category = get_object_or_404(Category, slug=slug) 
    
    news_list = News.objects.filter(
        category=category, 
        status=News.Status.Published
    ).order_by('-publish_time')
    
    categories_list = Category.objects.all()
    
    # Tarjima qilish uchun sozlash
    translator = Translator()
    
        # Kategoriya nomini ruschaga tarjima qilish
    for category in categories_list:
            category.name_ru = translator.translate(category.name, dest='ru').text
            
        # Yangiliklarni tarjima qilish
    for news in news_list:
            news.title_ru = translator.translate(news.title, dest='ru').text
            news.body_ru = translator.translate(news.body, dest='ru').text 
        
        # Kategoriyalar ro'yxatini tarjima qilish
                
    
    # Sahifalash
    paginator = Paginator(news_list, 9)
    page_number = request.GET.get('page')
    try:
        page_obj = paginator.page(page_number)
    except PageNotAnInteger:
        page_obj = paginator.page(1)
    except EmptyPage:
        page_obj = paginator.page(paginator.num_pages)

    return render(request, 'news/category_detailRU.html', {
        'category': category,
        'page_obj': page_obj,
        'categories_list': categories_list,
    })







def allblogs(request):
    news = News.objects.all().order_by("-publish_time")
    categories_list = Category.objects.all()
    context = {
        "news": news,
        "categories_list": categories_list,
    }
    return render(request, 'news/search-blogs.html', context)


from .models import Rahbariyat  

def rahbariyat_view(request):
    Rahbar = Rahbariyat.objects.all().order_by("-publish_time")
    categories_list = Category.objects.all()
    context = {
        'Rahbar': Rahbar,
        "categories_list": categories_list,
    }
    return render(request, 'news/Rahbariyat.html', context)
def rahbariyat_viewEN(request):
    Rahbar = Rahbariyat.objects.all().order_by("-publish_time")
    categories_list = Category.objects.all()
    translator = Translator()
    for category in categories_list:
            category.name_en = translator.translate(category.name, dest='en').text
    Rahbar.job_en = translator.translate(Rahbar.job, dest='en').text
            
    context = {
        'Rahbar': Rahbar,
        "categories_list": categories_list,
    }
    return render(request, 'news/RahbariyatEN.html', context)
def rahbariyat_viewRU(request):
    Rahbar = Rahbariyat.objects.all().order_by("-publish_time")
    categories_list = Category.objects.all()
    translator = Translator()
    for category in categories_list:
            category.name_en = translator.translate(category.name, dest='ru').text
    Rahbar.job_ru = translator.translate(Rahbar.job, dest='ru').text
            
    context = {
        'Rahbar': Rahbar,
        "categories_list": categories_list,
    }
    return render(request, 'news/RahbariyatRU.html', context)































from django.shortcuts import render
from .models import News, Category
import requests
from datetime import datetime
from googletrans import Translator
@cache_page(60 * 15)
def indexViewEN(request):
    # Yangiliklar so'rovlari
    news = News.objects.all().order_by("-publish_time")[:12]
    categories_list = Category.objects.all()
    
    yangilik = News.objects.filter(category__name="Yangiliklar").order_by("-publish_time")[:3]
    gazeta = News.objects.filter(category__name="“Iste’mol madaniyati” gazetasi").order_by("-publish_time")[:3]
    tadbirlar = News.objects.filter(category__name="O'tkazilgan tadbirlardan fotolavhalar").order_by("-publish_time")[:3]

    # Tarjima qilish
    translator = Translator()
    
    # Yangiliklar sarlavhalarini tarjima qilish
    for item in gazeta:
        item.title_en = translator.translate(item.title, dest='en').text

    for item in yangilik:
        item.title_en = translator.translate(item.title, dest='en').text

    for item in tadbirlar:
        item.title_en = translator.translate(item.title, dest='en').text

    # Kategoriyalarni tarjima qilish
    for category in categories_list:
        category.name_en = translator.translate(category.name, dest='en').text

    # Valyuta kurslari
    currency_rates = []
    try:
        response = requests.get('https://cbu.uz/uz/arkhiv-kursov-valyut/json/', timeout=5)
        data = response.json()
        
        # Kerakli valyutalar ro'yxati
        needed_currencies = {
            'USD': 'US dollar',
            'EUR': 'Euro',
            'RUB': 'Russian ruble',
            'GBP': 'British pound',
            'CNY': 'Chinese yuan'
        }
        
        for curr in data:
            if curr['Ccy'] in needed_currencies:
                currency_rates.append({
                    'code': curr['Ccy'],
                    'name': needed_currencies[curr['Ccy']],
                    'rate': float(curr['Rate']),
                    'diff': float(curr['Diff'])
                })
                # Faqat 5 ta valyutani olish
                if len(currency_rates) == 5:
                    break
                    
    except Exception as e:
        print(f"Valyuta kurslarini olishda xato: {e}")

    context = {
        "news": news,
        "categories_list": categories_list,
        "yangilik": yangilik,
        "gazeta": gazeta,
        "tadbirlar": tadbirlar,
        "currency_rates": currency_rates,
        "rates_last_update": datetime.now().strftime("%d.%m.%Y %H:%M")
    }

    return render(request, "news/indexEN.html", context)











@cache_page(60 * 15)  # 15 daqiqa
def indexViewRU(request):
    # Запрос новостей
    news = News.objects.all().order_by("-publish_time")[:12]
    categories_list = Category.objects.all()
    
    yangilik = News.objects.filter(category__name="Yangiliklar").order_by("-publish_time")[:3]
    gazeta = News.objects.filter(category__name="“Iste’mol madaniyati” gazetasi").order_by("-publish_time")[:3]
    tadbirlar = News.objects.filter(category__name="O'tkazilgan tadbirlardan fotolavhalar").order_by("-publish_time")[:3]

    # Перевод
    translator = Translator()
    
    # Перевод заголовков новостей на русский
    for item in gazeta:
        item.title_ru = translator.translate(item.title, dest='ru').text

    for item in yangilik:
        item.title_ru = translator.translate(item.title, dest='ru').text

    for item in tadbirlar:
        item.title_ru = translator.translate(item.title, dest='ru').text

    # Перевод названий категорий
    for category in categories_list:
        category.name_ru = translator.translate(category.name, dest='ru').text

    # Курсы валют
    currency_rates = []
    try:
        response = requests.get('https://cbu.uz/uz/arkhiv-kursov-valyut/json/', timeout=5)
        data = response.json()
        
        # Список необходимых валют
        needed_currencies = {
            'USD': 'Доллар США',
            'EUR': 'Евро',
            'RUB': 'Российский рубль',
            'GBP': 'Британский фунт',
            'CNY': 'Китайский юань'
        }
        
        for curr in data:
            if curr['Ccy'] in needed_currencies:
                currency_rates.append({
                    'code': curr['Ccy'],
                    'name': needed_currencies[curr['Ccy']],
                    'rate': float(curr['Rate']),
                    'diff': float(curr['Diff'])
                })
                # Получить только 5 валют
                if len(currency_rates) == 5:
                    break
                    
    except Exception as e:
        print(f"Ошибка при получении курсов валют: {e}")

    context = {
        "news": news,
        "categories_list": categories_list,
        "yangilik": yangilik,
        "gazeta": gazeta,
        "tadbirlar": tadbirlar,
        "currency_rates": currency_rates,
        "rates_last_update": datetime.now().strftime("%d.%m.%Y %H:%M")
    }

    return render(request, "news/indexRU.html", context)

