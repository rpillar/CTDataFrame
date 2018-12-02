as yet unclassified
getProducts

	| response |
	response := znClient
		url: 'https://', myShop appUrl, 'products.json?fields=id,title,';
  		get;
   		response.
			
	^ response.