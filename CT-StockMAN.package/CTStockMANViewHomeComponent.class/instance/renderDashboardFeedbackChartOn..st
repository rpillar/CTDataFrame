rendering
renderDashboardFeedbackChartOn: html

	| chart myData stream |

	myData := HighchartsSeriesColumn new 
		data: #(4.8 5 5 4.9 4.7 5 5 3.5 5 4.9 4.9 5); name: 'Average Feedback Score'.					

	chart := Highchart new.
	chart lang thousandsSep: ','.
	chart chart type: 'column'.
	chart title text: ''.
	chart yAxis max: 5.
	chart xAxis categories: #('Jan' 'Feb' 'Mar' 'Apr' 'May' 'Jun' 'July' 'Aug' 'Sept' 'Oct' 'Nov' 'Dec').
	chart tooltip split: true.
	chart credits enabled: false.
	
	chart plotOptions line marker lineColor: '#666666'; lineWidth: 1.
	
	chart series add: myData.
	stream := WriteStream on: String new.
	chart javascriptContentOn: stream.
		
	html div
		style: 'height:150px;';
	 	script: chart.