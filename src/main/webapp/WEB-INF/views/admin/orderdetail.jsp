<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.table {
	table-layout: fixed;
	width: 100%;
	text-align: center;
	/* align-items: center; */
}

.table th, .table td {
	width: 25%;
	text-align: center;
	vertical-align: middle;
	font-weight: 650;
	/* font-size: 10px; */
}
</style>
<section class="content">
	<div class="container-fluid">
		<div class="p-5"
			style="box-shadow: rgba(0, 0, 0, 0.15) 0px 5px 15px 0px; border-radius: 20px; background-color: #ffff;">

			<c:if test="${Order.status!='H' && Order.status!='N'}">
				<a href="/admin/delivery-order?id=${Order.id}"
					class="btn btn-success mb-4">Giao hàng</a>
				<a href="/admin/cancel-order?id=${Order.id}"
					class="btn  btn-danger mb-4">Hủy đơn hàng</a>
			</c:if>
			<div class="col-sm-9" style="">
				<div class="row ">
					<div class="col-sm-6" style="border-radius: 10px;">
						<div>
							<h6 class="mb-3" style="font-weight: 700;">THÔNG TIN KHÁCH
								HÀNG</h6>
							<p style="font-weight: 500;">Họ và tên: ${user.name}</p>
							<p style="font-weight: 500;">Địa chỉ: ${Order.ward},
								${Order.district}, ${Order.province}</p>
							<p style="font-weight: 500;">Địa chỉ: ${user.phone}</p>
						</div>
					</div>
					<div class="col-sm-6" style="border-radius: 10px;">
						<div>
							<h6 class="mb-3" style="font-weight: 700;">THÔNG TIN ĐƠN
								HÀNG</h6>
							<p style="font-weight: 500;">Mã đơn hàng: ${Order.id}</p>
							<p style="font-weight: 500;">
								Ngày đặt:
								<fmt:formatDate value="${Order.date}" pattern="dd/MM/yyyy" />
							</p>
							<p style="font-weight: 500;">
								Trạng thái:
								<c:choose>
									<c:when test="${Order.status == 'X'}">
										<span style="color: blue; font-style: italic;">Đang xử
											lí</span>
									</c:when>
									<c:when test="${Order.status == 'N'}">
										<span style="color: green; font-style: italic;">Đã nhận
											hàng</span>
									</c:when>
									<c:when test="${Order.status == 'H'}">
										<span style="color: red; font-style: italic;">Đã hủy</span>
									</c:when>
								</c:choose>
							</p>
						</div>
					</div>
					<div class="col-sm-12 mt-3"
						style="border-radius: 10px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
						<div class="p-2">
							<h6 style="font-weight: 700;">THÔNG TIN SẢN PHẨM</h6>
						</div>
						<c:forEach items="${detailOrder}" var="orderDetail">
							<div class="row p-3">
								<div class="col-sm-2">
									<img src="/image/${orderDetail.img}" style="width: 100px;"
										alt="">
								</div>
								<div class="col-sm-8">
									<p style="font-weight: 500;">${orderDetail.productName}</p>
									<p style="font-weight: 500;">Số lượng: ${orderDetail.qty}</p>
								</div>
								<div class="col-sm-2">
									<p style="color: red; font-weight: 500;">
										<fmt:formatNumber value="${orderDetail.total}"
											pattern="###,###,###.##" />
										đ
									</p>
								</div>
							</div>
							<hr>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

	</div>
</section>

<script>
	
$(document).ready(function() {
	
	<c:if test="${not empty sessionScope.CancelOrder}">
	$.toast({
		text : "${CancelOrder}", 
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

	<%session.removeAttribute("CancelOrder");%>
	</c:if>
	
	<c:if test="${not empty sessionScope.DeliveryOrder}">
	$.toast({
		text : "${DeliveryOrder}", 
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
<%session.removeAttribute("DeliveryOrder");%>
</c:if>
});
	

   </script>