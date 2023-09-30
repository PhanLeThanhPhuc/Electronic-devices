<%@ page pageEncoding="utf-8"%>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0/dist/chartjs-plugin-datalabels.min.js"></script>
<div class="col-sm-12 m-auto mt-5 row" style="border: 1px solid red;">
	<div class="col-sm-6"><canvas id="myChart" style="width: 100%; max-width: 1000px"></canvas></div>
</div>


<script>
var xValues = [];
var yValues = [];
	$(document).ready(function() {
		$.ajax({
			url : '/total-year', 
			type : 'GET', 
			dataType : 'json', 
			success : function(data) {
				
				alert('Trang web đã được tải!');

				data.forEach(function(item) {
					
					xValues.push(item.year);
					yValues.push(item.total);
					console.log(xValues);
					console.log(yValues);
				});
	
				
			},
			error : function() {
				console.log('Lỗi'); 
			}
		});
	});

	const data = {
		      labels:xValues,
		      datasets: [{
		        label: 'Doanh thu theo năm', 
		        data:yValues,
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
		    const config = {
		      type: 'bar',
		      data,
		      options: {
		        scales: {
		          y: {
		            beginAtZero: true
		          }
		        }
		      },
		      plugins : [ ChartDataLabels ]
		    };

		    // render init block
		    const myChart = new Chart(
		      document.getElementById('myChart'),
		      config
		    );
    </script>
    
     
    