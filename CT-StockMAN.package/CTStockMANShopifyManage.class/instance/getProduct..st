as yet unclassified
getProduct: aProductId

	| response |
	response := znClient
		url: 'https://', myShop appUrl, 'products/', aProductId, '.json?fields=id,title,';
  		get;
   		response.
			
	^ response.