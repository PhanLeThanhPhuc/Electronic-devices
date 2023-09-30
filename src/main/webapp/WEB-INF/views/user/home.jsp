<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div style="background: radial-gradient(50.08% 44.51% at 50% 50%, rgba(188, 134, 143, 0.2) 0, rgba(255,192,203,0) 100%), radial-gradient(60.76% 48.01% at 0 100%, rgba(255,192,203,.2) 0, rgba(255,192,203,0) 100%), #f2f3f4; }">
<div>
	<div id="carouselExampleControls" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/image/s20-plus-pc-banner.jpg"
					class="d-block w-100" alt="...">
			</div>
			<!-- <div class="carousel-item">
                        <img src="image/banner-tgdd-800x300.jpg" class="d-block w-100" alt="...">
                    </div> -->
			<!-- <div class="carousel-item">
                        <img src="..." class="d-block w-100" alt="...">
                    </div> -->
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
</div>
<div style="border: 1px solid #ffff;background:#ffff;" class="mt-4">
<div class="container-category pt-4" >
	<div class="category mt-4 mb-2">
		<!-- <p>fmdkk</p -->
		<div class="row mb-3">
			<div class="col-sm-6">
				<p class="text1 m-0 ">
					<a href="">DANH MỤC SẢN PHẨM</a>
				</p>
			</div>
			<div class="col-sm-6 ">
				<p class="text2 m-0 ">
					<a style="font-weight: bold; font-size: 18px;" href="">Show all</a>
				</p>
			</div>
		</div>
		<div style="width: 100%; height: 2px; background-color: black;"></div>
	</div>
</div>

<!-- ds danh muc -->
<div class="container-categorylist mb-5">
	<div class="categorylist">
		<div class="row">
			<c:forEach items="${listCategory}" var="category">
				<div class="col-sm-2 mt-3">
					<a style="text-decoration: none"
						href="/productcategory?id=${category.id}">
						<div class="card"
							style="border: 1px solid #009393; box-shadow: rgba(0, 0, 0, 0.18) 0px 2px 4px;">
							<img src="/image/${category.img}" style="width: 50px;"
								class="card-img-top m-auto " alt="img">
							<div class="card-body p-0 m-0">
								<p style="font-weight: bold;" class="card-title text-center">${category.name}</p>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
</div>

<div style="border: 1px solid #ffff;background:#ffff;"   class="mt-4">
<div style="max-width: 1200px;" class="m-auto mt-5 mb-5">
	<p style="font-size: 22px; font-weight: bold;">SẢN PHẨM BÁN CHẠY NHẤT</p>
	<div style="width: 100%; height: 2px; background-color: black;"></div>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<button style="border: none; background-color: white;"
			class="float-end" type="button" data-bs-target="#carouselExampleIndicators"
			data-bs-slide="next">
			<!-- <span class="carousel-control-next-icon" aria-hidden="true"></span> -->
			<!-- -> -->
			<i style="font-size: 30px; padding: 10px;"
				class="fas fa-arrow-alt-circle-right fa-lg fa-fade"></i>

			<!-- <span class="visually-hidden">Next</span> -->
		</button>
		<button class="float-end"
			style="border: none; background-color: white;" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<!-- <span class="carousel-control-prev-icon" aria-hidden="true"></span> -->
			<!-- <- -->
			<i style="font-size: 30px; padding: 10px;"
				class="fas fa-arrow-alt-circle-left fa-lg fa-fade"></i>
			<!-- <span class="visually-hidden">Previous</span> -->
		</button>
		<div class="carousel-inner">
			<c:if test="${listProductTop10.size() > 0}">
				<div class="carousel-item active">
					<div class="row">
						<c:forEach var="item" items="${listProductTop10}" varStatus="loop">
							<div class="col-md-4 col-sm-6 mb-3">
									<div class="product-grid" style="height: 530px;">
										<div class="product-image">
											<a href="#" class="image"> <img class="pic-1 p-4"
												src="/image/${item.product.img}">
											</a> <span class="product-discount-label">
												  <img style="width: 70px;" src="/image/ban-chay-nhat-unscreen.gif" alt="">
											</span>
											 <ul class="product-links">
                       				  <a class="button-detail" href="/productdetail?productId=${item.product.id}&categoryId=${item.product.category.id}" type="button" class="btn btn-outline-success">Chi tiết</a>
                                    </ul>
										</div>
										<div class="product-content">
											<ul class="rating">
												<li class="fas fa-star"></li>
												<li class="fas fa-star"></li>
												<li class="fas fa-star"></li>
												<li class="far fa-star"></li>
												<li class="far fa-star"></li>
											</ul>
											<h3 class="title">
												<a href="#">${item.product.name}</a>
											</h3>
											<div class="price">
												<span>$90.00 </span><fmt:formatNumber value="${item.product.price}"
											pattern="###,###,###.##" />
										đ	
											</div>
											
											<div style="font-weight: bold;">
											<span>Đã bán: ${item.sum}</span>
											</div>
											
											
											<a id="${item.product.id}"  class="add-to-cart" >Thêm vào giỏ</a>
										</div>
									</div>
								</div>
							<c:if test="${(loop.index+1) %3 == 0 || (loop.index+1)  ==  listProductTop10.size()}">
					</div>
				</div>
				<c:if test="${(loop.index+1)  <  listProductTop10.size()}">
					<div class="carousel-item">
						<div class="row">
				</c:if>
			</c:if>
			</c:forEach>

			</c:if>
		</div>
	</div>

	</div>
	</div>
	
	
