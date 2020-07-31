from django.shortcuts import render
from django.http import HttpResponse
from django.template.response import TemplateResponse
from .models import Reader, Genre, Book, BookInstance
# Create your views here.



def book_detail_view(request):
    obj = Book.objects.get(id=3)
    context = {
        'object': obj

    }
    return render(request, "catalog/BookDetail.html", context)


from django.views import generic


class BookListView(generic.ListView):
    """Generic class-based view for a list of books."""
    model = Book
    paginate_by = 10


class BookDetailView(generic.DetailView):
    """Generic class-based detail view for a book."""
    model = Book