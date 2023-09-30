<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="m-auto mt-5 mb-5 col-sm-4"
	style="border-radius: 20px; padding: 20px; box-shadow: rgba(0, 0, 0, 0.2) 0px 12px 28px 0px, rgba(0, 0, 0, 0.1) 0px 2px 4px 0px, rgba(255, 255, 255, 0.05) 0px 0px 0px 1px inset;">
	<form action="/save-change-pass" method="post">
		<h3 style="font-weight: bold;">ĐỔI MẬT KHẨU</h3>
		<div class="mb-3">
			<label style="font-weight: 600;" class="form-label">Nhập mật khẩu</label>
			<input id="passwordInput" name="password" value="${password}"
				style="border-radius: 0; border: 2px solid rgb(205, 192, 50);"
				type="password" class="form-control">
				<p id="passwordError" class="error-message"></p>
		</div>
		<div class="mb-3">
			<label style="font-weight: 600;" class="form-label">Nhập mật khẩu mới</label>
			<input id="passwordnewInput" name="passwordnew" value="${passwordnew}"
				style="border-radius: 0; border: 2px solid rgb(205, 192, 50);"
				type="password" class="form-control">
				<p id="passwordnewError" class="error-message"></p>
		</div>
		
		<div class="mb-3">
			<label style="font-weight: 600;" class="form-label">Nhập lại mật khẩu mới</label>
			<input id="passwordnew2Input" name="passwordnew2" value="${passwordnew2}"
				style="border-radius: 0; border: 2px solid rgb(205, 192, 50);"
				type="password" class="form-control">
				<p id="passwordnew2nameError" class="error-message"></p>
		</div>
		<button
			style="border-radius: 0; font-weight: 600; background-color: rgb(205, 192, 50);"
			type="submit" class="btn">Submit</button>
	</form>
	<h6 class="mt-3" style="color:red">${message}</h6>
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



</script>