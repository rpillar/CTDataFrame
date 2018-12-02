rendering
renderSampleDashboardSalesChartOn: html

	| allSeries chart myData1 myData2 |

	myData1 := HighchartsSeriesLine new 
		data: #(8722 10013 11211 5231 8723 5456 8701 10692 10993 8022 6998 7691); name: 'EBay Sales'.			
	myData2 := HighchartsSeriesLine new
		data: #(5411 7175 9790 7531 4399 3546 4064 8519 8005 8850 8000 7409); name: 'Shopify'.		
	allSeries := OrderedCollection new add: myData1; add: myData2; yourself.			
	
	chart := html highcharts newChart.
	chart lang thousandsSep: ','.
	chart chart type: 'area'.
	chart title text: ''.
	chart yAxis max: 22000.
	chart xAxis categories: #('Jan' 'Feb' 'Mar' 'Apr' 'May' 'Jun' 'July' 'Aug' 'Sept' 'Oct' 'Nov' 'Dec').
	chart tooltip split: true.
	chart credits enabled: false.
	
	chart plotOptions area stacking: 'normal'; lineColor: '#666666'; lineWidth: 1.
	chart plotOptions area marker lineColor: '#666666'; lineWidth: 1.
	
	allSeries doWithIndex: [ :series :i | ( chart series ) add: series ].
			
	html div
		style: 'height:370px;';
	 	script: chart.