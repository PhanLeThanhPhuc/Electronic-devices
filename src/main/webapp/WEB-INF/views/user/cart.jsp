<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<div style="max-width: 1200px;" class="m-auto pt-5 pb-5">
	<p class="text-center" style="font-size: 23px; font-weight: bold;">GIỎ
		HÀNG</p>
	<div class="m-auto"
		style="width: 30%; height: 4px; background-color: black;"></div>
</div>
<div
	style="max-width: 1200px; border-radius: 10px;; box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;"
	class="m-auto mb-5 p-4">
	<div class="row">
		<div class="col-sm-6">
			<form class="">
				<button
					style="background-color: rgb(205, 192, 50); font-weight: 500; border: none; border-radius: 0px;"
					formaction="/home" type="submit" class="btn btn-primary"><<
					QUAY VỀ TRANG CHỦ</button>
			</form>
		</div>
		<div class="col-sm-6" style="text-align: right;">
			<form class="">
				<button
					style="background-color: rgb(205, 192, 50); font-weight: 500; border: none; border-radius: 0px;"
					formaction="/order" type="submit" class="btn btn-primary">
					TIẾN HÀNH ĐẶT HÀNG>></button>
			</form>
		</div>
	</div>
	<table class="table">
		<thead>
			<tr>
				<th>ẢNH</th>
				<th>TÊN SẢN PHẨM</th>
				<th>GIÁ</th>
				<th>SỐ LƯỢNG</th>
				<th>TỔNG</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${viewProduct}" var="productCart">
				<form action="/sumQty">
					<input type="hidden" name="id" class="idproduct"
						value="${productCart.id}">
					<tr>
						<th><img src="/image/${productCart.img}"
							style="width: 100px;" alt=""> <br>
							<p class="mt-3">
								<a class="btn btn-primary" style="text-decoration: none;"
									href="/deleteproduct?id=${productCart.id}">DELETE</a>
							</p></th>
						<td>${productCart.name}</td>
						<td><fmt:formatNumber value="${productCart.price}"
								pattern="###,###,###.##" />đ</td>
						<td>
							<div class="input-group" style="width: 120px; margin: 0 auto;">
								<button type="button" name="${productCart.id}"
									class="input-group-text decrease-quantity btnTru"
									style="border-radius: 0;">-</button>
								<input id="qty${productCart.id}" type="text" name="qty"
									class="form-control quantity text-center"
									value="${productCart.qty}">
								<button onclick="getValue(this)" name="${productCart.id}"
									type="button" style="border-radius: 0;"
									class="input-group-text increase-quantity btnCong">+</button>
							</div>
							<button type="submit" class="btn btn-primary mt-3">Cập
								nhật</button>
						</td>
						<td><fmt:formatNumber
								value="${productCart.price * productCart.qty}"
								pattern="###,###,###.##" />đ</td>
					</tr>
				</form>
			</c:forEach>
		</tbody>
	</table>
	<div class="mt-3 mb-3">
		<div class="row">
			<div class="col-sm-6">
				<a
					style="background-color: rgb(205, 192, 50); font-weight: 500; border: none; border-radius: 0px;"
					href="/deleteallproduct" type="submit" class="btn btn-primary">XÓA
					TẤT CẢ</a>
			</div>
			<div class="col-sm-6" style="text-align: right;">
				<h4 class="m-0">
					TỔNG TIỀN:
					<fmt:formatNumber value="${totalCart}" pattern="###,###,###.##" />
					đ
				</h4>
			</div>
		</div>
	</div>
</div>

<script>
	$('.btnTru').click(function() {
		var id = $(this).attr('name');
		var qty = $('#qty' + id).val();
		if (qty != 1) {
			$('#qty' + id).val(parseInt(qty) - 1);
		} else {
			$('#qty' + id).val('1');
		}
	});

	$('.btnCong').click(function() {
		var id = $(this).attr('name');
		console.log(id);
		var qty = $('#qty' + id).val();
		console.log(qty);
		$('#qty' + id).val(parseInt(qty) + 1);
	});

	<c:if test="${not empty sessionScope.successMessage}">
	$(document).ready(function() {
		$.toast({
			text : "Cập nhật giỏ hàng thành công.", 
			heading : 'Thông báo!',
			icon : 'success',
			showHideTransition : 'fade', 
			allowToastClose : true,
			hideAfter : 3000, 
			stack : false,
			position : 'top-right',
			textAlign : 'left', 
			loader : true, 
			loaderBg : '#9EC600', 
		});

	});
<%session.removeAttribute("successMessage");%>
	</c:if>
	
</script>
