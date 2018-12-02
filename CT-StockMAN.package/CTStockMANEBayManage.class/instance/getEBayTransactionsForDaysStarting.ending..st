getdata
getEBayTransactionsForDaysStarting: startDay ending: endDay

	| response writer |

	writer := XMLWriter new.
	writer enablePrettyPrinting.
	writer xml encoding: 'UTF-8'.
	writer comment: 'ebay - get transactions for this time period'.
	writer tag name: 'GetSellerTransactionsRequest'; xmlns: 'urn:ebay:apis:eBLBaseComponents'; 
		with: [  
			writer 
				tag: 'ModTimeFrom' with: startDay.
			writer 
				tag: 'ModTimeTo' with: endDay.
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
	
	response := self myEbay znClient 
		url: self myEbay url; 
		entity: (
			ZnEntity
				with: writer asString asUTF8Bytes
				type: ZnMimeType applicationXml
		);
		post;
		response.

	^ self formatResponse: response.