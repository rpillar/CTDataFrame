getdata
getEBayTransactionsAll

	| response writer |

	writer := XMLWriter new.
	writer enablePrettyPrinting.
	writer xml encoding: 'UTF-8'.
	writer xml comment: 'ebay - get all ebay transactions'.
	writer tag name: 'GetSellerTransactionsRequest'; xmlns: 'urn:ebay:apis:eBLBaseComponents'; 
		with: [  
			writer 
				tag: 'DetailLevel' with: 'ItemReturnDescription'.	
			writer 
				tag: 'RequesterCredentials' with: [  
					writer tag: 'eBayAuthToken' with: self myEbay token. 
				].
		]. 

	"set standard headers - credentials etc."
	self myEbay setHeaders.

	"ebay function ..."
	self myEbay znClient headerAt: 'X-EBAY-API-CALL-NAME' add: 'GetSellerTransactions'.	
		
	response := self request
		url: self myEbay url; 
		entity: (
			ZnEntity 
				with: writer asString
				type: ZnMimeType applicationXml
		);
		post;
		response.
		
	^ self formatResponse: response.