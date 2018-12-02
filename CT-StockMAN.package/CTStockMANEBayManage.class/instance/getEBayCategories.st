getdata
getEBayCategories

	"gets top level category data only"
	| response writer |

	writer := XMLWriter new.
	writer enablePrettyPrinting.
	writer xml encoding: 'UTF-8'.
	writer comment: 'ebay - get ebay categories - top level only'.
	writer tag name: 'GetCategoriesRequest'; xmlns: 'urn:ebay:apis:eBLBaseComponents'; 
		with: [  
			writer 
				tag: 'RequesterCredentials' with: [  
					writer tag: 'eBayAuthToken' with: self myEbay token. 
				].
			writer 
				tag: 'CategorySiteID' with: '3'.
			writer 
				tag: 'DetailLevel' with: 'ReturnAll'.
			writer 	
				tag: 'LevelLimit' with: '1'.
		]. 

	"set standard headers - credentials etc."
	self myEbay setHeaders.

	"ebay function ..."
	self myEbay znClient headerAt: 'X-EBAY-API-CALL-NAME' add: 'GetCategories'.

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