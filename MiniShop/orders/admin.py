from django.contrib import admin
from .models import Cart, Payment, OrderPlaced
from django.utils.html import format_html
from django.urls import reverse

# Register your models here.
@admin.register(Cart)
class CartModelAdmin(admin.ModelAdmin):
    list_display = ['id','user','products','quantity']
    
    def products(self,obj):
        link = reverse("admin:products_product_change", args=[obj.product.pk])
        return format_html('<a href="{}">{}</a>',link, obj.product.title)
    
@admin.register(Payment)
class PaymentModelAdmin(admin.ModelAdmin):
    list_display = ['id', 'user','amount','payment_method', 'transaction_id','payment_status','paid']
    
@admin.register(OrderPlaced)
class OrderPlacedModelAdmin(admin.ModelAdmin):
    list_display=['id', 'user', 'customers', 'products', 'quantity', 'ordered_date', 'status', 'payments']
    
    def customers(self,obj):
        link=reverse('admin:users_customer_change', args=[obj.customer.pk])
        return format_html('<a href="{}">{}</a>',link,obj.customer.name)
    
    def products(self,obj):
        link=reverse('admin:products_product_change', args=[obj.product.pk])
        return format_html('<a href="{}">{}</a>',link,obj.product.title)
    
    def payments(self, obj):
        link = reverse('admin:orders_payment_change', args=[obj.payment.pk])
        return format_html('<a href="{}">{}</a>', link, obj.payment.transaction_id or "N/A")
