
		<%@ page pageEncoding="utf-8" %>
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				<div class="col-sm-12 m-auto p-0 m-0">
					<a href="/admin/homeadmin" class="btn btn-primary ml-5">Quay lại</a>
					<div class="container-user p-4 ml-2 mr-2 col-sm-7 m-auto"
						style="background-color: #fff; box-shadow: rgba(165, 163, 163, 0.24) 0px 3px 8px;">
						<form action="/admin/updateuseradmin" method="POST" class="m-auto">
							<div class="row">
								<div class="col-sm-12">
									<div class="row">
										<div class="col-sm-6">
											<div class="mb-3">
												<label for="exampleInputEmail1" class="form-label">TÊN ĐĂNG NHẬP
													<img src="image source" class="img-fluid rounded-top" alt="">
												</label> 
												<input readonly  value="${user.id}" name="id" type="text" class="form-control">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="mb-3">
												<label for="exampleInputEmail1" class="form-label">HỌ VÀ TÊN
													<img src="image source" class="img-fluid rounded-top" alt="">
												</label> 
												<input value="${user.name}" name="name" type="text" class="form-control">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="mb-3">
												<label for="exampleInputEmail1" class="form-label">EMAIL 
													<img src="image source" class="img-fluid rounded-top" alt="">
												</label> 
												<input value="${user.email}"  name="email"  type="text" class="form-control">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="mb-3">
												<label for="exampleInputEmail1" class="form-label">SỐ ĐIỆN THOẠI
													<img src="image source" class="img-fluid rounded-top" alt="">
												</label> 
												<input value="${user.phone}"  name="phone"  type="text" class="form-control">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="mb-3">
												<label for="exampleInputEmail1" class="form-label">ĐỊA CHỈ 
													<img src="image source" class="img-fluid rounded-top" alt="">
												</label> 
												<input name="address" value="${user.address}" type="text" class="form-control">
											</div>
										</div>
								
										<div class="col-sm-6">
											<div class="mb-3">
												<label for="formFile" class="form-label">QUYỀN</label><br>
												<div class="form-check form-check-inline">
													<input ${user.role == true ? "checked" : ""} class="form-check-input"  type="radio" name="role" id="inlineRadio1" value="true" >
													<label class="form-check-label" for="inlineRadio1">Admin</label>
												</div>
												<div class="form-check form-check-inline">
													<input ${user.role == false ? "checked" : ""} class="form-check-input" type="radio"   name="role" id="inlineRadio2" value="false">
													<label class="form-check-label" for="inlineRadio2">User</label>
												</div>
												
											</div>
										</div>	
										<h6 style="color: red;">${insertuser}</h6>
										<div style="text-align: center;">

											<button id="button"  type="submit" class="btn btn-warning">
												<i class="bi bi-arrow-clockwise"></i>Cập nhật
											</button>

											<button type="submit" class="btn btn-success">
												<i class="bi bi-arrow-clockwise"></i>Làm mới
											</button>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>