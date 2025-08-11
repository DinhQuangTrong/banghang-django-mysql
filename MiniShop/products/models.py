from django.db import models
from django.contrib.auth.models import User

class Category(models.Model):
    sub_category = models.ForeignKey('self',on_delete=models.CASCADE, related_name='sub_categories',null=True,blank=True)
    #Có phải danh mục con không
    is_sub = models.BooleanField(default=False)
    name = models.CharField(max_length=200)
    #Tối ưu đường dẫn
    slug = models.SlugField(max_length=200, unique=True)
    def __str__(self):
        return self.name
    
    # class Meta:
    #     ordering = ['name']

class Product(models.Model):
    title = models.CharField(max_length=100)
    selling_price = models.FloatField()
    discounted_price = models.FloatField()
    description = models.TextField()
    composition = models.TextField(null=True,blank=True)
    prodapp = models.TextField(null=True,blank=True)
    # 1 sản phẩm thuộc 1 danh mục
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='products', null=True, blank=True)
    product_image = models.ImageField(upload_to='product')
    
    def __str__(self):
        return self.title
    
class Wishlist (models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product,on_delete=models.CASCADE)