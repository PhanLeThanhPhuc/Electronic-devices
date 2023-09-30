<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div style="background-color: #f2f3f4;" class="pb-4">
	


	<div
		style="max-width: 1300px; background-color: #fff; border-radius: 10px;"
		class="m-auto pt-3">
		<div class="p-3">
			<div class="col-sm-12 m-auto">
				<div style="max-width: 1300px;" class="m-auto  mb-3 ">
					<span class="text-center"
						style="font-size: 18px; font-weight: bold;">SẢN PHẨM
						<div class=""
							style="width: 192px; height: 2px; background-color: black;"></div>
				</div>

				<div class="row">
					<div class="col-sm-2 ml-2">
						<div class="accordion" id="accordionPanelsStayOpenExample">
							<div class="accordion-item" style="border-radius: 0px;">
								<h2 class="accordion-header" id="panelsStayOpen-headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse"
										data-bs-target="#panelsStayOpen-collapseOne"
										aria-expanded="true"
										aria-controls="panelsStayOpen-collapseOne">LỌC THEO
										HÃNG</button>
								</h2>
								<div id="panelsStayOpen-collapseOne"
									class="accordion-collapse collapse show"
									aria-labelledby="panelsStayOpen-headingOne">
									<div class="accordion-body pt-0 pb-3 pl-5 "></div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse"
										data-bs-target="#panelsStayOpen-collapseTwo"
										aria-expanded="false"
										aria-controls="panelsStayOpen-collapseTwo">Accordion
										Item #2</button>
								</h2>
								<div id="panelsStayOpen-collapseTwo"
									class="accordion-collapse collapse"
									aria-labelledby="panelsStayOpen-headingTwo">
									<div class="accordion-body">div></div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="panelsStayOpen-headingThree">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse"
										data-bs-target="#panelsStayOpen-collapseThree"
										aria-expanded="false"
										aria-controls="panelsStayOpen-collapseThree">
										Accordion Item #3</button>
								</h2>
								<div id="panelsStayOpen-collapseThree"
									class="accordion-collapse collapse"
									aria-labelledby="panelsStayOpen-headingThree">
									<div class="accordion-body">
										<strong>This is the third item's accordion body.</strong> It
										is hidden by default, until the collapse plugin adds the
										appropriate classes that we use to style each element. These
										classes control the overall appearance, as well as the showing
										and hiding via CSS transitions. You can modify any of this
										with custom CSS or overriding our default variables. It's also
										worth noting that just about any HTML can go within the
										<code>.accordion-body</code>
										, though the transition does limit overflow.
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-10">
						<div class="row ">
							<div class="col-sm-9">
								<div class="dropdown">
									<button class="btn btn-secondary dropdown-toggle" type="button"
										id="dropdownMenuButton1" data-bs-toggle="dropdown"
										aria-expanded="false">Giá</button>
									<ul class="dropdown-menu p-0"
										aria-labelledby="dropdownMenuButton1">
										
										<form action="/productbrand" method="post">
										<input name="idBrand" value="${idBrand}" type="hidden"> 
										<input name="idCategory" value="${idCategory}" type="hidden"> 
										<input name="p" type="hidden"> 
										<input type="hidden" value="${s}" name="sort">
											<div class="wrapper">
												<div class="price-input">
													<div class="field">
														<!-- <span>Min</span>
            <input id="min" type="number" class="input-min" value="100"> -->
														<span class="range-left" style=""> <input
															type="tel" class="inputmax" maxlength="8"
															name="price-min" data-minvalue="300000"
															value="${minPriceRange}"> <label
															class="place-holder">.000đ</label>
														</span>
													</div>
													<!-- <div class="separator">-</div> -->
													<div class="field">
														<span class="range-right"> <input class="inputmax"
															type="tel" maxlength="8" name="price-max"
															data-maxvalue="42000000" value="${maxPriceRange}">
															<label class="place-holder">.000đ</label>
														</span>
													</div>
												</div>
												<div class="slider">
													<div class="progress"></div>
												</div>
												<div class="range-input">
													<input type="range" class="range-min"
														min="${minPriceRange}" max="${maxPriceRange}"
														value="${minPriceRange}" step="100"> <input
														type="range" class="range-max" min="0"
														max="${maxPriceRange}" value="${maxPriceRange}" step="100">
												</div>
												<div class="d-flex justify-content-center">
													<button type="submit"
														class="btn btn-primary mt-4 text-center">Lọc</button>
												</div>
											</div>
									</ul>
									</form>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="input-group mb-3">
									<label class="input-group-text" style="border-radius: 0px;"
										for="inputGroupSelect01"><i
										class="fa-solid fa-filter fa-beat"></i></label>
										<form id="myForm" action="/productbrand" method="post">
										<input name="idBrand" value="${idBrand}" type="hidden"> 
										<input name="idCategory" value="${idCategory}" type="hidden"> 
										<input type="hidden" value="${min}" name="price-min">
										<input type="hidden" value="${max}" name="price-max">
										
										<select
										style="border-radius: 0px;" class="form-select"
										id="mySelect" name="sort" onchange="document.getElementById('myForm').submit();" >
										<option  ${s == "asc" ? "selected" : ""} value="asc">Giá thấp đến cao</option>
										<option ${s == "desc" ? "selected" : ""}  value="desc">Giá cao đến thấp</option>
									</select>
									</form>
								</div>
							</div>
						</div>

						<div class="row">
								<c:forEach items="${productByBrand.content}" var="product">
								<div class="col-md-3 col-sm-6 mb-3">
									<div class="product-grid">
										<div class="product-image">
											<a href="#" class="image"> <img class="pic-1 p-4"
												src="/image/${product.img}">
											</a> <span class="product-discount-label">0</span>
											 <ul class="product-links">
                       				  <a class="button-detail" href="/productdetail?productId=${product.id}&categoryId=${product.category.id}" type="button" class="btn btn-outline-success">Chi tiết</a>
                                    </ul>
										</div>
										<div class="product-content">
											<ul class="rating">
												<li class="fas fa-star"></li>
												<li class="fas fa-star"></li>
												<li class="fas fa-star"></li>
												<li class="far fa-star"></li>
												<li class="far fa-star"></li>
											</ul>
											<h3 class="title">
												<a href="#">${product.name}</a>
											</h3>
											<div class="price">
												<span>$90.00 </span><fmt:formatNumber value="${product.price}"
											pattern="###,###,###.##" />
										đ
											</div>
											
											<a id="${product.id}"  class="add-to-cart" >Thêm vào giỏ</a>
										</div>
									</div>
								</div>

							</c:forEach>

						</div>
						<div class="d-flex justify-content-center">
							<nav class="m-auto" aria-label="Page navigation">
								<ul class="pagination" id="pagination"></ul>
							</nav>
						</div>
						<form id="sumitForm" action="/productbrand" method="post">
							<input name="idBrand" value="${idBrand}" type="hidden"> 
							<input name="idCategory" value="${idCategory}" type="hidden"> 
							<input id="page" name="p" type="hidden"> 
							
							<input type="hidden" value="${s}" name="sort">
							<input type="hidden" value="${min}" name="price-min">
							<input type="hidden" value="${max}" name="price-max">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: ${productByBrand.totalPages},
            visiblePages: 5,
            startPage: ${productByBrand.number+1},
            onPageClick: function (event, page) {
                console.info(page)
                
                if(page!=${productByBrand.number+1}){
                	$('#page').val(parseInt(page-1));
                	$('#sumitForm').submit();
                }
            }
        }).on('page', function (event, page) {
            console.info(page + ' (from event listening)');
        });
    });
    
    $('.add-to-cart').click(function() {
		console.log('Hello');
		var id = $(this).attr('id');
		console.log(id);
		
		$.ajax({
			url : '/add/'+id,
			type : 'GET',
			success : function(data) {
				console.log("DỮ LIỆU",data);
				$('#lblCartCount').html('');
				$('#lblCartCount').append(data);
			},
			error : function() {
				console.log('Lỗi'); 
			}
		});
		$.toast({
			text : "Thêm vào giỏ hàng thành công.", // Text that is to be shown in the toast
			heading : 'Thông báo!', // Optional heading to be shown on the toast
			icon : 'success', // Type of toast icon
			showHideTransition : 'fade', // fade, slide or plain
			allowToastClose : true, // Boolean value true or false
			hideAfter : 3000, // false to make it sticky or number representing the miliseconds as time after which toast needs to be hidden
			stack : false, // false if there should be only one toast at a time or a number representing the maximum number of toasts to be shown at a time
			position : 'top-right', // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values
			textAlign : 'left', // Text alignment i.e. left, right or center
			loader : true, // Whether to show loader or not. True by default
			loaderBg : '#9EC600', // Background color of the toast loader
			beforeShow : function() {
			}, // will be triggered before the toast is shown
			afterShown : function() {
			}, // will be triggered after the toat has been shown
			beforeHide : function() {
			}, // will be triggered before the toast gets hidden
			afterHidden : function() {
			} // will be triggered after the toast has been hidden
		});

	});
    
    
    const rangeInput = document.querySelectorAll(".range-input input"),
    priceInput = document.querySelectorAll(".price-input input"),
    range = document.querySelector(".slider .progress");
    let priceGap = 1;

    priceInput.forEach(input =>{
        input.addEventListener("input", e =>{
            let minPrice = parseInt(priceInput[0].value),
            maxPrice = parseInt(priceInput[1].value);
            
            if((maxPrice - minPrice >= priceGap) && maxPrice <= rangeInput[1].max){
                if(e.target.className === "input-min"){
                    rangeInput[0].value = minPrice;
                    range.style.left = ((minPrice / rangeInput[0].max) * 100) + "%";
                }else{
                    rangeInput[1].value = maxPrice;
                    range.style.right = 100 - (maxPrice / rangeInput[1].max) * 100 + "%";
                }
            }
        });
    });

    rangeInput.forEach(input =>{
        input.addEventListener("input", e =>{
            let minVal = parseInt(rangeInput[0].value),
            maxVal = parseInt(rangeInput[1].value);

            if((maxVal - minVal) < priceGap){
                if(e.target.className === "range-min"){
                    rangeInput[0].value = maxVal - priceGap
                }else{
                    rangeInput[1].value = minVal + priceGap;
                }
            }else{
                priceInput[0].value = minVal;
                priceInput[1].value = maxVal;
                range.style.left = ((minVal / rangeInput[0].max) * 100) + "%";
                range.style.right = 100 - (maxVal / rangeInput[1].max) * 100 + "%";
            }
        });
    });
</script>