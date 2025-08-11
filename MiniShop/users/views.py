from django.shortcuts import render, redirect
from django.views import View
from django.contrib import messages
from .forms import CustomerProfileForm, CustomerRegistrationForm
from .models import Customer
from orders.models import *
from products.models import *

# Create your views here.
class CustomerRegistrationView(View):
    def get(self, request):
        form = CustomerRegistrationForm()
        totalitem = 0
        wishitem = 0
        if request.user.is_authenticated:
            totalitem = len(Cart.objects.filter(user=request.user))
            wishitem = len(Wishlist.objects.filter(user=request.user))
        return render(request, "app/register.html", {'form': form, 'totalitem' : totalitem, 'wishitem': wishitem})
    
    def post(self, request):
        form = CustomerRegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "Đã đăng ký thành công!")
        else:
            messages.warning(request, "Dữ liệu không hợp lệ!")
        return render(request, "app/register.html", {'form': form})

class ProfileView(View):
    def get(self, request):
        form = CustomerProfileForm()
        totalitem = 0
        wishitem = 0
        if request.user.is_authenticated:
            totalitem = len(Cart.objects.filter(user=request.user))
            wishitem = len(Wishlist.objects.filter(user=request.user))
        categories = Category.objects.filter(sub_category__isnull=True).prefetch_related('products')
        return render(request, 'app/profile.html',locals())
    def post(self,request):
        form = CustomerProfileForm(request.POST)
        if form.is_valid():
            user = request.user
            name = form.cleaned_data['name']
            locality = form.cleaned_data['locality']
            city = form.cleaned_data['city']
            mobile = form.cleaned_data['mobile']
            state = form.cleaned_data['state']
            zipcode = form.cleaned_data['zipcode']
            
            reg = Customer(user=user, name=name,locality=locality,city=city,mobile=mobile,state=state,zipcode=zipcode)
            reg.save()
            messages.success(request, "Hồ sơ! Đã được lưu thành công")
        else:
            messages.warning(request, "Dữ liệu nhập không hợp lệ")
        return render(request, 'app/profile.html',locals())
  
def address(request):
    add = Customer.objects.filter(user=request.user)
    totalitem = 0
    wishitem = 0
    if request.user.is_authenticated:
        totalitem = len(Cart.objects.filter(user=request.user))
        wishitem = len(Wishlist.objects.filter(user=request.user))
    categories = Category.objects.filter(sub_category__isnull=True).prefetch_related('products')
    return render(request, 'app/address.html',locals())
    
class UpdateAddress(View):
    def get(self, request,pk):
        add = Customer.objects.get(pk=pk)
        # Tự động điền vào dữ liệu
        form = CustomerProfileForm(instance=add)       
        totalitem = 0
        wishitem = 0
        if request.user.is_authenticated:
            totalitem = len(Cart.objects.filter(user=request.user))
            wishitem = len(Wishlist.objects.filter(user=request.user))
        categories = Category.objects.filter(sub_category__isnull=True).prefetch_related('products')
        return render(request, 'app/updateAddress.html',{'form': form, 'categories': categories, 'totalitem': totalitem, 'wishitem': wishitem})
    def post(self,request,pk):
        form = CustomerProfileForm(request.POST)
        if form.is_valid():
            add = Customer.objects.get(pk=pk)
            add.name = form.cleaned_data['name']
            add.locality = form.cleaned_data['locality']
            add.city = form.cleaned_data['city']
            add.mobile = form.cleaned_data['mobile']
            add.state = form.cleaned_data['state']
            add.zipcode = form.cleaned_data['zipcode']
            add.save()
            
            messages.success(request, "Hồ sơ! Đã được cập nhật thành công")
        else:
            messages.warning(request, "Dữ liệu nhập không hợp lệ")
            
        return redirect("address")