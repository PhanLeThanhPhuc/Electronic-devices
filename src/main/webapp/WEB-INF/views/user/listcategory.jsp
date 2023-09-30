<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<a href="/form-insert-category"  class="btn btn-primary mb-4">+</a>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Category Name</th>
						<th scope="col">Image</th>
						<th scope="col">Edit</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${category}" var="category">
					<tr>
						<th scope="row">${category.id}</th>
						<td>${category.name}</td>
						<td><img src="/image/${category.img}" style="width: 100px;" alt=""></td>
						<td><a class="btn btn-primary" href="/edit-category?id=${category.id}">Edit</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
</section>
