from django.shortcuts import render, redirect
from django.views import View
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from .models import *
from products.models import *
from django.http import JsonResponse
from django.urls import reverse
from django.contrib import messages
from django.utils.html import format_html
import uuid
from django.db.models import Q

# Create your views here.
@login_required
def add_to_cart(request):
    user = request.user
    product_id=request.GET.get('prod_id')
    product = Product.objects.get(id=product_id)
    
    cart_item, created = Cart.objects.get_or_create(user=user, product=product)
    if not created:
        # Nếu đã tồn tại
        cart_item.quantity += 1
        cart_item.save()
    
    return redirect("/orders/cart")

@login_required
def buy_now(request, pk):
    product = Product.objects.get(pk=pk)
    user = request.user

    # Lưu thông tin mua ngay vào session
    request.session['buy_now'] = {
        'product_id': product.id,
        'quantity': 1
    }

    return redirect('checkout')

@login_required
def show_cart(request):
    categories = Category.objects.filter(sub_category__isnull=True).prefetch_related('products')
    user = request.user
    cart = Cart.objects.filter(user=user)
    amount = 0
    for p in cart:
        value = p.quantity * p.product.discounted_price
        amount = amount + value
    totalamount = amount
    
    totalitem = len(Cart.objects.filter(user=request.user))
    wishitem = len(Wishlist.objects.filter(user=request.user))
    
    if 'buy_now' in request.session:
        del request.session['buy_now']
    return render(request, 'app/addtocart.html', {'cart': cart,  'categories': categories, 'amount': amount, 'totalamount': totalamount, 'totalitem': totalitem, 'wishitem': wishitem})

@method_decorator(login_required, name='dispatch') 
class checkout(View):
    def get(self, request):        
        totalitem = len(Cart.objects.filter(user=request.user))
        wishitem = len(Wishlist.objects.filter(user=request.user))
        user = request.user
        categories = Category.objects.filter(sub_category__isnull=True).prefetch_related('products')
        add = Customer.objects.filter(user=user)
        
        buy_now_data = request.session.get('buy_now')
        if buy_now_data:
            # Trường hợp MUA NGAY
            product = Product.objects.get(pk=buy_now_data['product_id'])
            quantity = buy_now_data.get('quantity', 1)
            totalamount = product.discounted_price * quantity
            
            return render(request, 'app/checkout.html', {
                'buy_now': True,
                'product': product,
                'quantity': quantity,
                'totalamount': totalamount,
                'add': add,
                'categories': categories,
                'totalitem': totalitem,
                'wishitem': wishitem,
            })

        cart_items = Cart.objects.filter(user=user)
        amount = 0
        for p in cart_items:
            value = p.quantity * p.product.discounted_price
            amount = amount + value
        totalamount = amount

        return render(request, 'app/checkout.html',{
            'cart_items': cart_items,
            'totalamount': totalamount,
            'add': add,
            'categories': categories,
            'totalitem': totalitem,
            'wishitem': wishitem,
        })
        
def create_payment(user, amount, method):
    if method == 'thanhToanSau':
        return Payment.objects.create(
            user=user,
            amount= amount,
            payment_method='thanhToanSau',
            paid=False,  
            payment_status="Chờ xử lý"
        )
    #thanh toán thành công
    return Payment.objects.create(
        user=user,
        amount=amount,
        payment_method='thanhToan',
        paid=True,  
        payment_status="Thành công",
        transaction_id= "MA" + str(uuid.uuid4())[:8]
    )
 
@login_required   
def payment_done(request):
    if request.method != "POST":
        return redirect("checkout")

    user = request.user
    cust_id = request.POST.get('custid')
    method = request.POST.get('method')

    if not Customer.objects.filter(user=user).exists():
        link = reverse("profile")
        messages.error(request, format_html(
            'Bạn chưa có thông tin về địa chỉ. <a href="{}" class="fw-bold">Cập nhật thông tin của bạn ngay.</a>', link
        ))
        return redirect("profile")

    if not cust_id or not method:
        messages.error(request, "Vui lòng chọn địa chỉ và phương thức thanh toán.")
        return redirect("checkout")

    customer = Customer.objects.get(id=cust_id)
    buy_now_data = request.session.get('buy_now')

    if buy_now_data:
        # Mua ngay
        product = Product.objects.get(pk=buy_now_data['product_id'])
        quantity = buy_now_data.get('quantity', 1)
        amount = product.discounted_price * quantity
        payment = create_payment(user, amount, method)

        OrderPlaced.objects.create(
            user=user,
            customer=customer,
            product=product,
            quantity=quantity,
            payment=payment
        )
        del request.session['buy_now']
    else:
        # Mua từ giỏ hàng
        cart_items = Cart.objects.filter(user=user)
        amount = sum(item.quantity * item.product.discounted_price for item in cart_items)
        payment = create_payment(user, amount, method)

        for item in cart_items:
            OrderPlaced.objects.create(
                user=user,
                customer=customer,
                product=item.product,
                quantity=item.quantity,
                payment=payment
            )
            item.delete()

    return redirect("orders")


@login_required
def orders(request):
    totalitem = len(Cart.objects.filter(user=request.user))
    wishitem = len(Wishlist.objects.filter(user=request.user))
    order_placed= OrderPlaced.objects.filter(user=request.user)
    categories = Category.objects.filter(sub_category__isnull=True).prefetch_related('products')
    return render (request, 'app/orders.html',locals())

def plus_cart(request):
    if request.method == 'GET':
        prod_id=request.GET['prod_id']
        c = Cart.objects.get(Q(product=prod_id) & Q(user=request.user))
        c.quantity+=1
        c.save()
        user = request.user
        cart = Cart.objects.filter(user=user)
        amount = 0
        for p in cart:
            value = p.quantity * p.product.discounted_price
            amount = amount + value
        totalamount = amount
        context = {    
            'quantity' : c.quantity,
            'amount': amount,
            'totalamount' : totalamount      
        }
        return JsonResponse(context)
    
def minus_cart(request):
    if request.method == 'GET':
        prod_id=request.GET['prod_id']
        c = Cart.objects.get(Q(product=prod_id) & Q(user=request.user))
        c.quantity-=1
        c.save()
        user = request.user
        cart = Cart.objects.filter(user=user)
        amount = 0
        for p in cart:
            value = p.quantity * p.product.discounted_price
            amount = amount + value
        totalamount = amount
        context = {    
            'quantity' : c.quantity,
            'amount': amount,
            'totalamount' : totalamount      
        }
        return JsonResponse(context)
    
def remove_cart(request):
    if request.method == 'GET':
        prod_id=request.GET['prod_id']
        c = Cart.objects.get(Q(product=prod_id) & Q(user=request.user))
        c.delete()
        user = request.user
        cart = Cart.objects.filter(user=user)
        amount = 0
        for p in cart:
            value = p.quantity * p.product.discounted_price
            amount = amount + value
        totalamount = amount
        context = {    
            'amount': amount,
            'totalamount' : totalamount      
        }
        return JsonResponse(context)
    
