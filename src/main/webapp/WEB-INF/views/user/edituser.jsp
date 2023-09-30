<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <div class="m-auto mt-5 mb-5 col-sm-6"
                style="border-radius: 20px; padding: 20px; box-shadow: rgba(0, 0, 0, 0.2) 0px 12px 28px 0px, rgba(0, 0, 0, 0.1) 0px 2px 4px 0px, rgba(255, 255, 255, 0.05) 0px 0px 0px 1px inset;">
                <form:form action="/saveuser?id=${sessionScope.userss.id}" modelAttribute="user">
                    <h3 style="font-weight: bold;">ĐĂNG KÍ</h3>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="mb-3 ">
                                <label style="font-weight: 600;" class="form-label">Họ và tên</label>
                                <form:input path="name"  value="${sessionScope.userss.name}"
                                    style="border-radius: 0; border: 2px solid rgb(205, 192, 50);" type="text"
                                    class="form-control"/>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="mb-3 ">
                                <label style="font-weight: 600;" class="form-label">Địa chỉ</label>
                                <form:input path="address"  value="${sessionScope.userss.address}"
                                    style="border-radius: 0; border: 2px solid rgb(205, 192, 50);" type="text"
                                    class="form-control"/>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="mb-3 ">
                                <label style="font-weight: 600;" class="form-label">Email</label>
                                <form:input path="email"  value="${sessionScope.userss.email}"
                                    style="border-radius: 0; border: 2px solid rgb(205, 192, 50);" type="text"
                                    class="form-control"/>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="mb-3 ">
                                <label style="font-weight: 600;" class="form-label">Số điện thoại</label>
                                <form:input path="phone"  value="${sessionScope.userss.phone}"
                                    style="border-radius: 0; border: 2px solid rgb(205, 192, 50);" type="text"
                                    class="form-control"/>
                            </div>
                        </div>

                    </div>
                    <button style="border-radius: 0; font-weight: 600; background-color: rgb(205, 192, 50);"
                        type="submit" class="btn">Submit</button>
                </form:form>
                <h6 class="mt-3"></h6>
            </div>