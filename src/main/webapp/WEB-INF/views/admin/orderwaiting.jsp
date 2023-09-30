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
			style="box-shadow: rgba(0, 0, 0, 0.15) 0px 5px 15px 0px; border-radius: 20px;">
			<a href="/admin/creatuser"  class="btn btn-primary mb-4">+</a>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">MÃ ĐƠN HÀNG</th>
						<th scope="col">TÊN KHÁCH HÀNG</th>
						<th scope="col">THỜI GIAN MUA</th>
						<th scope="col">TỔNG TIỀN</th>
						<th scope="col">TRẠNG THÁI</th>
						<th scope="col">CHI TIẾT</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${order}" var="order">
					<tr>
						<th scope="row">${order.id}</th>
						<td>${order.user.name}</td>
						<td>${order.date}</td>
						<td><fmt:formatNumber value="${order.total}"
								pattern="###,###,###.##" />đ</td>
						<td><c:choose>
									<c:when test="${order.status == 'X'}"><span style="color: blue; font-style: italic;">Đang xử lí</span></c:when>
									<c:when test="${order.status == 'N'}"><span style="color: green; font-style: italic;">Đã nhận hàng</span></c:when>
									<c:when test="${order.status == 'H'}"><span style="color: red; font-style: italic;">Đã hủy</span></c:when>
								</c:choose></td>
						<td><a class="btn btn-primary" href="/order/view-order-detail?idorder=${order.id}">Chi tiết</a>
						
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
</section>


