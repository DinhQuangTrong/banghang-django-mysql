from django.contrib import admin
from .models import *
from django.utils.html import format_html
from django.urls import reverse

# Register your models here.
admin.site.register(Product)    
admin.site.register(Category)

@admin.register(Wishlist)
class WishlistModelAdmin(admin.ModelAdmin):
    list_display=['id', 'user', 'products']
    
    def products(self,obj):
        link = reverse("admin:products_product_change", args=[obj.product.pk])
        return format_html('<a href="{}">{}</a>',link, obj.product.title)