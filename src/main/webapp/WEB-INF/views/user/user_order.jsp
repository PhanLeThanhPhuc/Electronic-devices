<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="m-auto mt-5 mb-5 "
	style="max-width: 1200px; border-radius: 20px; padding: 20px; box-shadow: rgba(0, 0, 0, 0.2) 0px 12px 28px 0px, rgba(0, 0, 0, 0.1) 0px 2px 4px 0px, rgba(255, 255, 255, 0.05) 0px 0px 0px 1px inset;">
	<div class="row">
		<div class="col-sm-3">
			<ul class="list-group">
				<a style="text-decoration: none;" href="/userinfo">
					<li style="font-weight: 500;"
					class="list-group-item d-flex justify-content-between align-items-center">
						Thông tin cá nhân</li>
				</a>
				<a style="text-decoration: none;" href="">
					<li
					style="background-color: aquamarine; background-color: rgb(242, 223, 16); font-weight: 500;"
					class="list-group-item d-flex justify-content-between align-items-center">
						Đơn hàng</li>
				</a>
				<a style="text-decoration: none;" href="">
					<li style="font-weight: 500;"
					class="list-group-item d-flex justify-content-between align-items-center">
						Địa chỉ</li>
				</a>
			</ul>
		</div>
		<div class="col-sm-9">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">Mã đơn hàng</th>
						<th scope="col">Thời gian mua</th>
						<th scope="col">Tổng tiền</th>
						<th scope="col">Trạng thái</th>
						<th scope="col">Chi tiết</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${informationOrder}" var="order">
						<tr>
						
							<th scope="row">${order.id}</th>
							<td><fmt:formatDate value="${order.date}" pattern="dd/MM/yyyy" /></td>
							<td><fmt:formatNumber value="${order.total}"
									pattern="###,###,###.##" />đ</td>
							<td><c:choose>
									<c:when test="${order.status == 'X'}"><span style="color: blue; font-style: italic; ">Đang xử lí</span></c:when>
									<c:when test="${order.status == 'N'}"><span style="color: green; font-style: italic;">Đã nhận hàng</span></c:when>
									<c:when test="${order.status == 'H'}"><span style="color: red; font-style: italic;">Đã hủy</span></c:when>
								</c:choose></td>

							<td><a href="/user-order-details?idorder=${order.id}"
								class="btn btn-primary">Chi tiết</a> <c:if
									test="${order.status=='X'}">
									<a href="/cancelorder?id=${order.id}"
										class="btn btn-outline-danger">Hủy</a>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<h6 class="mt-3"></h6>
</div>
<script>
<c:if test="${not empty sessionScope.cancalorder}">
$(document).ready(function() {
	$.toast({
		text : "${cancalorder}", // Text that is to be shown in the toast
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
<%
session.removeAttribute("cancalorder");
%>
</c:if>
</script>