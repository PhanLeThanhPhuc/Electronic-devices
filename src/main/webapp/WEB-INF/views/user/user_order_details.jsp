<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
            <div class="m-auto mt-5 mb-5 " 
                style=" max-width: 1200px;border-radius: 20px; padding: 20px; box-shadow: rgba(0, 0, 0, 0.2) 0px 12px 28px 0px, rgba(0, 0, 0, 0.1) 0px 2px 4px 0px, rgba(255, 255, 255, 0.05) 0px 0px 0px 1px inset;">
                <div class="row">
                    <div class="col-sm-3">
                        <ul class="list-group">
                            <a style="text-decoration: none;" href="/userinfo">
                                <li style="font-weight: 500;" class="list-group-item d-flex justify-content-between align-items-center">
                                    Thông tin cá nhân
                               
                                  </li>
                            </a>
                            <a style="text-decoration: none;" href="">
                                <li style="background-color: rgb(242, 223, 16); font-weight: 500;" class="list-group-item d-flex justify-content-between align-items-center">
                                    Đơn hàng
                          
                                  </li>
                            </a>
                            <a style="text-decoration: none;" href="">
                                <li style=" font-weight: 500;" class="list-group-item d-flex justify-content-between align-items-center">
                                    Địa chỉ
                       
                                  </li>
                            </a>
                          </ul>
                    </div>
                    <div class="col-sm-9" style="">
                       <div class="row">
                             <div class="col-sm-6" style="border-radius: 10px; ">
                                        <div >
                                            <h6 class="mb-3" style="font-weight: 700;">THÔNG TIN KHÁCH HÀNG</h6>
                                            <p style="font-weight: 500;">Họ và tên: ${sessionScope.userss.name}</p>
                                            <p style="font-weight: 500;">Địa chỉ: ${Order.ward}, ${Order.district},
                                                ${Order.province}</p>
                                                   <p style="font-weight: 500;">Số điện thoại: ${sessionScope.userss.phone}</p>
                                        </div>
                                    </div>
                                    <div class="col-sm-6" style="border-radius: 10px;">
                                        <div >
                                        <h6 class="mb-3" style="font-weight: 700;">THÔNG TIN ĐƠN HÀNG</h6>
                                        <p style="font-weight: 500;">Mã đơn hàng: ${Order.id}</p>
                                        <p style="font-weight: 500;">Ngày đặt: <fmt:formatDate value="${Order.date}" pattern="dd/MM/yyyy" />
                                           </p>
                                           <p style="font-weight: 500;">Trạng thái:   <c:choose>
                            <c:when test="${Order.status == 'X'}">
                                <span style="color: blue; font-style: italic;">Đang xử lí</span>
                            </c:when>
                            <c:when test="${Order.status == 'N'}">
                                <span style="color: green; font-style: italic;">Đã nhận hàng</span>
                            </c:when>
                            <c:when test="${Order.status == 'H'}">
                                <span style="color: red; font-style: italic;">Đã hủy</span>
                            </c:when>
                        </c:choose></p>
                                        </div>
                                    </div>
                            <div class="col-sm-12 mt-3" style="border-radius: 10px;box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                                <div class="p-2">
                                    <h6 style="font-weight: 700;" >THÔNG TIN SẢN PHẨM</h6>
                                </div>
                                <c:forEach items="${detailOrder}" var="orderDetail">
	                                <div class="row p-3">
	                                    <div class="col-sm-2">
	                                        <img src="/image/${orderDetail.img}" style="width: 100px;" alt="">
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
                            </div>
                       </div>
                    </div>
                </div>
                <h6 class="mt-3"></h6>
            </div>