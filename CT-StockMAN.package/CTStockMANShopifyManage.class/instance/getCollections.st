as yet unclassified
getCollections

	| response |
	response := znClient
		url: 'https://', myShop appUrl, 'custom_collections.json';
  		get;
   		response.
			
	^ response.