<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
a {
	font-size: 14px;
	font-weight: 700
}

.superNav {
	font-size: 13px;
}

.form-control {
	outline: none !important;
	box-shadow: none !important;
}

@media screen and (max-width:540px) {
	.centerOnMobile {
		text-align: center
	}
}
</style>


<div class="superNav border-bottom py-2 bg-light">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 centerOnMobile">
				<select id="ngonngu" class="me-3 border-0 bg-light">
					<option value="?lang=en">ENGLISH</option>
					<option value="?lang=vi">TIẾNG VIỆT</option>
				</select> <span
					class="d-none d-lg-inline-block d-md-inline-block d-sm-inline-block d-xs-none me-3"><strong>thanhphuc@gmail.com</strong></span>
				<span class="me-3"><i
					class="fa-solid fa-phone me-1 text-warning"></i> <strong>0346363860</strong></span>
			</div>
			<div
				class="col-lg-6 col-md-6 col-sm-12 col-xs-12 d-none d-lg-block d-md-block-d-sm-block d-xs-none text-end">
				<span class="me-3"><i
					class="fa-solid fa-truck text-muted me-1"></i><a class="text-muted"
					href="#">Shipping</a></span> <span class="me-3"><i
					class="fa-solid fa-file  text-muted me-2"></i><a class="text-muted"
					href="#">Policy</a></span>
			</div>
		</div>
	</div>
</div>
<nav
	class="navbar navbar-expand-lg bg-white sticky-top navbar-light p-3 shadow-sm">
	<div class="container">
		<a class="navbar-brand" href="/home"><i
			class="fa-solid fa-shop me-2"></i> <strong>ONLINE SHOP</strong></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="mx-auto my-3 d-lg-none d-sm-block d-xs-block">
			<div class="input-group">
				<span class="border-warning input-group-text bg-warning text-white"><i
					class="fa-solid fa-magnifying-glass"></i></span> <input type="text"
					class="form-control border-warning" style="color: #7a7a7a">
				<button class="btn btn-warning text-white">Search</button>
			</div>
		</div>

		<div class=" collapse navbar-collapse" id="navbarNavDropdown">
			<div class="ms-auto d-none d-lg-block">
				<div class="input-group">
					<span
						class="border-secondary  input-group-text bg-secondary  text-white"><i
						class="fa-solid fa-magnifying-glass"></i></span> <input id="search-input"
						placeholder="<s:message
							code="lo.mn.search" />" type="text" name="test"
						class="form-control border-secondary " style="color: #7a7a7a">

					<button id="search-button" class="btn btn-secondary text-white"><s:message
							code="lo.mn.buttonsearch" /></button>
				</div>
			</div>

			<ul class="navbar-nav ms-auto ">

				<li class="nav-item"><a
					class="nav-link mx-2 text-uppercase gradient-text" href="/home"><s:message
							code="lo.mn.home" /></a></li>
				<li class="nav-item"><a
					class="nav-link mx-2 text-uppercase gradient-text"
					href="/product-all-shareandpage"><s:message
							code="lo.mn.product" /></a></li>
				<li class="nav-item"><a class="nav-link mx-2 text-uppercase"
					href="#"><s:message code="lo.mn.contact" /></a></li>
				<li class="nav-item"><a class="nav-link mx-2 text-uppercase"
					href="#"><s:message code="lo.mn.support" /></a></li>
			</ul>
			<ul class="navbar-nav ms-auto ">
				<li class="nav-item" id="cart-count"><a
					class="nav-link mx-2 text-uppercase" href="/viewcart"><i
						class="fa" style="font-size: 24px">&#xf07a;</i> <span
						class='badge badge-warning' id='lblCartCount'>${countCart}</span>
				</a></li>
				<!-- <li class="nav-item">
						<a class="nav-link mx-2 text-uppercase" href="#"><i class="fa-solid fa-circle-user me-1"></i>
							Account</a>
					</li> -->
				<c:choose>
					<c:when test="${empty sessionScope.userss}">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle gradient-text" href="#"
							id="navbarDropdown" role="button" data-bs-toggle="dropdown"
							aria-expanded="false"> TÀI KHOẢN </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="/formlogin">Đăng
										nhập</a></li>
								<li><a class="dropdown-item" href="/formregister">Đăng
										kí</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="/form-forgotpassword">Quên
										mật khẩu</a></li>
							</ul></li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${sessionScope.userss.role == false}">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
									role="button" data-bs-toggle="dropdown" aria-expanded="false">
										${sessionScope.userss.name} </a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item" href="/userinfo">Thông
												tin tài khoản</a></li>
										<li><a class="dropdown-item" href="#">Đổi mật khẩu</a></li>
										<li>
											<hr class="dropdown-divider">
										</li>
										<li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
									</ul></li>
							</c:when>
							<c:when test="${sessionScope.userss.role}">
								<ul class="navbar-nav me-auto mb-2 mb-lg-0 d-flex">
									<li class="nav-item dropdown"><a
										style="font-style: italic;" class="nav-link dropdown-toggle"
										href="#" id="navbarDropdown" role="button"
										data-bs-toggle="dropdown" aria-expanded="false">${sessionScope.userss.name}</a>
										<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
											<li><a class="dropdown-item" href="/userinfo">Thông
													tin tài khoản</a></li>
											<li><a class="dropdown-item" href="/form-change-pass">Đổi mật khẩu</a></li>
											<li><a href="/admin/homeadmin" class="dropdown-item"
												href="#">Đi tới trang Admin</a></li>
											<li>
												<hr class="dropdown-divider">
											</li>
											<li><a class="dropdown-item" href="/logout">Đăng
													xuất</a></li>
										</ul></li>
								</ul>
							</c:when>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>
<script>
	document
			.getElementById("search-button")
			.addEventListener(
					"click",
					function() {
						var searchValue = document
								.getElementById("search-input").value;
						window.location.href = "/product-all-shareandpage?keyword="
								+ searchValue;
					});

	$(document).ready(function() {
		$("#ngonngu").on("change", function() {
			var param = $(this).val();
			localStorage.setItem("selectedcbo", param);
			console.log(localStorage.getItem("selectedcbo"));
			$.ajax({
				url : "/home" + param,
				success : function() {
					location.reload();
				}
			});
			return false;
		})
		var valuecbb = localStorage.getItem("selectedcbo");
		if (valuecbb !== null) {
			$("#ngonngu").val(valuecbb);
		}
	})

	
</script>