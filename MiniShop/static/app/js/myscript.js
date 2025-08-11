function togglePassword(fieldId, icon) {
        const field = document.getElementById(fieldId);
        const isPassword = field.type === "password";
        field.type = isPassword ? "text" : "password";
        icon.classList.toggle("fa-eye");
        icon.classList.toggle("fa-eye-slash");
    }
    
$('.plus-cart').click(function(){
    var id=$(this).attr("pid").toString();
    var eml=this.parentNode.children[2] 
    //console.log("pid =", id)
    $.ajax({
        type:"GET",
        url:"/orders/pluscart",
        data:{
            prod_id:id
        },
        success:function(data){
            //console.log("data=" ,data);
            eml.innerText=data.quantity 
            document.getElementById("amount").innerText=data.amount + " VNĐ"
            document.getElementById("totalamount").innerText=data.totalamount + " VNĐ"
        }
    })
})

$('.minus-cart').click(function(){
    var id=$(this).attr("pid").toString();
    var eml=this.parentNode.children[2] 
    var currentQty = parseInt(eml.innerText);

    if (currentQty <= 1) {
        alert("Số lượng tối thiểu là 1. Nếu muốn bạn có thể xóa sản phẩm khỏi giỏ hàng.");
        return;
    }
    $.ajax({
        type:"GET",
        url:"/orders/minuscart",
        data:{
            prod_id:id
        },
        success:function(data){
            eml.innerText=data.quantity 
            document.getElementById("amount").innerText=data.amount + " VNĐ"
            document.getElementById("totalamount").innerText=data.totalamount + " VNĐ"
        }
    })
})

$('.remove-cart').click(function(){
    var id=$(this).attr("pid").toString();
    var eml=this
    $.ajax({
        type:"GET",
        url:"/orders/removecart",
        data:{
            prod_id:id
        },
        success:function(data){
            document.getElementById("amount").innerText=data.amount 
            document.getElementById("totalamount").innerText=data.totalamount
            eml.parentNode.parentNode.parentNode.parentNode.remove() 
        }
    })
})

$('.plus-wishlist').click(function(){
    var id=$(this).attr("pid").toString();
    $.ajax({
        type:"GET",
        url:"/products/pluswishlist",
        data:{
            prod_id:id
        },
        success:function(data){
            //alert(data.message)
            window.location.href = `/products/product-detail/${id}`
        }
    })
})


$('.minus-wishlist').click(function(){
    var id=$(this).attr("pid").toString();
    $.ajax({
        type:"GET",
        url:"/products/minuswishlist",
        data:{
            prod_id:id
        },
        success:function(data){
            window.location.href = `/products/product-detail/${id}`
        }
    })
})
