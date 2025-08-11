
from django.urls import path
from . import views

urlpatterns = [
    path('category/<slug:val>/', views.CategoryView.as_view(), name='category'),
    path('category-title/<str:val>/', views.CategoryTitle.as_view(), name='category-title'),
    path('product-detail/<int:pk>/', views.ProductDetail.as_view(), name='product-detail'),
    
    path('wishlist/', views.show_wishlist, name='showwishlist'),
    path('pluswishlist/', views.plus_wishlist),
    path('minuswishlist/', views.minus_wishlist),
]