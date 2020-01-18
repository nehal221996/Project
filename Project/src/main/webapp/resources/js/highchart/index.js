$.ajax({

	url: "linechartdata",
	
	success: function(result){
		
		var category = JSON.parse(result).categories;
		var series = JSON.parse(result).series;
		drawLineChart(category, series);
	}
});	
	
function drawLineChart(category, series){
	Highcharts.chart('container', {
	    chart: {
	        type: 'line',
	       
	        height:'495'
	    },
	    credits: {
	        enabled: false
	      },
	   title: {
		   
	        text: 'Student joining the School'
	    },
	    xAxis: {
	    	name:'Date of Joining',
	        categories: category,
	        title: {
                text: 'Date of Joining'
            },
	        
	    },
	    yAxis: {
            title: {
                text: 'No. of Student '
            },
	    },
	    tooltip: {
	        formatter: function() {
	          return '<strong>' +this.x +': </strong>' + this.y;
	         /* return 'We have ' + this.y + ' ' + this.point.options.category + 's'*/
	        }
	    },
	
	    series: [{
	    	name: 'No. of Student',
	        data: series
	    }]
	});
}
	
