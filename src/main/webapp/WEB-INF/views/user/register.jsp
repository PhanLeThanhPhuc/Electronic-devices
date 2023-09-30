<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="m-auto mt-5 mb-5 col-sm-6"
	style="border-radius: 20px; padding: 20px; box-shadow: rgba(0, 0, 0, 0.2) 0px 12px 28px 0px, rgba(0, 0, 0, 0.1) 0px 2px 4px 0px, rgba(255, 255, 255, 0.05) 0px 0px 0px 1px inset;">
	<form id="register-form" action="/registersave" method="post">
		<h3 style="font-weight: bold;">ĐĂNG KÍ</h3>
		<div class="row">
			<div class="col-sm-6">
				<div class="mb-3 ">
					<label style="font-weight: 600;" class="form-label">Tên đăng nhập</label>
					<input name="id"
						style="border-radius: 0; border: 2px solid rgb(205, 192, 50);" type="text"
						class="form-control">
					<p  style="color: red;" id="username-error" class="error-message"></p>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="mb-3 ">
					<label style="font-weight: 600;" class="form-label">Mật khẩu</label>
					 <input name="password"
						style="border-radius: 0; border: 2px solid rgb(205, 192, 50);" type="password"
						class="form-control">
					<p  style="color: red;" id="password-error" class="error-message"></p>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="mb-3 ">
					<label style="font-weight: 600;" class="form-label">Họ và tên</label>
					<input name="name"
						style="border-radius: 0; border: 2px solid rgb(205, 192, 50);" type="text"
						class="form-control">
					<p  style="color: red;" id="name-error" class="error-message"></p>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="mb-3 ">
					<label style="font-weight: 600;" class="form-label">Địa chỉ</label>
					<input name="address"
						style="border-radius: 0; border: 2px solid rgb(205, 192, 50);" type="text"
						class="form-control">
					<p  style="color: red;" id="address-error" class="error-message"></p>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="mb-3 ">
					<label style="font-weight: 600;" class="form-label">Email</label>
					<input name="email"
						style="border-radius: 0; border: 2px solid rgb(205, 192, 50);" type="text"
						class="form-control">
					<p  style="color: red;" id="email-error" class="error-message"></p>
					</div>
			</div>
			<div class="col-sm-6">
				<div class="mb-3 ">
					<label style="font-weight: 600;" class="form-label">Số điện thoại</label>
					<input name="phone"
						style="border-radius: 0; border: 2px solid rgb(205, 192, 50);" type="number"
						class="form-control">
					<p  style="color: red;" id="phone-error" class="error-message"></p>
				</div>
			</div>
		</div>
		<button style="border-radius: 0; font-weight: 600; background-color: rgb(205, 192, 50);"
			type="submit" class="btn">Submit</button>
	</form>
	<h6 style="color: red;" class="mt-3">${messageUserRegister}</h6>
</div>
            

<script>

<c:if test="${not empty sessionScope.register}">
$(document).ready(function () {
	$.toast({
	    text: "${register}.", // Text that is to be shown in the toast
	    heading: 'Thông báo!', // Optional heading to be shown on the toast
	    icon: 'success', // Type of toast icon
	    showHideTransition: 'fade', // fade, slide or plain
	    allowToastClose: true, // Boolean value true or false
	    hideAfter: 3000, // false to make it sticky or number representing the miliseconds as time after which toast needs to be hidden
	    stack: false, // false if there should be only one toast at a time or a number representing the maximum number of toasts to be shown at a time
	    position: 'top-right', // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values
	    textAlign: 'left',  // Text alignment i.e. left, right or center
	    loader: true,  // Whether to show loader or not. True by default
	    loaderBg: '#9EC600',  // Background color of the toast loader
	    beforeShow: function () {}, // will be triggered before the toast is shown
	    afterShown: function () {}, // will be triggered after the toat has been shown
	    beforeHide: function () {}, // will be triggered before the toast gets hidden
	    afterHidden: function () {}  // will be triggered after the toast has been hidden
	});
});

<%session.removeAttribute("register");%>
</c:if>


document.getElementById('register-form').addEventListener('submit', function (event) {
    var username = document.getElementsByName('id')[0].value;
    var password = document.getElementsByName('password')[0].value;
    var name = document.getElementsByName('name')[0].value;
    var address = document.getElementsByName('address')[0].value;
    var email = document.getElementsByName('email')[0].value;
    var phone = document.getElementsByName('phone')[0].value;

    var isValid = true;

    // Validate each field
    if (username === '') {
        document.getElementById('username-error').innerText = 'Vui lòng nhập tên đăng nhập.';
        isValid = false;
    } else {
        document.getElementById('username-error').innerText = '';
    }

    if (password === '') {
        document.getElementById('password-error').innerText = 'Vui lòng nhập mật khẩu.';
        isValid = false;
    } else {
        document.getElementById('password-error').innerText = '';
    }

    if (name === '') {
        document.getElementById('name-error').innerText = 'Vui lòng nhập họ và tên.';
        isValid = false;
    } else {
        document.getElementById('name-error').innerText = '';
    }

    if (address === '') {
        document.getElementById('address-error').innerText = 'Vui lòng nhập địa chỉ.';
        isValid = false;
    } else {
        document.getElementById('address-error').innerText = '';
    }

    if (email === '') {
        document.getElementById('email-error').innerText = 'Vui lòng nhập email.';
        isValid = false;
    } else {
        document.getElementById('email-error').innerText = '';
    }

    if (phone === '') {
        document.getElementById('phone-error').innerText = 'Vui lòng nhập số điện thoại.';
        isValid = false;
    } else {
        document.getElementById('phone-error').innerText = '';
    }

    // Prevent form submission if there are errors
    if (!isValid) {
        event.preventDefault();
    }
});
</script>