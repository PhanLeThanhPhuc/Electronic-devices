<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="content">
	<div class="container-fluid">

		<div class="p-5"
			style="box-shadow: rgba(0, 0, 0, 0.15) 0px 5px 15px 0px; border-radius: 20px; background-color: #ffff;">
							<a href="/admin/creatuser"  class="btn btn-primary mb-4">+</a>
		<form class="d-flex mb-3" action="/admin/homeadmin" method="get">
        <input name="keyword" style="width: 300px; " class="form-control me-2" type="search" placeholder="Nhập mã user, số điện thoại, email..." aria-label="Search">
        <button class="btn btn-outline-success ml-3" type="submit">Tìm kiếm</button>
        </form>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">Username</th>
						<th scope="col">Họ và tên</th>
						<th scope="col">Phone</th>
						<th scope="col">Email</th>
						<th scope="col">Địa chỉ</th>
						<th scope="col">Quyền</th>
						<th scope="col">Edit</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${user.content}" var="user">
					<tr>
						<th scope="row">${user.id}</th>
						<td>${user.name}</td>
						<td>${user.phone}</td>	
						<td>${user.email}</td>
						<td>${user.address}</td>
						<td>${user.role == true ? "Admin": "User"}</td>
						<td><a class="btn btn-primary" href="/admin/edituseradmin?id=${user.id}">Edit</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="container">
					<nav aria-label="Page navigation">
						<ul class="pagination" id="pagination"></ul>
					</nav>
					<form id="sumitForm" action="/admin/homeadmin" method="get">
						<input id="page" name="p" type="hidden">
						<input name="keyword" type="hidden">
					</form>
				</div>
		</div>

	</div>
</section>

<script>
$(function () {
    window.pagObj = $('#pagination').twbsPagination({
        totalPages: ${user.totalPages},
        visiblePages: 5,
        startPage: ${user.number+1},
        onPageClick: function (event, page) {
            console.info(page)
            
            if(page!=${user.number+1}){
            	$('#page').val(parseInt(page-1));
            	$('#sumitForm').submit();
            }
        }
    }).on('page', function (event, page) {
        console.info(page + ' (from event listening)');
    });
});
</script>
