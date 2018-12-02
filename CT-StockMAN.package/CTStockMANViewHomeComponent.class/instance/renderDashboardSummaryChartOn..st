rendering
renderDashboardSummaryChartOn: html

	| chart myData1 myData2 stream yAxisArray yAxisLeft yAxisRight |

	myData1 := HighchartsSeriesLine new 
		data: #(8722 10013 11211 5231 8723 5456 8701 10692 10993 8022 6998 7691); name: 'Sales'; type: 'line'; color: 'black'; index: 2.
	myData1 marker lineWidth: 2; lineColor: 'Highcharts.getOptions().colors[0]'; radius: 5. 
	myData2 := HighchartsSeriesColumn new
		data: #(75 102 98 100 56 90 99 107 123 151 132 176); name: 'Volume'; type: 'column'; color: '#7cb5ec'; yAxis: 1; index: 1.				

	"set up yAxis - left / right."
	yAxisLeft  := HighchartsYAxis new.
	yAxisRight := HighchartsYAxis new.
	yAxisLeft title text: 'Sales'.
	yAxisRight title text: 'Volume'.
	yAxisRight opposite: 'true'.
	yAxisArray := Array new: 2.
	yAxisArray at: 1 put: yAxisLeft.
	yAxisArray at: 2 put: yAxisRight.
	
	chart := Highchart new.
	chart lang thousandsSep: ','.
	chart title text: 'Sales / Unit Volumes (by Month)'.
	chart yAxis: yAxisArray.
	chart xAxis categories: #('Jan' 'Feb' 'Mar' 'Apr' 'May' 'Jun' 'July' 'Aug' 'Sept' 'Oct' 'Nov' 'Dec').
	chart xAxis crosshair: 'true'.
	chart tooltip split: true.
	chart credits enabled: false.
	
	chart plotOptions line marker lineColor: '#666666'; lineWidth: 1.
	
	chart series add: myData1; add: myData2.
	stream := WriteStream on: String new.
	chart javascriptContentOn: stream.
		
	html div
		style: 'height:320px;';
	 	script: chart.