<%@ page pageEncoding="utf-8"%>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0/dist/chartjs-plugin-datalabels.min.js"></script>

 <div class="col-sm-10 m-auto mt-5 row" style="border: 1px solid red;">
        <div class="col-sm-5 p-5">
            <h4 style="text-align: center;">THỐNG KÊ ĐƠN HÀNG </h4>
            <canvas class="m-auto" id="myChartUser" style="width: 300px;"></canvas>
        </div>
        <div class="col-sm-7 p-5">
            <h4 style="text-align: center;">THỐNG KÊ DOANH THU</h4>
            <canvas id="myChart"></canvas>
        </div>
        <!-- <div class="m-auto col-sm-4">
            <canvas class="m-auto" id="myChartUser" style="width: 500px;"></canvas>
        </div> -->
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

				alert('Trang web đã được tải!');

				data.forEach(function(item) {
					xValues1.push(item.status);
					yValues1.push(item.count);
					console.log("data", xValues1);
					console.log("data", yValues1);
				});

				createChart();

			},
			error : function() {
				console.log('Lỗi'); // Xử lý lỗi khi gọi API hoặc servlet
			}
		});
	});

	function createChart() {

		const dataUser = {
			labels : xValues1,
			datasets : [ {
				label : 'Số lượng',
				data : yValues1,
				backgroundColor : [ 
				'rgb(219, 32, 91)',
				'rgb(51, 160, 255)',
				'rgb(15, 209, 134)'

				],
				hoverOffset : 4
			} ]
		};

		// config 
		const config = {
			type : 'pie',
			data : dataUser,
			options : {

			},
			plugins : [ ChartDataLabels ]
		};

		// render init block
		const myChartUser = new Chart(document.getElementById('myChartUser'),
				config);
	}
	// Instantly assign Chart.js version
	// const chartVersion = document.getElementById('chartVersion');
	// chartVersion.innerText = Chart.version;
</script>