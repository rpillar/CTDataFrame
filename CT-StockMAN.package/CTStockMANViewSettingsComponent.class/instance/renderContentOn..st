rendering
renderContentOn: html

	"Admin page ..."	
	html div 
		with: [  
			html div 
				class: 'page-title';
				with: 'Admin'.
		].
			
	"display shop details ..."		
	self renderShopsOn: html.	
	
	"display product categories ..."		
	self renderCategoriesOn: html.	

	"display transaction data details ..."		
	self renderTransactionDataOn: html.	
		
	"display log data details ..."		
	self renderSystemLogDataOn: html.
		
	"add add-shop modal"		
	"html render: self addShopComponent."	
	self renderAddShopModalOn: html.	

	"credentials modal"
	self renderCredentialsModalOn: html.
	
	"get Categories modal"
	self renderGetCategoriesModalOn: html.	
		
	"add add-category modal"		
	self renderAddCategoryModalOn: html.

	"add get-transactions modal"		
	self renderGetTransactionsModalOn: html.
					
	"add get-transactions modal"
	self renderSetTransactionsScheduleModalOn: html.
	
	html document addLoadScript: ( ( JSStream on: '$(''.collapsible'').collapsible()' ) ).	
	html document addLoadScript: ( ( JSStream on: '$(''.tooltipped'').tooltip()' ) ).	
	html document addLoadScript: ( ( JSStream on:	'$(''.modal'').modal({outDuration:300,opacity:.4})' ) ).
	html document addLoadScript: ( ( JSStream on: '$(window).scrollTop(0)' ) ).		