<div style="border: 1px solid #ffff;background:#ffff;"  class="mt-4 pb-4">
	<div style="max-width: 1200px;" class="m-auto mt-4">
		<p class="text-center" style="font-size: 23px; font-weight: bold;">TẤT
			CẢ SẢN PHẨM</p>
		<div class="m-auto"
			style="width: 30%; height: 4px; background-color: black;"></div>
	</div>

	<div style="max-width: 1200px;" class="m-auto pt-5">
		<div class="row">
			<c:forEach items="${listProduct}" var="product">
						<div class="col-md-3 col-sm-6 mb-3">
									<div class="product-grid" style="height: 400px;">
										<div class="product-image">
											<a href="#" class="image"> <img class="pic-1 p-4"
												src="/image/${product.img}">
											</a> <span class="product-discount-label">0</span>
											 <ul class="product-links">
                       				  <a class="button-detail" href="/productdetail?productId=${product.id}&categoryId=${product.category.id}" type="button" class="btn btn-outline-success">Chi tiết</a>
                                    </ul>
										</div>
										<div class="product-content">
											<ul class="rating">
												<li class="fas fa-star"></li>
												<li class="fas fa-star"></li>
												<li class="fas fa-star"></li>
												<li class="far fa-star"></li>
												<li class="far fa-star"></li>
											</ul>
											<h3 class="title">
												<a href="#">${product.name}</a>
											</h3>
											<div class="price">
												<span>$90.00 </span><fmt:formatNumber value="${product.price}"
											pattern="###,###,###.##" />
										đ
											</div>
											<a id="${product.id}"  class="add-to-cart" >Thêm vào giỏ</a>
										</div>
									</div>
								</div>
					</c:forEach>

		</div>
	</div>
</div>
	<script>
		
		<c:if test="${not empty sessionScope.logintc}">
		$(document).ready(function() {
			$.toast({
				text : "${logintc}.", // Text that is to be shown in the toast
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
	<%session.removeAttribute("logintc");%>
		</c:if>
		
		$('.add-to-cart').click(function() {
			console.log('Hello');
			var id = $(this).attr('id');
			console.log(id);
			
			$.ajax({
				url : '/add/'+id,
				type : 'GET',
				success : function(data) {
					console.log("DỮ LIỆU",data);
					$('#lblCartCount').html('');
					$('#lblCartCount').append(data);
				},
				error : function() {
					console.log('Lỗi'); 
				}
			});
			$.toast({
				text : "Thêm vào giỏ hàng thành công.", // Text that is to be shown in the toast
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
		
	</script>