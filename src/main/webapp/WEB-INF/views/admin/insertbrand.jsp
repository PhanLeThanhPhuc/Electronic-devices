<%@ page pageEncoding="utf-8" %>
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.error-message {
	color: red;
}
</style>
				<div class="col-sm-12 m-auto p-0 m-0">
    <a href="/admin/list-brand" class="btn btn-primary ml-5">Quay lại</a>
    <div class="container-user p-4 ml-2 mr-2 col-sm-7 m-auto"
        style="background-color: #fff; box-shadow: rgba(165, 163, 163, 0.24) 0px 3px 8px;">
        <form action="/admin/insert-brand" method="POST" enctype="multipart/form-data" class="m-auto"
            onsubmit="return validateForm()">
            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="col-sm-12">
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">TÊN NHÀ SẢN XUẤT
                                        <img src="image source" class="img-fluid rounded-top" alt="">
                                    </label>
                                    <input value="${brand.name}" name="name" type="text" class="form-control"
                                        id="nameInput">
                                    <p id="nameError" class="error-message"></p>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="mb-3">
                                    <label for="formFile" class="form-label">ẢNH</label>
                                    <input onchange="chooseFile(this)" value="" class="form-control" name="image"
                                        type="file" id="fileInput">
                                </div>
                                <input value="${brand.img}" name="img" type="hidden">
                                <p id="confirmPasswordError" class="error-message"></p>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="col-sm-12">
                                <div style="background-color: rgb(241, 241, 241); height: 200px;">
                                    <img id="image" style="width: 100%; height: 100%; object-fit: contain;"
                                        src="/image/${brand.img}" alt="">
                                </div>
                            </div>
                        </div>
                        <h6>${message}</h6>
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
        var name = document.getElementById('nameInput').value;

        var isValid = true;

        var errorMessages = document.getElementsByClassName('error-message');
        for (var i = 0; i < errorMessages.length; i++) {
            errorMessages[i].innerText = '';
        }

        if (name.trim() === '') {
            document.getElementById('nameError').innerText = 'Vui lòng nhập tên nhà sản xuất';
            isValid = false;
        }

        return isValid;
    }
</script>
