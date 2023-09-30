   <%@ page pageEncoding="utf-8" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <div style="">
            <div class="m-auto mt-5 mb-5 " 
                style=" max-width: 1200px;border-radius: 20px; padding: 20px; box-shadow: rgba(0, 0, 0, 0.2) 0px 12px 28px 0px, rgba(0, 0, 0, 0.1) 0px 2px 4px 0px, rgba(255, 255, 255, 0.05) 0px 0px 0px 1px inset;">
                <div class="row">
                    <div class="col-sm-3">
                        <ul class="list-group">
                            <a style="text-decoration: none;" href="/userinfo">
                                <li style="background-color: rgb(242, 223, 16); font-weight: 500;" class="list-group-item d-flex justify-content-between align-items-center">
                                    Thông tin cá nhân
                              
                                  </li>
                            </a>
                            <a style="text-decoration: none; " href="/user-order">
                                <li style="font-weight: 500;"  class="list-group-item d-flex justify-content-between align-items-center">
                                    Đơn hàng
                     
                                  </li>
                            </a>
                            <a style="text-decoration: none;" href="">
                                <li style="font-weight: 500;" class="list-group-item d-flex justify-content-between align-items-center">
                                    Địa chỉ
               
                                  </li>
                            </a>
                          </ul>
                    </div>
                    <div class="col-sm-9">
                        <div class="card" style="border: none;" >
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-3 m-auto">
                                        <img style="width: 100px; display: block; margin-left: auto; margin-right: auto;" src="/image/default-avatar.png" class="img-fluid rounded-circle"
                                            alt="Profile Picture">
                                    </div>
                                    <div class="col-lg-9">
                                        <h1 class="mb-3">${sessionScope.userss.name}</h1>
                                    </div>
                                </div>
                                <hr>
                                <h4 class="mt-4">Thông tin</h4>
                                <table class="table table-bordered">
                                    <tr>
                                        <td>Số điện thoại</td>
                                        <td>${sessionScope.userss.phone}</td>
                                    </tr>
                                    <tr>
                                        <td>Địa chỉ email</td>
                                        <td>${sessionScope.userss.email}</td>
                                    </tr>
                                    <tr>
                                        <td>Địa chỉ</td>
                                        <td>${sessionScope.userss.address}</td>
                                    </tr>
                                </table>
                                <a href="/edituser" class="btn btn-primary">Đổi thông tin</a>
                            </div>
                        </div>
                    </div>
                </div>
                <h6 class="mt-3"></h6>
            </div>
            </div>
            <script>
<c:if test="${not empty sessionScope.messageUserUpdate}">
$(document).ready(function() {
	$.toast({
		text : "${messageUserUpdate}", // Text that is to be shown in the toast
		heading : 'Thông báo!', // Optional heading to be shown on the toast
		icon : 'success', // Type of toast icon
		showHideTransition : 'fade', // fade, slide or plain
		allowToastClose : true, // Boolean value true or false
		hideAfter : 3000, // false to make it sticky or number representing the miliseconds as time after which toast needs to be hidden
		stack : false, // false if there should be only one toast at a time or a number representing the maximum number of toasts to be shown at a time
		position : 'top-right', // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values
		textAlign : 'left', // Text alignment i.e. left, right or center
		loader : true, // Whether to show loader or not. True by default
		loaderBg : '#9EC600', // Background color of the toast loader
		beforeShow : function() {
		}, // will be triggered before the toast is shown
		afterShown : function() {
		}, // will be triggered after the toat has been shown
		beforeHide : function() {
		}, // will be triggered before the toast gets hidden
		afterHidden : function() {
		} // will be triggered after the toast has been hidden
	});

});
<%session.removeAttribute("messageUserUpdate");%>
</c:if>
</script>