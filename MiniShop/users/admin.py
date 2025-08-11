from django.contrib import admin
from .models import Customer
from django.utils.html import format_html
from django.urls import reverse
from django.contrib.auth.models import Group

# Register your models here.
@admin.register(Customer)
class CustomerModelAdmin(admin.ModelAdmin):
    list_display = ['id','user','locality','city','state','zipcode']
    
admin.site.site_header='MiniShop'
admin.site.site_title = 'Hệ thống'
admin.site.index_title = 'Chào mừng đến với hệ thống quản lý MiniShop'

admin.site.unregister(Group)