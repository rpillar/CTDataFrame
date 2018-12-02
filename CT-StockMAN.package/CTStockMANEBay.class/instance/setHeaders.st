accessing
setHeaders

	self znClient headerAt: 'X-EBAY-API-COMPATIBILITY-LEVEL' add: '889';
		headerAt: 'X-EBAY-API-DEV-NAME' add: ( self credentials at: #devId );
		headerAt: 'X-EBAY-API-APP-NAME' add: ( self credentials at: #appId );
		headerAt: 'X-EBAY-API-CERT-NAME' add: ( self credentials at: #certId );
		headerAt: 'X-EBAY-API-SITEID' add: '3';
		headerAt: 'X-EBAY-API-DETAIL-LEVEL' add: '0';
		headerAt: 'Content-Type' add: 'text/xml'.