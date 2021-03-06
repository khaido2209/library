from django.contrib import admin
from .models import Reader, Genre, Book, BookInstance
# from .models import Author, Genre, Book, BookInstance, Language


# Register your models here.

"""Minimal registration of Models.
admin.site.register(Book)
admin.site.register(Author)
admin.site.register(BookInstance)
admin.site.register(Genre)
admin.site.register(Language)
"""

admin.site.register(Genre)
# admin.site.register(Language)


class BooksInline(admin.TabularInline):
    """Defines format of inline book insertion (used in ReaderAdmin)"""
    model = Book


# @admin.register(Author)
# class AuthorAdmin(admin.ModelAdmin):
#     """Administration object for Author models.
#     Defines:
#      - fields to be displayed in list view (list_display)
#      - orders fields in detail view (fields),
#        grouping the date fields horizontally
#      - adds inline addition of books in author view (inlines)
#     """
#     list_display = ('last_name',
#                     'first_name', 'date_of_birth', 'date_of_death')
#     fields = ['first_name', 'last_name', ('date_of_birth', 'date_of_death')]
#     inlines = [BooksInline]


class BooksInstanceInline(admin.TabularInline):
    """Defines format of inline book instance insertion (used in BookAdmin)"""
    model = BookInstance


class BookAdmin(admin.ModelAdmin):
    """Administration object for Book models.
    Defines:
     - fields to be displayed in list view (list_display)
     - adds inline addition of book instances in book view (inlines)
    """
    # list_display = ('title', 'author', 'display_genre')
    list_display = ('title', 'display_genre', 'amount','taken','returned','exist','image_tag')
    inlines = [BooksInstanceInline]
    readonly_fields = ['image_tag']
    def image_tag(self, obj):
        return obj.image_tag

    image_tag.short_description = 'image tag'
    image_tag.allow_tags = True


admin.site.register(Book, BookAdmin)


@admin.register(BookInstance)
class BookInstanceAdmin(admin.ModelAdmin):
    """Administration object for BookInstance models.
    Defines:
     - fields to be displayed in list view (list_display)
     - filters that will be displayed in sidebar (list_filter)
     - grouping of fields into sections (fieldsets)
    """
    list_display = ('book', 'borrower', 'status', 'borrow_date', 'due_back')
    list_filter = ('book','borrower')

    fieldsets = (
        (None, {
            'fields': ('book', 'imprint', 'id')
        }),
        ('Availability', {
            'fields': ('borrow_date','due_back', 'borrower')
        }),
    )


# def save(self):
#         while self.book == Book.title:
#             for i in (Book.amount):
#                 i -= 1
#                 if i  >= 0:
#                     Book.amount.append(i)
#                 else:
#                     break
#             # print("handle saving -------")
#             # while (self.book == Book.title):
#             #     while (Book.amount > 1):
#             #         Book.amount -= 1
#         return super.save()



# @receiver(post_save, sender=Book)
# def add_book_count(self, created, **kwargs):
#     if created:
#         instance.book.amount += 1
#         instance.book.save()


# @receiver(post_delete, sender=Book)
# def rem_statement_count(self, **kwargs):
#     instance.book.amount -= 1
#     instance.book.save()


@admin.register(Reader)
class ReaderAdmin(admin.ModelAdmin):
    """Administration object for Author models.
    Defines:
     - fields to be displayed in list view (list_display)
     - orders fields in detail view (fields),
       grouping the date fields horizontally
     - adds inline addition of books in reader view (inlines)
    """
    list_display = ('name', 'idcard', 'phonenumber')
    fields = ['name', 'idcard', 'phonenumber']
    inlines = [BooksInstanceInline]