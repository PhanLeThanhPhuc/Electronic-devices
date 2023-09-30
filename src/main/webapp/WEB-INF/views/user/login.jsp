<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="m-auto mt-5 mb-5 col-sm-4"
	style="border-radius: 20px; padding: 20px; box-shadow: rgba(0, 0, 0, 0.2) 0px 12px 28px 0px, rgba(0, 0, 0, 0.1) 0px 2px 4px 0px, rgba(255, 255, 255, 0.05) 0px 0px 0px 1px inset;">
	<form id="login-form" action="/login" method="post">
		<h3 style="font-weight: bold;">LOGIN</h3>
		<div class="mb-3">
			<label style="font-weight: 600;" class="form-label">Tài khoản</label>
			<input name="username" value="${u}"
				style="border-radius: 0; border: 2px solid rgb(205, 192, 50);"
				type="text" class="form-control">
			<p style="color: red;" id="username-error" class="error-message"></p>
		</div>
		<div class="mb-3">
			<label style="font-weight: 600;" class="form-label">Mật khẩu</label>
			<input name="password" value="${p}"
				style="border-radius: 0; border: 2px solid rgb(205, 192, 50);"
				type="password" class="form-control">
			<p style="color: red;" id="password-error" class="error-message"></p>
		</div>
		<div class="mb-3 form-check">
			<input ${u != null ? "checked" : ""} name="remember" value="true"
				style="border: 2px solid rgb(205, 192, 50);" type="checkbox"
				class="form-check-input" id="exampleCheck1"> <label
				style="font-weight: 600;" class="form-check-label"
				for="exampleCheck1">Nhớ tài khoản</label>
		</div>
		<button
			style="border-radius: 0; font-weight: 600; background-color: rgb(205, 192, 50);"
			type="submit" class="btn">Submit</button>
	</form>
	<h6 class="mt-3" style="color:red">${login}</h6>
	<a href="/login-gg">Đăng nhập bằng gg</a>
</div>
<script>
<c:if test="${not empty sessionScope.loginCart}">
$(document).ready(function () {
	$.toast({
	    text: "${loginCart}", // Text that is to be shown in the toast
	    heading: 'Note', // Optional heading to be shown on the toast
	    icon: 'warning', // Type of toast icon
	    showHideTransition: 'fade', // fade, slide or plain
	    allowToastClose: true, // Boolean value true or false
	    hideAfter: 3000, // false to make it sticky or number representing the miliseconds as time after which toast needs to be hidden
	    stack: 5, // false if there should be only one toast at a time or a number representing the maximum number of toasts to be shown at a time
	    position: 'top-center', // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values
	    
	    
	    
	    textAlign: 'left',  // Text alignment i.e. left, right or center
	    loader: true,  // Whether to show loader or not. True by default
	    loaderBg: '#9EC600',  // Background color of the toast loader
	    beforeShow: function () {}, // will be triggered before the toast is shown
	    afterShown: function () {}, // will be triggered after the toat has been shown
	    beforeHide: function () {}, // will be triggered before the toast gets hidden
	    afterHidden: function () {}  // will be triggered after the toast has been hidden
	});      

});
<%session.removeAttribute("loginCart");%>
</c:if>

document.getElementById("login-form").addEventListener("submit", function(event) {

    event.preventDefault();
    
    var usernameError = document.getElementById("username-error");
    var passwordError = document.getElementById("password-error");
    usernameError.textContent = "";
    passwordError.textContent = "";

    var usernameInput = document.getElementsByName("username")[0];
    var passwordInput = document.getElementsByName("password")[0];
    var hasError = false;

    if (usernameInput.value.trim() === "") {
      usernameError.textContent = "Không được để trống username";
      hasError = true;
    }

    if (passwordInput.value.trim() === "") {
      passwordError.textContent = "Không được để trống password";
      hasError = true;
    }

    if (hasError) {
      return;
    }

    this.submit();
  });
</script>