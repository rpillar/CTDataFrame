getdata
getEBayTrafficDataFrom: fromDate to: toDate

	| response |
	
	response := znClient
		url: 'https://', self myEbay url, '/sell/analytics/v1/traffic_report', '?';
  		get;
   		response.
	
	^ self formatResponse: response.