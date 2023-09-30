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
		<div class="p-5" style="box-shadow: rgba(0, 0, 0, 0.15) 0px 5px 15px 0px; border-radius: 20px;background-color: #ffff;">
    <div class="d-flex mb-4">
    <form class="d-flex" action="/admin/view-all-order-keyword" method="get">
        <input style="width: 300px;" class="form-control me-2" name="keyword" type="number" placeholder="Tìm kiếm theo mã đơn hàng" aria-label="Search">
         <button class="btn btn-outline-success ml-3" type="submit">Tìm kiếm</button>
         </form>
          <form class="d-flex" action="/admin/view-all-order" method="get">
         <input  name="p" type="hidden">
         <input name="status" value="${status}" type="hidden">
        <input style="width: 150px;" type="date" value="${mindate}" class="form-control ml-4" id="date" name="datemin">
        <input style="width: 150px;" type="date" value="${maxdate}" class="form-control ml-2" id="date" name="datemax">
        <button class="btn btn-outline-success ml-3" type="submit">Lọc</button>
      </form >
      <form class="d-flex ms-auto" id="myForm" action="/admin/view-all-order" method="get">
      <input  name="p" type="hidden">
		<input style="width: 150px;" type=hidden value="${mindate}" class="form-control ml-4"  name="datemin">
       	<input style="width: 150px;" type="hidden" value="${maxdate}" class="form-control ml-2"  name="datemax">
        <select  name="status" onchange="document.getElementById('myForm').submit();" style="width: 200px;" class="form-select ms-auto" aria-label="Default select example">
            <option value="">Tất cả đơn hàng</option>
             <option ${status == "X"? "selected" : ""} value="X">Đang xử lí</option>
             <option ${status == "N"? "selected" : ""} value="N">Đã nhận</option>
            <option ${status == "H"? "selected" : ""} value="H">Đã hủy</option>
        </select>
        </form>
    </div>
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
            <c:forEach items="${order.content}" var="order">
                <tr>
                    <th scope="row">${order.id}</th>
                    <td>${order.user.name}</td>
                    <td>${order.date}</td>
                    <td><fmt:formatNumber value="${order.total}" pattern="###,###,###.##" />đ</td>
                    <td>
                        <c:choose>
                            <c:when test="${order.status == 'X'}">
                                <span style="color: blue; font-style: italic;">Đang xử lí</span>
                            </c:when>
                            <c:when test="${order.status == 'N'}">
                                <span style="color: green; font-style: italic;">Đã nhận hàng</span>
                            </c:when>
                            <c:when test="${order.status == 'H'}">
                                <span style="color: red; font-style: italic;">Đã hủy</span>
                            </c:when>
                        </c:choose>
                    </td>
                    <td>
                        <a class="btn btn-primary" href="/admin/view-order-detail?idorder=${order.id}">Chi tiết</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
		<div class="container">
					<nav aria-label="Page navigation">
						<ul class="pagination" id="pagination"></ul>
					</nav>
					<form id="sumitForm" action="/admin/view-all-order" method="get">
						<input id="page" name="p" type="hidden">
							 <input name="status" value="${status}" type="hidden">
						 <input style="width: 150px;" type=hidden value="${mindate}" class="form-control ml-4"  name="datemin">
       					 <input style="width: 150px;" type="hidden" value="${maxdate}" class="form-control ml-2"  name="datemax">
					</form>
				</div>
</div>

	</div>
</section>
<script>
$(function () {
    window.pagObj = $('#pagination').twbsPagination({
        totalPages: ${order.totalPages},
        visiblePages: 5,
        startPage: ${order.number+1},
        onPageClick: function (event, page) {
            console.info(page)
            
            if(page!=${order.number+1}){
            	$('#page').val(parseInt(page-1));
            	$('#sumitForm').submit();
            }
        }
    }).on('page', function (event, page) {
        console.info(page + ' (from event listening)');
    });
});


</script>

