<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div style="max-width: 1200px;" class="m-auto pt-5 pb-5">
            <p class="text-center" style="font-size: 23px; font-weight: bold;">GIỎ HÀNG</p>
            <div class="m-auto" style="width: 30%; height: 4px; background-color: black;"></div>
        </div>

        <div style="max-width: 1200px;" class="m-auto">

            <!-- product -->
             <form action="/saveorder" method="post">
            <div class="row mb-5">
                <div class="col-sm-8 p-4"
                    style="box-shadow: rgba(0, 0, 0, 0.2) 0px 12px 28px 0px, rgba(0, 0, 0, 0.1) 0px 2px 4px 0px, rgba(255, 255, 255, 0.05) 0px 0px 0px 1px inset;">
                    <h4 style="text-align: center; font-weight: bold;">Thông tin đặt hàng</h4>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="mb-3">
                                    <label class="form-label">Họ và tên</label>
                                    <input  value="${sessionScope.userss.name}"  style="border-radius: 0px;border: 2px solid rgb(205, 192, 50);" type="text"
                                        class="form-control"/>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="mb-3">
                                    <label class="form-label">Số điện thoại</label>
                                    <input value="${sessionScope.userss.phone}" path="" style="border-radius: 0px; border: 2px solid rgb(205, 192, 50) ;" type="text"
                                        class="form-control"/>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="mb-3">
                                    <label class="form-label">Email</label>
                                    <input  value="${sessionScope.userss.email}" style="border-radius: 0px; border: 2px solid rgb(205, 192, 50) ;" type="text"
                                        class="form-control"/>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="mb-3">
                                    <label class="form-label">Tỉnh</label>
                                    <input name="province"  value="${addressUserId.province}" style="border-radius: 0px;border: 2px solid rgb(205, 192, 50) ;" type="text"
                                        class="form-control"/>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="mb-3">
                                    <label class="form-label">Quận</label>
                                    <input name="district" value="${addressUserId.district}" style="border-radius: 0px; border: 2px solid rgb(205, 192, 50) ;" type="text"
                                        class="form-control"/>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="mb-3">
                                    <label class="form-label">Xã</label>
                                    <input name="country"  value="${addressUserId.country}"  style="border-radius: 0px; border: 2px solid rgb(205, 192, 50);" type="text"
                                        class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <!-- <button type="submit" class="btn btn-primary">Submit</button> -->
                    
                </div>
                <div class="col-sm-4 p-4 "
                    style="box-shadow: rgba(0, 0, 0, 0.2) 0px 12px 28px 0px, rgba(0, 0, 0, 0.1) 0px 2px 4px 0px, rgba(255, 255, 255, 0.05) 0px 0px 0px 1px inset;">
                    <!-- <h5>MÃ GIẢM GIÁ</h5> -->
                    <div class="row">
                        <!-- <div class="col-sm-9">
                                <div class="mb-3">
                                    <input type="email" class="form-control" id="exampleInputEmail1"
                                        aria-describedby="emailHelp">
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <button type="button" class="btn btn-outline-primary">Primary</button>
                            </div> -->

                        <div class="col-sm-6">
                            <h6>Tạm tính:</h6>
                        </div>
                        <div class="col-sm-6 text-right">
                            <h6 style="text-align: right; color:red";><fmt:formatNumber value="${totalCart}" pattern="###,###,###.##" />
				đ</h6>
                        </div>
                        <div class="col-sm-6">
                            <h6 style=color:red";>Giảm giá:</h6>
                        </div>
                        <div class="col-sm-6 text-right">
                            <h6 style="text-align: right;">0</h6>
                        </div>
                        <hr>
                        <div class="col-sm-6">
                            <h3>TỔNG CỘNG:</h3>
                        </div>
                        <div class="col-sm-6 text-right">
                            <h3 style="text-align: right; color:red"><fmt:formatNumber value="${totalCart}" pattern="###,###,###.##" />
				đ</h3>
                        </div>
                        <button style="background-color: rgb(205, 192, 50); border-radius: 0px; color: white; font-weight: bold;"
                            type="submit" class="btn py-2">Đặt hàng</button>
                    </div>
                </div>
            </div>
             </form>
        </div>
        
