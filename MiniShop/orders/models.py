from django.db import models
from django.contrib.auth.models import User
from products.models import Product
from users.models import Customer

# Create your models here.
class Cart(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    product = models.ForeignKey(Product,on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)
    
    @property
    def total_cost(self):
        return self.quantity * self.product.discounted_price
    
STATUS_CHOICES = (
    ('Đã chấp nhận', 'Đã chấp nhận'),
    ('Đã đóng gói', 'Đã đóng gói'),
    ('Đang trên đường', 'Đang trên đường'),
    ('Đã giao', 'Đã giao'),
    ('Hủy', 'Hủy'),
    ('Đang chờ', 'Đang chờ'),
)

class Payment(models.Model):
    PAYMENT_METHOD_CHOICES = (
        ('thanhToanSau', 'Thanh toán khi nhận hàng'),
        ('thanhToan', 'Thanh toán trực tuyến'),
    )
    
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    amount = models.FloatField()
    payment_method = models.CharField(max_length=20, choices=PAYMENT_METHOD_CHOICES)
    payment_status = models.CharField(max_length=100, default='Chờ xử lý')
    created_at = models.DateTimeField(auto_now_add=True)
    transaction_id = models.CharField(max_length=100, blank=True, null=True) 
    paid = models.BooleanField(default=False)
    
    def __str__(self):
        return f"{self.id} - {self.user.username} - {self.payment_method} - {self.amount}₫"

    
class OrderPlaced(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)
    ordered_date = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=50,choices=STATUS_CHOICES, default='Đang chờ')
    payment = models.ForeignKey(Payment, on_delete=models.CASCADE)
    
    @property
    def total_cost(self):
        return self.quantity * self.product.discounted_price
    