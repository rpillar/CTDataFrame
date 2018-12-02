getdata
getEBayOfficialTime

	| response writer |

	"note that - encoding set by default to <UTF-8> as required by Ebay. Set explicitly in the <encoding> method - XMLXMLDeclarationWriter class"
	writer := XMLWriter new.
	writer enablePrettyPrinting.
	writer xml encoding: 'UTF-8'.
	writer comment: 'ebay - get official ebay time'.
	writer tag name: 'GeteBayOfficialTimeRequest'; xmlns: 'urn:ebay:apis:eBLBaseComponents'; 
		with: [  
			writer 
				tag: 'RequesterCredentials' with: [  
					writer tag: 'eBayAuthToken' with: self myEbay token. 
				]
		]. 
		
	"set standard headers - credentials etc."
	self myEbay setHeaders.
		
	"ebay function ..."
	self myEbay znClient headerAt: 'X-EBAY-API-CALL-NAME' add: 'GeteBayOfficialTime'.

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