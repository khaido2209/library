from django.contrib import admin
from django.urls import path
from catalog.views import book_detail_view

urlpatterns = [
    path('', views.index, name='home'),
    path('book/', book_detail_view),
]