 <%@ page pageEncoding="utf-8"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	     <div style="max-width: 1200px;" class="m-auto pt-5 pb-5">
	            <p class="text-center" style="font-size: 23px; font-weight: bold;">ĐẶT HÀNG THÀNH CÔNG</p>
	            <div class="m-auto mb-3" style="width: 30%; height: 4px; background-color: black;"></div>
	            <p style="font-size: 20px; font-weight: 500;">THÔNG TIN ĐƠN HÀNG:</p>
	            <div style=" box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;" class="p-3">
	            <p style="font-weight: 500;">Mã đơn hàng: ${order.id}</p>
	            <p style="font-weight: 500;">Ngày đặt: ${order.date}</p>
	            <p style="font-weight: 500;">Địa chỉ: ${order.ward}, ${order.district}, ${order.province}</p>
	            <p style="color: red; font-weight: 500;">Tổng tiền đơn hàng: <fmt:formatNumber
	                                    value="${totalorder}"
	                                    pattern="###,###,###.##" />đ</p>
	            <p style="font-weight: 500;">Sản phẩm:</p>
	            <c:forEach items="${detailOrder}" var="orderDetail">
	                                        <div class="row p-3">
	                                            <div class="col-sm-2">
	                                                <img src="image/${orderDetail.img}" style="width: 100px;" alt="">
	                                            </div>
	                                            <div class="col-sm-8">
	                                                <p style="font-weight: 500;">${orderDetail.productName}</p>
	                                                <p style="font-weight: 500;">Số lượng: ${orderDetail.qty}</p>
	                                            </div>  
	                                            <div class="col-sm-2">
	                                                <p style="color: red; font-weight: 500;"><fmt:formatNumber
	                                    value="${orderDetail.total}"
	                                    pattern="###,###,###.##" />đ</p>
	                                            </div>
	                                        </div>
	                                        <hr>  
	                                    </c:forEach>  
	            <a href="/user-order" style="font-weight: 500; background-color: rgb(205, 192, 50);" type="button" class="btn  px-4 py-2 text-center">Xem lịch sử đặt hàng</a>
	            </div>
	        </div>