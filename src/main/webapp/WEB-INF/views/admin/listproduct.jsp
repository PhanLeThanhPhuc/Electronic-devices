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
				<a href="/admin/form-product-insert"  class="btn btn-primary mb-4">+</a>
			<form class="d-flex mb-3" action="/admin/list-product" method="get">
	        <input name="keyword" style="width: 300px;" class="form-control me-2" type="search" placeholder="Nhập mã đơn hàng, tên đơn hàng..." aria-label="Search">
	        <button class="btn btn-outline-success ml-3" type="submit">Tìm kiếm</button>
	        </form>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">MÃ SẢN PHẨM</th>
						<th scope="col">TÊN SẢN PHẨM</th>
						<th scope="col">GIÁ</th>
						<th scope="col">SỐ LƯỢNG</th>
						<th scope="col">GIẢM GIÁ</th>
						<th scope="col">ẢNH</th>
						<th scope="col">LOẠI</th>
						<th scope="col">NHÀ SẢN XUẤT</th>
						<th scope="col">GHI CHÚ</th>	
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${listProduct.content}" var="product">
					<tr>
						<th scope="row">${product.id}</th>
						<td>${product.name}</td>
						<td><fmt:formatNumber value="${product.price}"
								pattern="###,###,###.##" />đ</td>
						<td>${product.qty}</td>
						<td>${product.discount}</td>
						<td><img src="/image/${product.img}" style="width: 100px;" alt=""></td>
						<td>${product.category.name}</td>
						<td>${product.brand.name}</td>
						<td><a class="btn btn-primary" href="/admin/edit-product?id=${product.id}">Edit</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="container">
					<nav aria-label="Page navigation">
						<ul class="pagination" id="pagination"></ul>
					</nav>
					<form id="sumitForm" action="/admin/list-product" method="get">
						<input id="page" name="p" type="hidden">
					</form>
				</div>
		</div>

	</div>
</section>
<script>
$(function () {
    window.pagObj = $('#pagination').twbsPagination({
        totalPages: ${listProduct.totalPages},
        visiblePages: 5,
        startPage: ${listProduct.number+1},
        onPageClick: function (event, page) {
            console.info(page)
            
            if(page!=${listProduct.number+1}){
            	$('#page').val(parseInt(page-1));
            	$('#sumitForm').submit();
            }
        }
    }).on('page', function (event, page) {
        console.info(page + ' (from event listening)');
    });
});
</script>

