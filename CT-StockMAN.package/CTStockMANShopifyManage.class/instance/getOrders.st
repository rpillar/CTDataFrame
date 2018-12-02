as yet unclassified
getOrders

	| myDate response |
	myDate := ( ( Date today yyyymmdd ) asDateAndTime ) asUTC.
	
	response := znClient
		url: 'https://', myShop appUrl, 'orders.json?financial_status=paid,processed_at_min=', myDate asString;
  		get;
   		response.
			
	^ response.