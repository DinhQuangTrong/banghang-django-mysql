from django.shortcuts import render
from django.views import View
from products.models import *
from orders.models import Cart
from django.db.models import Q

# Create your views here.
def home(request):
    totalitem = 0
    wishitem = 0
    if request.user.is_authenticated:
        totalitem = len(Cart.objects.filter(user=request.user))
        wishitem = len(Wishlist.objects.filter(user=request.user))
        
    categories = Category.objects.filter(sub_category__isnull=True).prefetch_related('products')
    products = Product.objects.all()
    context = {'categories':categories, 'products': products, 'totalitem' : totalitem, 'wishitem': wishitem}
    return render(request, "app/home.html", context)

def about(request):
    # Hiện số lượng trên Cart
    totalitem = 0
    wishitem = 0
    if request.user.is_authenticated:
        totalitem = len(Cart.objects.filter(user=request.user))
        wishitem = len(Wishlist.objects.filter(user=request.user))
    categories = Category.objects.filter(sub_category__isnull=True).prefetch_related('products')
    context = {
        'categories':categories,
        'totalitem': totalitem,
        'wishitem': wishitem
    }
    return render(request, "app/about.html", context)

def contact(request):
    totalitem = 0
    wishitem = 0
    if request.user.is_authenticated:
        totalitem = len(Cart.objects.filter(user=request.user))
        wishitem = len(Wishlist.objects.filter(user=request.user))
    categories = Category.objects.filter(sub_category__isnull=True).prefetch_related('products')
    context = {
        'categories':categories,
        'totalitem': totalitem,
        'wishitem': wishitem
    }
    return render(request, "app/contact.html", context)

def search(request):
    categories = Category.objects.filter(sub_category__isnull=True).prefetch_related('products')
    products = Product.objects.all()
    query = request.GET['search']
    totalitem = 0
    wishitem = 0
    if request.user.is_authenticated:
        totalitem = len(Cart.objects.filter(user=request.user))
        wishitem = len(Wishlist.objects.filter(user=request.user))
    product = []
    if query:
        matched_categories = Category.objects.filter(name__icontains=query)
        # Lấy danh mục con đệ quy
        category_ids = []
        for cat in matched_categories:
            category_ids += get_all_subcategory_ids(cat)

        # Truy vấn sản phẩm
        product = Product.objects.filter(
            Q(title__icontains=query) | Q(category__id__in=category_ids)
        ).distinct()
    return render(request,"app/search.html",{'product': product, 'products': products, 'query': query, 'totalitem': totalitem, 'wishitem': wishitem, 'categories': categories})

def get_all_subcategory_ids(category):
    ids = [category.id]
    for sub in category.sub_categories.all():
        ids += get_all_subcategory_ids(sub)
    return ids