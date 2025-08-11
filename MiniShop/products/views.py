from django.views import View
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.http import JsonResponse
from .models import *
from orders.models import Cart
from django.db.models import Q

# Create your views here.
class CategoryView(View):
    def get(self,request,val):
        totalitem = 0
        wishitem = 0
        if request.user.is_authenticated:
            totalitem = len(Cart.objects.filter(user=request.user))
            wishitem = len(Wishlist.objects.filter(user=request.user))
            
        # Lấy danh mục cha, load sẵn danh mục con và sản phẩm con
        categories = Category.objects.filter(sub_category__isnull=True).prefetch_related('products')
        products = Product.objects.all()
        
        # Tìm Category từ slug
        category = Category.objects.filter(slug=val).first()
        if category:
            # Lấy danh mục con (trực tiếp)
            sub_categories = Category.objects.filter(sub_category=category)
    
             # Lấy sản phẩm trong chính category này + các category con
            product = Product.objects.filter(category__in=[category] + list(sub_categories))
            title = product.values('title')
            context = {'val': category.name, 'product': product, 'products':products, 'title': title, 'categories': categories, 'totalitem': totalitem, 'wishitem': wishitem}
        else:
            context = {'val': "Không tìm thấy danh mục!", 'product': [], 'title': [], 'categories': categories, 'totalitem': totalitem, 'wishitem': wishitem}
            
        return render(request, "app/category.html", context)
    
class CategoryTitle(View):
    def get(self, request, val):
        categories = Category.objects.filter(sub_category__isnull=True).prefetch_related('products')
        products = Product.objects.all()
        product = Product.objects.filter(title=val)
        title = Product.objects.filter(category=product[0].category).values('title')
        totalitem = 0
        wishitem = 0
        if request.user.is_authenticated:
            totalitem = len(Cart.objects.filter(user=request.user))
            wishitem = len(Wishlist.objects.filter(user=request.user))
        context = {'product': product, 'products':products, 'title': title, 'categories': categories, 'totalitem': totalitem, 'wishitem': wishitem}
        return render(request, "app/category.html",context)

class ProductDetail(View):
    def get(self, request,pk):
        totalitem = 0
        wishitem = 0
        wishlist = None
        if request.user.is_authenticated:
            totalitem = len(Cart.objects.filter(user=request.user))
            wishitem = len(Wishlist.objects.filter(user=request.user))
        categories = Category.objects.filter(sub_category__isnull=True).prefetch_related('products')
        product = Product.objects.get(pk=pk)
        
        # Mục ưa thích
        if request.user.is_authenticated:
            wishlist = Wishlist.objects.filter(product=product, user=request.user)
    
        context = {'product': product, 'categories': categories, 'totalitem': totalitem, 'wishlist': wishlist, 'wishitem': wishitem}
        return render(request, "app/productdetail.html", context)
    
@login_required
def show_wishlist(request):
    user = request.user
    totalitem = len(Cart.objects.filter(user=request.user))
    wishitem = len(Wishlist.objects.filter(user=request.user))
    product = Wishlist.objects.filter(user=user)
    categories = Category.objects.filter(sub_category__isnull=True).prefetch_related('products')
    return render(request, "app/wishlist.html",locals())    

def plus_wishlist(request):
    if request.method == 'GET':
        prod_id=request.GET['prod_id']
        product=Product.objects.get(id=prod_id)
        user = request.user
        Wishlist(user=user,product=product).save()
        data={
        'message': 'Đã thêm vào danh sách yêu thích',
        }
        return JsonResponse(data)


def minus_wishlist(request):
    if request.method == 'GET':
        prod_id=request.GET['prod_id']
        product=Product.objects.get(id=prod_id)
        user = request.user
        Wishlist.objects.filter(user=user, product=product).delete()
        data={
        'message': 'Đã xóa khỏi danh sách yêu thích',
        }
        return JsonResponse(data)