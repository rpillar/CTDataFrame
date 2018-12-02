rendering
renderContentOn: html

	html div 
		class: 'page-side-nav';
		style: 'z-index:10;';
		with: self menuComponent.	
		
	"home - initial dashboard page"	
	html div 
		id: 'main';
		style: 'width:80%;margin:0 auto;z-index: -2;';
		with: [ 			
			html div 
				class: 'row';
				with: [ 
					html render: self bodyComponent.  
				].
		].

	html document addLoadScript: (html jQuery document onAjaxError: (self ajaxErrorHandler asFunction: #('event' 'jqxhr' 'settings' 'exception')))	