<%@ page pageEncoding="utf-8" %>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"></script>
    <script
	src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0/dist/chartjs-plugin-datalabels.min.js"></script>
    <div class="col-sm-12 m-auto  row" style=" background-color: #fff;">
        <div class="col-sm-5 p-5">
            <h4  style="text-align: center;">THỐNG KÊ ĐƠN HÀNG </h4>
            <canvas class="m-auto" id="myChartUser" style="width: 300px;"></canvas>
        </div>
        <div class="col-sm-7 p-5">
            <h4 style="text-align: center;">THỐNG KÊ DOANH THU THEO NĂM</h4>
            <canvas  id="myChart" ></canvas>
        </div>
        <!-- <div class="m-auto col-sm-4">
            <canvas class="m-auto" id="myChartUser" style="width: 500px;"></canvas>
        </div> -->
    </div>
	
	<div class="col-sm-12 m-auto mt-5 row p-5" style="background-color: #fff;">
	<div class="d-flex">
		<input name="p" type="hidden"> <input name="status"
			value="${status}" type="hidden"> 
			<input style="width: 150px;"
			type="date" value="${date}" class="form-control ml-4" id="date1"
			name="date1"> 
			<input style="width: 150px;" type="date"
			value="${date}" class="form-control ml-2" id="date2" name="date2">
		<button id="fiter" class="btn btn-outline-success ml-3">Lọc</button>
	</div>
	<div class="col-sm-9  m-auto" id="chartContainer">
		 <h4 class="mt-2" style="text-align: center;">THỐNG KÊ DOANH THU THEO NGÀY</h4>
		<canvas id="myChartPriceDate"></canvas>
	</div>
</div>

    <script>
    var xValues1 = [];
	var yValues1 = [];
	$(document).ready(function() {
		$.ajax({
			url : '/dataStatisticaOrder',
			type : 'GET',
			dataType : 'json',
			success : function(data) {


				data.forEach(function(item) {
					xValues1.push(item.status);
					yValues1.push(item.count);
					console.log("data", xValues1);
					console.log("data", yValues1);
				});

				createChart();

			},
			error : function() {
				console.log('Lỗi'); 
			}
		});
	});

	function createChart() {
        // setup 
        const dataUser = {
            labels:xValues1,
            datasets: [{
                label: 'My First Dataset',
                data: yValues1,
                backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
                    'rgb(255, 205, 86)',
                    'rgba(255, 26, 104, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(0, 0, 0, 1)'
                ],
                hoverOffset: 4
            }]
        };

        // config 
        const config = {
            type: 'pie',
            data: dataUser,
            plugins: [ChartDataLabels]
        };

       
        const myChartUser = new Chart(
            document.getElementById('myChartUser'),
            config
        );

 
        
        }
        
        
        var xValues = [];
        var yValues = [];
        	$(document).ready(function() {
        		$.ajax({
        			url : '/total-year', 
        			type : 'GET', 
        			dataType : 'json', 
        			success : function(data) {
        				
        			

        				data.forEach(function(item) {
        					
        					xValues.push(item.year);
        					yValues.push(item.total);
        					console.log(xValues);
        					console.log(yValues);
        				});
        				
        				chartYear();
        				
        			},
        			error : function() {
        				console.log('Lỗi'); 
        			}
        		});
        	});
       function chartYear(){
    const data = {
      labels:xValues,
      datasets: [{
        label: 'Doanh thu theo năm', 
        data: yValues,
        backgroundColor: [
          'rgba(255, 26, 104, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(255, 159, 64, 0.2)',
          'rgba(0, 0, 0, 0.2)'
        ],
        borderColor: [
          'rgba(255, 26, 104, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)',
          'rgba(0, 0, 0, 1)'
        ],
        borderWidth: 1
      }]
    };

    // config 
    const config1 = {
      type: 'bar',
      data,
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      },
      plugins: [ChartDataLabels]
    };

    // render init block
    const myChart = new Chart(
      document.getElementById('myChart'),
      config1
    );
       }
    
    </script>
    
    <script>

  	var date1;
	var date2;
	var date = [];
	var price = [];
	 let myChartTotal = null;
	 
	 $(document).ready(function() {
			$.ajax({
				url : '/viewtotaldate',
				type : 'POST',
				success : function(data) {
					console.log(data);
					data.forEach(function(item) {
						date.push(item.date);
						price.push(item.price);
					});
					ChartTotalDate();

				},
				error : function() {
					console.log('Lỗi'); 
				}
			});
		});
	 
	 
	 
  $('#fiter').click(function() {
		console.log('tesst');
		date1 = $('#date1').val();
		 date2 = $('#date2').val();
		console.log(date1);
		console.log(date2);
		if(myChartTotal !== null){
			date = [];
		price = [];
		myChartTotal.destroy();
		}
		
		$.ajax({
			url: '/viewtotaldate?date1=' + date1 + '&date2=' + date2,
			type : 'POST',
			success : function(data) {
				console.log(data);
				data.forEach(function(item) {
					date.push(item.date);
					price.push(item.price);
				});
				ChartTotalDate();
			},
			error : function() {
				console.log('Lỗi'); 
			}
		});
	});
  
  
  
  
  
  
  
  
  
  
  function ChartTotalDate() {
    const data = {
      labels: date,
      datasets: [{
        label: 'Doanh thu theo ngày',
        data: price,
        backgroundColor: [
          'rgba(255, 26, 104, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(255, 159, 64, 0.2)',
          'rgba(0, 0, 0, 0.2)'
        ],
        borderColor: [
          'rgba(255, 26, 104, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)',
          'rgba(0, 0, 0, 1)'
        ],
        borderWidth: 1
      }]
    };

    const configpricedate = {
      type: 'bar',
      data,
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      },  
      plugins: [ChartDataLabels]
    };

    myChartTotal = new Chart(
      document.getElementById('myChartPriceDate'),
      configpricedate
    );
  }

  </script>