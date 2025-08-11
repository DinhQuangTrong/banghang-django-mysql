from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm, UsernameField, PasswordChangeForm, SetPasswordForm, PasswordResetForm
from django.contrib.auth.models import User
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.password_validation import validate_password
from django.core.exceptions import ValidationError


from .models import Customer

class LoginForm(AuthenticationForm):
    username = UsernameField(label='Tên người dùng', widget=forms.TextInput(attrs={'autofocus': 'True', 'class':'form-control'}),
        error_messages={
        'required': 'Bạn chưa nhập tên đăng nhập!',
    })
    password = forms.CharField(label='Mật khẩu', widget=forms.PasswordInput(attrs={'autocomplete':'current-password','class':'form-control'}),
        error_messages={
        'required': 'Bạn chưa nhập mật khẩu đăng nhập!',
    })
    
    error_messages = {
        'invalid_login': _('Tên đăng nhập hoặc mật khẩu không đúng. Vui lòng thử lại.'),
    }
class CustomerRegistrationForm(UserCreationForm):
    username = forms.CharField(label='Tên người dùng', widget=forms.TextInput(attrs={'autofocus': 'True', 'class':'form-control'}),
        error_messages={
        'required': 'Bạn chưa nhập tên đăng nhập!',
    })
    email = forms.EmailField(widget=forms.EmailInput(attrs={'class':'form-control'}),
        error_messages={
        'required': 'Bạn chưa nhập email!',
        'invalid': 'Email không hợp lệ. Kiểm tra lại.'})
    password1 = forms.CharField(label='Mật khẩu', widget=forms.PasswordInput(attrs={'class':'form-control'}),
        error_messages={
        'required': 'Bạn chưa nhập mật khẩu!',}) 
    password2 = forms.CharField(label='Xác nhận mật khẩu', widget=forms.PasswordInput(attrs={'class':'form-control'}),
        error_messages={
        'required': 'Bạn chưa nhập!',
        'invalid': 'Mật khẩu nhập không khớp!'})
    
    class Meta:
        model = User  # Liên kết với model User mặc định
        fields = ['username', 'email', 'password1', 'password2']
        
    def clean_username(self):
        username = self.cleaned_data.get('username')
        if User.objects.filter(username=username).exists():
            raise ValidationError("Tên người dùng này đã được sử dụng!")
        return username

    def clean_password1(self):
        password = self.cleaned_data.get('password1')
        try:
            validate_password(password)
        except ValidationError as e:
            translated_errors = []
            for msg in e.messages:
                if "too short" in msg:
                    translated_errors.append("Mật khẩu quá ngắn (tối thiểu 8 ký tự).")
                elif "too common" in msg:
                    translated_errors.append("Mật khẩu này quá phổ biến.")
                elif "entirely numeric" in msg:
                    translated_errors.append("Mật khẩu không được chỉ gồm số.")
                elif "too similar" in msg:
                    translated_errors.append("Mật khẩu quá giống với tên đăng nhập.")
                else:
                    translated_errors.append(msg)
            raise ValidationError(translated_errors)

        return password

    def clean_password2(self):
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        try:
            validate_password(password2)
        except ValidationError as e:
            translated_errors = []
            for msg in e.messages:
                if "too short" in msg:
                    translated_errors.append("Mật khẩu quá ngắn (tối thiểu 8 ký tự).")
                elif "too common" in msg:
                    translated_errors.append("Mật khẩu này quá phổ biến.")
                elif "entirely numeric" in msg:
                    translated_errors.append("Mật khẩu không được chỉ gồm số.")
                elif "too similar" in msg:
                    translated_errors.append("Mật khẩu quá giống với tên đăng nhập.")
                else:
                    translated_errors.append(msg)
            raise ValidationError(translated_errors)

        if password1 and password2 and password1 != password2:
            raise ValidationError("Mật khẩu xác nhận không khớp!")

        return password2


        
class MyPasswordChangeForm(PasswordChangeForm):
    old_password = forms.CharField(label='Mật khẩu ban đầu', widget=forms.PasswordInput(attrs={'autofocus': 'True', 'autocomplete':'current-password','class':'form-control'}))
    new_password1 = forms.CharField(label='Mật khẩu mới', widget=forms.PasswordInput(attrs={'autocomplete': 'current-password', 'class': 'form-control'}))
    new_password2 = forms.CharField(label='Xác nhận mật khẩu', widget=forms.PasswordInput(attrs={'autocomplete': 'current-password', 'class':'form-control'}))
       
#Mẫu đặt lại 
class MyPasswordResetForm(PasswordResetForm):
    email = forms.EmailField(widget=forms.EmailInput(attrs={'class':'form-control'}),
        error_messages={
        'required': 'Bạn chưa nhập email!',
        'invalid': 'Email không hợp lệ. Kiểm tra lại.'})

#Mẫu đặt mật khẩu của tôi
class MySetPasswordForm(SetPasswordForm):
    new_password1 = forms.CharField(label='Mật khẩu mới', widget=forms.PasswordInput(attrs=
    {'autocomplete': 'current-password','class':'form-control'}),
        error_messages={
        'required': 'Bạn chưa nhập mật khẩu!',})
    new_password2 = forms.CharField(label='Xác nhận mật khẩu mới', widget=forms.PasswordInput(attrs=
    {'autocomplete': 'current-password', 'class':'form-control'}),
        error_messages={
        'required': 'Bạn chưa nhập mật khẩu!',})

class CustomerProfileForm(forms.ModelForm):
    class Meta:
        model = Customer
        fields = ['name','locality','city','mobile','state','zipcode']
        labels = {
            'name': 'Họ và tên',
            'locality': 'Địa chỉ cụ thể',
            'city': 'Thành phố',
            'mobile': 'Số điện thoại',
            'state': 'Tỉnh',
            'zipcode': 'Mã bưu điện',
        }
        widgets={
            'name':forms.TextInput(attrs={'class':'form-control'}),
            'locality':forms.TextInput(attrs={'class':'form-control'}),
            'city':forms.TextInput(attrs={'class':'form-control'}),
            'mobile': forms.TextInput(attrs={'class': 'form-control'}),
            'state': forms.Select(attrs={'class':'form-control'}),
            'zipcode': forms.NumberInput(attrs={'class':'form-control'}),
        }