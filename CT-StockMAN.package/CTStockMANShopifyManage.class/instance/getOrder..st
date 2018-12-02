as yet unclassified
getOrder: orderId

	| response |
	
	response := znClient
		url: 'https://', myShop appUrl, orderId,'.json';
  		get;
   		response.
			
	^ response.