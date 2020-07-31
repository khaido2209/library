from django.db import models

# Create your models here.

from django.urls import reverse  # To generate URLS by reversing URL patterns


class Genre(models.Model):
    """Model representing a book genre (e.g. Science Fiction, Non Fiction)."""
    name = models.CharField(
        max_length=200, unique=True,
        help_text="Enter a book genre (e.g. Science Fiction, French Poetry etc.)"
        )

    def __str__(self):
        """String for representing the Model object (in Admin site etc.)"""
        return self.name


# class Language(models.Model):
#     """Model representing a Language (e.g. English, French, Japanese, etc.)"""
#     name = models.CharField(max_length=200,
#                             help_text="Enter the book's natural language (e.g. English, French, Japanese etc.)")

#     def __str__(self):
#         """String for representing the Model object (in Admin site etc.)"""
#         return self.name

from django.utils.safestring import mark_safe
class Book(models.Model):
    """Model representing a book (but not a specific copy of a book)."""
    sign = models.CharField('Sign', unique=True, max_length=10,default=' ',
                            help_text='Sign of the book')
    title = models.CharField(max_length=200, unique=True)
    # amount = models.IntegerField(default=1,
    #                         help_text='Amount of book')
    image = models.ImageField(upload_to='book_image')
    
    # author = models.ForeignKey('Author', on_delete=models.SET_NULL, null=True)
    # Foreign Key used because book can only have one author, but authors can have multiple books
    # Author as a string rather than object because it hasn't been declared yet in file.
    decsription = models.TextField(max_length=1000, help_text="Enter a brief description of the book")
    # isbn = models.CharField('ISBN', max_length=13,
    #                         help_text='13 Character <a href="https://www.isbn-international.org/content/what-isbn'
    #                                   '">ISBN number</a>')
    genre = models.ManyToManyField(Genre, help_text="Select a genre for this book")
    # ManyToManyField used because a genre can contain many books and a Book can cover many genres.
    # Genre class has already been defined so we can specify the object above.
    # language = models.ForeignKey('Language', on_delete=models.SET_NULL, null=True)
    amount = models.IntegerField(default=1, 
                            help_text='number of books have')
    
    taken = models.IntegerField(default=0,
                            help_text='number of books taken')
    
    returned = models.IntegerField(default=0, 
                            help_text='number of books returned')  

    @property
    def _book_exists(self):
        i = self.amount - self.taken + self.returned
        return i 

    @property
    def image_tag(self):
        if self.image:
            return mark_safe('<img src="{}" width="50" height="75" />'.format(self.image.url))
        return ""

    exist = _book_exists

    def display_genre(self):
        """Creates a string for the Genre. This is required to display genre in Admin."""
        return ', '.join([genre.name for genre in self.genre.all()[:3]])

    display_genre.short_description = 'Genre'

    def get_absolute_url(self):
        """Returns the url to access a particular book instance."""
        return reverse('book-detail', args=[str(self.id)])

    def __str__(self):
        """String for representing the Model object."""
        return self.title


import uuid  # Required for unique book instances
from datetime import date
from django.contrib import messages

# from django.contrib.auth.models import User  # Required to assign User as a borrower


