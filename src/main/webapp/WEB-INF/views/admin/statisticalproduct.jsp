 <%@ page pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <section class="content">
        <div class="container-fluid">
            <div class="p-5"
                style="box-shadow: rgba(0, 0, 0, 0.15) 0px 5px 15px 0px; border-radius: 20px;">
                
                <h5 class="text-center" style="font-weight: 700;">THỐNG KÊ DOANH THU THEO LOẠI</h5>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">LOẠI HÀNG</th>
                            <th scope="col">DOANH THU</th>
                            <th scope="col">SỐ LƯỢT BÁN</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${renoveByCategory}" var="renoveByCategory">
                        <tr>
                            <th scope="row">${renoveByCategory.categoryName}</th>
                            <td><fmt:formatNumber
                                    value="${renoveByCategory.totalRevenue}"
                                    pattern="###,###,###.##" />đ</td>
                            <td>${renoveByCategory.totalQuantity}</td>	
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