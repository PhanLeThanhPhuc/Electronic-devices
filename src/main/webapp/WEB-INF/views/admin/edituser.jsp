
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.error-message {
	color: red;
}
</style>
<div class="col-sm-12 m-auto p-0 m-0">
	<a href="/admin/homeadmin" class="btn btn-primary ml-5">Quay lại</a>
	<div class="container-user p-4 ml-2 mr-2 col-sm-7 m-auto"
		style="background-color: #fff; box-shadow: rgba(165, 163, 163, 0.24) 0px 3px 8px;">
		<form action="/admin/insertuser" method="POST" class="m-auto"
			onsubmit="return validateForm()">
			<div class="row">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-6">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">TÊN
									ĐĂNG NHẬP <img src="image source" class="img-fluid rounded-top"
									alt="">
								</label> <input id="idInput" value="${user.id}" name="id" type="text"
									class="form-control">
								<p id="idError" class="error-message"></p>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">HỌ VÀ
									TÊN <img src="image source" class="img-fluid rounded-top"
									alt="">
								</label> <input id="nameInput" value="${user.name}" name="name"
									type="text" class="form-control">
								<p id="nameError" class="error-message"></p>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">EMAIL
									<img src="image source" class="img-fluid rounded-top" alt="">
								</label> <input id="emailInput" value="${user.email}" name="email"
									type="text" class="form-control">
								<p id="emailError" class="error-message"></p>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">SỐ
									ĐIỆN THOẠI <img src="image source"
									class="img-fluid rounded-top" alt="">
								</label> <input id="phoneInput" value="${user.phone}" name="phone"
									type="number" class="form-control">
								<p id="phoneError" class="error-message"></p>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">ĐỊA
									CHỈ <img src="image source" class="img-fluid rounded-top"
									alt="">
								</label> <input id="addressInput" name="address" value="${user.address}"
									type="text" class="form-control">
								<p id="addressError" class="error-message"></p>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">NHẬP
									MẬT KHẨU <img src="image source" class="img-fluid rounded-top"
									alt="">
								</label> <input id="passwordInput" name="password"
									value="${user.password}" type="text" class="form-control">
								<p id="passwordError" class="error-message"></p>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">NHẬP
									LẠI MẬT KHẨU <img src="image source"
									class="img-fluid rounded-top" alt="">
								</label> <input id="confirmPasswordInput" type="text"
									class="form-control">
								<p id="confirmPasswordError" class="error-message"></p>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="mb-3">
								<label for="formFile" class="form-label">QUYỀN</label><br>
								<div class="form-check form-check-inline">
									<input ${user.role == true ? "checked" : ""}
										class="form-check-input" type="radio" name="role"
										id="inlineRadio1" value="true" checked> <label
										class="form-check-label" for="inlineRadio1">Admin</label>
								</div>
								<div class="form-check form-check-inline">
									<input ${user.role == false ? "checked" : ""}
										class="form-check-input" type="radio" name="role"
										id="inlineRadio2" value="false"> <label
										class="form-check-label" for="inlineRadio2">User</label>
								</div>
							</div>
						</div>
						<h6 style="color: red;">${insertuser}</h6>
						<div style="text-align: center;">
							<button type="submit" class="btn btn-primary">
								<i class="bi bi-file-earmark-check"></i> Thêm
							</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
	function validateForm() {
		var id = document.getElementById('idInput').value;
		var name = document.getElementById('nameInput').value;
		var email = document.getElementById('emailInput').value;
		var phone = document.getElementById('phoneInput').value;
		var address = document.getElementById('addressInput').value;
		var password = document.getElementById('passwordInput').value;
		var confirmPassword = document.getElementById('confirmPasswordInput').value;

		var isValid = true;

		var errorMessages = document.getElementsByClassName('error-message');
		for (var i = 0; i < errorMessages.length; i++) {
			errorMessages[i].innerText = '';
		}

		if (id.trim() === '') {
			document.getElementById('idError').innerText = 'Vui lòng nhập mã sản phẩm';
			isValid = false;
		}

		// Validate Name (required)
		if (name.trim() === '') {
			document.getElementById('nameError').innerText = 'Vui lòng nhập tên sản phẩm';
			isValid = false;
		}

		if (email.trim() === '') {
			document.getElementById('emailError').innerText = 'Vui lòng nhập email';
			isValid = false;
		}

		if (phone.trim() === '') {
			document.getElementById('phoneError').innerText = 'Vui lòng nhập số điện thoại';
			isValid = false;
		}

		if (address.trim() === '') {
			document.getElementById('addressError').innerText = 'Vui lòng nhập địa chỉ';
			isValid = false;
		}

		if (password.trim() === '') {
			document.getElementById('passwordError').innerText = 'Vui lòng nhập mật khẩu';
			isValid = false;
		}

		if (confirmPassword.trim() === '') {
			document.getElementById('confirmPasswordError').innerText = 'Vui lòng nhập lại mật khẩu';
			isValid = false;
		}

		if (password.trim() !== confirmPassword.trim()) {
			document.getElementById('confirmPasswordError').innerText = 'Mật khẩu không khớp';
			isValid = false;
		}

		return isValid;
	}
</script>
