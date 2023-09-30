<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="m-auto mt-5 mb-5 col-sm-4"
	style="border-radius: 20px; padding: 20px; box-shadow: rgba(0, 0, 0, 0.2) 0px 12px 28px 0px, rgba(0, 0, 0, 0.1) 0px 2px 4px 0px, rgba(255, 255, 255, 0.05) 0px 0px 0px 1px inset;">
	<form action="/save-resetpassword" method="post">
		<input type="hidden" name="token" value="${token}" />
		<h3 style="font-weight: bold;">ĐỔI MẬT KHẨU</h3>
		<div class="mb-3">
			<label style="font-weight: 600;" class="form-label">NHẬP MẬT KHẨU MỚI</label>
			<input name="password" value="${password}"
				style="border-radius: 0; border: 2px solid rgb(205, 192, 50);"
				type="password" class="form-control">
		</div>
		<div class="mb-3">
			<label style="font-weight: 600;" class="form-label">NHẬP LẠI MẬT KHẨU</label>
			<input name="password2" value=""
				style="border-radius: 0; border: 2px solid rgb(205, 192, 50);"
				type="password" class="form-control">
		</div>
		<button
			style="border-radius: 0; font-weight: 600; background-color: rgb(205, 192, 50);"
			type="submit" class="btn">Submit</button>
	</form>
	<h6 class="mt-3" style="color:red">${message}</h6>
</div>

<script>
</script>