class BookInstance(models.Model):
    """Model representing a specific copy of a book (i.e. that can be borrowed from the library)."""
    id = models.UUIDField(primary_key=True, default=uuid.uuid4,
                          help_text="Unique ID for this particular book across whole library")
    book = models.ForeignKey('Book', on_delete=models.SET_NULL, null=True)
    imprint = models.CharField(max_length=200)
    # borrow_date = models.DateTimeField(auto_now_add=True)
    borrower = models.ForeignKey('Reader', on_delete=models.SET_NULL, null=True, blank=True)
    borrow_date = models.DateField(null=True, blank=True)
    due_back = models.DateField(null=True, blank=True)
    # borrower = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)

    @property
    def is_overdue(self):
        if self.due_back and date.today() > self.due_back:
            return True
        return False 

    def _status(self):
        if date.today() > self.due_back:
            return "Overdue"
        elif (self.borrow_date <= date.today() <= self.due_back):
            return "Renting"
        elif self.borrow_date > date.today():
            return "Reserved"
    
    def save(self, *args, **kwargs):
        x = Book.objects.get(id=self.book_id).taken
        x += 1
        #b = BorrowBook.objects.get(self)
        if(Book.objects.get(id=self.book_id).exist >= 1):
            Book.objects.select_related().filter(id=self.book_id).update(taken = x )
        else:
            return pymsgbox.alert('Sách Đã Được Mượn Hết!', 'Thông Báo')
        super().save(*args, **kwargs)  # Call the "real" save() method.
        return False

    # def count(self):
    #     while self.book == Book.title:
    #         for i in (Book.amount >= 0):
    #             i -= 1
    #             if i  >= 0:
    #                 Book.amount.append(i)
    #             else:
    #                 break
    #     return self.count()
        
    # LOAN_STATUS = (
    #     ('m', 'Maintenance'),
    #     ('o', 'On loan'),
    #     ('a', 'Available'),
    #     ('r', 'Reserved'),
    # )

    status = _status

    # status = models.CharField(
    #     max_length=1,
    #     choices=LOAN_STATUS,
    #     blank=True,
    #     default='m',
    #     help_text='Book availability')

    class Meta:
        ordering = ['due_back']
        permissions = (("can_mark_returned", "Set book as returned"),)

    def __str__(self):
        """String for representing the Model object."""
        return '{0} ({1})'.format(self.id, self.book.title)

    
    


    # def save(self):
    #     while self.book == Book.title:
    #         for i in (Book.amount):
    #             i -= 1
    #             if i  >= 0:
    #                 Book.amount.append(i)
    #             else:
    #                 break
    #         # print("handle saving -------")
    #         # while (self.book == Book.title):
    #         #     while (Book.amount > 1):
    #         #         Book.amount -= 1
    #     return super.save()

# class Author(models.Model):
#     """Model representing an author."""
#     first_name = models.CharField(max_length=100)
#     last_name = models.CharField(max_length=100)
#     date_of_birth = models.DateField(null=True, blank=True)
#     date_of_death = models.DateField('died', null=True, blank=True)

#     class Meta:
#         ordering = ['last_name', 'first_name']

#     def get_absolute_url(self):
#         """Returns the url to access a particular author instance."""
#         return reverse('author-detail', args=[str(self.id)])

#     def __str__(self):
#         """String for representing the Model object."""
#         return '{0}, {1}'.format(self.last_name, self.first_name)


class Reader(models.Model):
    """Model representing an reader."""
    name = models.CharField(max_length=100)
    # date_of_birth = models.DateField(null=True)
    idcard = models.CharField('ID card', unique=True, max_length=12,
                            help_text='9/12 Character')
    phonenumber = models.CharField('Phone number', unique=True, max_length=10,
                            help_text='10 characters')
    # date_of_death = models.DateField('died', null=True, blank=True)
    
    class Meta:
        ordering = ['name']

    # def get_absolute_url(self):
    #     """Returns the url to access a particular author instance."""
    #     return reverse('author-detail', args=[str(self.id)])

    def __str__(self):
        """String for representing the Model object."""
        return self.name


# class BookCount(models.Model):
#     book = models.ForeignKey('Book', on_delete=models.SET_NULL, null=True)
#     amount = models.IntegerField(default=1, 
#                             help_text='number of books have')
    
#     taken = models.IntegerField(default=0, 
#                             help_text='number of books taken')
    
#     give_back = models.IntegerField(default=0, 
#                             help_text='number of books returned')  

#     @property
#     def _book_exists(self):
#         i = self.amount - self.taken + self.give_back
#         return i 

#     exist = _book_exists
    
#     def __str__(self):
#         """String for representing the Model object."""
#         return '{0} ({1})'.format(self.amount, self.book.title)