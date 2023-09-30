<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div style="background-color: #f2f3f4;">

	<div class="mt-4"
		style="background-color: #fff; border: 1px solid #fff;">
		<div style="max-width: 1300px;" class="m-auto mt-2 mb-2">
			<div class="mt-4">
				<span class="text-center"
					style="font-size: 18px; font-weight: bold;">DANH MỤC SẢN
					PHẨM</span>
				<div class=""
					style="width: 203px; height: 2px; background-color: black;"></div>
			</div>
		</div>
		<div style="max-width: 1200px; background-color: #fff;"
			class="m-auto p-3">
			<div style="max-width: 1200px; background-color: #fff;"
				class="m-auto p-3">
				<div class="row m-0">
					<c:forEach items="${categoryAll}" var="category">
						<div class="col-sm-2 text-center">
							<div>
								<a style="text-decoration: none;"
									href="/productcategory?id=${category.id}"><img
									src="image/${category.img}" style="width: 70px;" alt="">
									<h6>${category.name}</h6></a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

		</div>
	</div>


	<div
		style="max-width: 1300px; background-color: #fff; border-radius: 10px;"
		class="m-auto mt-4">
		<div class="row m-auto">
			<div style="max-width: 1300px;" class="m-auto  mb-3 mt-3">
				<span class="text-center"
					style="font-size: 18px; font-weight: bold;">TẤT CẢ SẢN PHẨM
					<div class=""
						style="width: 203px; height: 2px; background-color: black;"></div>
			</div>


			<div class="col-sm-12">
				<div class="row ">
					<div class="col-sm-9">
						<form class="d-flex" action="/product-all-shareandpage" method="get">
							<input style="border-radius: 0px;" class="form-control me-2"
								type="search" name="keyword" placeholder="Nhập tên sản phẩm cần tìm..."
								aria-label="Search">
							<button style="border-radius: 0px;"
								class="btn btn-outline-success" type="submit">Search</button>
						</form>
					</div>

					<div class="col-sm-3">
						<div class="input-group mb-3">
							<label class="input-group-text" style="border-radius: 0px;"
								for="inputGroupSelect01"><i
								class="fa-solid fa-filter fa-beat"></i></label> <select
								style="border-radius: 0px;" class="form-select"
								id="inputGroupSelect01">
								<option selected>Vui lòng chọn...</option>
								<option value="1">Từ A-Z</option>
								<option value="2">Từ Z-A</option>
								<option value="3">Giá cao đến thấp</option>
								<option value="3">Giá thấp đến cao</option>
							</select>
						</div>
					</div>
				</div>

				<div class="row">
					<c:forEach items="${productAll.content}" var="product">
						<div class="col-md-3 col-sm-6 mb-3">
									<div class="product-grid">
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
				<div class="container">
					<nav aria-label="Page navigation">
						<ul class="pagination" id="pagination"></ul>
					</nav>
					<form id="sumitForm" action="/product-all-shareandpage" method="get">
						<input id="page" name="p" type="hidden">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: ${productAll.totalPages},
            visiblePages: 5,
            startPage: ${productAll.number+1},
            onPageClick: function (event, page) {
                console.info(page)
                
                if(page!=${productAll.number+1}){
                	$('#page').val(parseInt(page-1));
                	$('#sumitForm').submit();
                }
            }
        }).on('page', function (event, page) {
            console.info(page + ' (from event listening)');
        });
    });
    
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