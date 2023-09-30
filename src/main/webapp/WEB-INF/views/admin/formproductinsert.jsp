
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.error-message {
	color: red;
}
</style>
<div class="col-sm-12 m-auto p-0 m-0" style="background-color: #f9f8f7;">
<a href="/admin/list-product" class="btn btn-primary ml-2 mb-2">Quay lại</a>
	<div class="container-user p-4 ml-2 mr-2"
		style="background-color: #fff; box-shadow: rgba(165, 163, 163, 0.24) 0px 3px 8px;">
		<form action="/admin/save-product" method="POST"
			enctype="multipart/form-data" onsubmit="return validateForm()">
			<div class="row">
				<div class="col-sm-8">
					<div class="row">
						
						<div class="col-sm-12">
							<div class="mb-3">
								<label for="nameInput" class="form-label">TÊN SẢN PHẨM<img
									src="image source" class="img-fluid rounded-top" alt=""></label>
								<input value="${formProduct.name}" name="name" id="nameInput"
									type="text" class="form-control">
								<p id="nameError" class="error-message"></p>
							</div>
						</div>
						<div class="col-sm-6">
						<div class="mb-3">
								<label for="idInput" class="form-label">MÃ SẢN PHẨM<img
									src="image source" class="img-fluid rounded-top" alt=""></label>
								<input value="${formProduct.id}" name="id" id="idInput"
									type="text" class="form-control">
								<p id="idError" class="error-message"></p>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="mb-3">
								<label for="priceInput" class="form-label">GIÁ <img
									src="image source" class="img-fluid rounded-top" alt=""></label>
								<input value="${formProduct.price}" name="price" id="priceInput"
									type="number" class="form-control">
								<p id="priceError" class="error-message"></p>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="mb-3">
								<label for="qtyInput" class="form-label">SỐ LƯỢNG <img
									src="image source" class="img-fluid rounded-top" alt=""></label>
								<input value="${formProduct.qty}" name="qty" id="qtyInput"
									type="number" class="form-control">
								<p id="qtyError" class="error-message"></p>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="mb-3">
								<label for="imageInput" class="form-label">ẢNH SẢN PHẨM</label>
								<input onchange="chooseFile(this)" value="" class="form-control"
									name="image" type="file" id="imageInput">
								<p id="imageError" class="error-message"></p>
							</div>
						</div>
						<input value="${formProduct.img}" name="img" type="hidden">
						<div class="col-sm-6">
							<div class="mb-3">
								<label for="categoryInput" class="form-label">LOẠI SẢN
									PHẨM</label>
								<div data-bs-spy="scroll" data-bs-target="#my-select"
									class="scrollspy-example">
									<select name="category.id" id="categoryInput"
										class="form-select" data-bs-select="on" data-bs-size="2">
										<option value="" selected>Chọn</option>
										<c:forEach var="listcbocategory" items="${listcbocategory}">
											<option
												${formProduct.category.id == listcbocategory.id ? "selected" : ""}
												value="${listcbocategory.id}">${listcbocategory.name}</option>
										</c:forEach>
									</select>
								</div>
								<p id="categoryError" class="error-message"></p>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="mb-3">
								<label for="brandInput" class="form-label">NHÀ SẢN XUẤT</label>
								<div data-bs-spy="scroll" data-bs-target="#my-select"
									class="scrollspy-example">
									<select name="brand.id" id="brandInput" class="form-select"
										data-bs-select="on" data-bs-size="2">
										<option value="" selected>Chọn</option>
										<c:forEach var="listcbobrand" items="${listcbobrand}">
											<option
												${formProduct.brand.id == listcbobrand.id ? "selected" : ""}
												value="${listcbobrand.id}">${listcbobrand.name}</option>
										</c:forEach>
									</select>
								</div>
								<p id="brandError" class="error-message"></p>
							</div>
						</div>
						<div class="mb-3 col-sm-12">
							<label for="descriptionInput" class="form-label">GHI CHÚ</label>
							<textarea ${formProduct.description} name="description"
								id="descriptionInput" class="form-control"
								placeholder="Nhập ghi chú (nếu có)" rows="3"></textarea>
						</div>
					</div>
					<h4>${message}</h4>
					<div style="text-align: center;">
						<button type="submit" class="btn btn-primary">
							<i class="bi bi-file-earmark-check"></i> Thêm
						</button>
					</div>
				</div>
				<div class="col-sm-4">
					<div style="background-color: rgb(241, 241, 241); height: 400px;">
						<img id="image"
							style="width: 100%; height: 100%; object-fit: contain;"
							src="/image/${formProduct.img}" alt="">
					</div>
				</div>
			</div>
		</form>
	</div>


	<script>
				chooseFile = (fileInput) => {
					if (fileInput.files && fileInput.files[0]) {
						var reader = new FileReader();
						reader.onload = (e) => {
							$('#image').attr('src', e.target.result);
						}
						reader.readAsDataURL(fileInput.files[0]);
					}
				}
				
				
				function validateForm() {
					  var id = document.getElementById('idInput').value;
					  var name = document.getElementById('nameInput').value;
					  var price = document.getElementById('priceInput').value;
					  var qty = document.getElementById('qtyInput').value;
					  var image = document.getElementById('imageInput').value;
					  var category = document.getElementById('categoryInput').value;
					  var brand = document.getElementById('brandInput').value;

					  var isValid = true;

					  // Clear previous error messages
					  var errorMessages = document.getElementsByClassName('error-message');
					  for (var i = 0; i < errorMessages.length; i++) {
					    errorMessages[i].innerText = '';
					  }

					  // Validate ID (required)
					  if (id.trim() === '') {
					    document.getElementById('idError').innerText = 'Vui lòng nhập mã sản phẩm';
					    isValid = false;
					  }

					  // Validate Name (required)
					  if (name.trim() === '') {
					    document.getElementById('nameError').innerText = 'Vui lòng nhập tên sản phẩm';
					    isValid = false;
					  }

					  // Validate Price (required, must be a number)
					  if (price.trim() === '' || isNaN(price)) {
					    document.getElementById('priceError').innerText = 'Vui lòng nhập giá sản phẩm hợp lệ';
					    isValid = false;
					  }

					  // Validate Quantity (required, must be a number)
					  if (qty.trim() === '' || isNaN(qty)) {
					    document.getElementById('qtyError').innerText = 'Vui lòng nhập số lượng hợp lệ';
					    isValid = false;
					  }

					  // Validate Image (required)
					  if (image.trim() === '') {
					    document.getElementById('imageError').innerText = 'Vui lòng chọn ảnh sản phẩm';
					    isValid = false;
					  }

					  // Validate Category (required)
					  if (category.trim() === '') {
					    document.getElementById('categoryError').innerText = 'Vui lòng chọn loại sản phẩm';
					    isValid = false;
					  }

					  // Validate Brand (required)
					  if (brand.trim() === '') {
					    document.getElementById('brandError').innerText = 'Vui lòng chọn nhà sản xuất';
					    isValid = false;
					  }

					  return isValid;
					}

			</script>