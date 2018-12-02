rendering
renderShopHeaderOn: html

	html div 
		class: 'collapsible-header';
		script: (
  			( html jQuery this )
      			on: 'click'
      			do: ( (
					html jQuery ajax
						script: [ :s | self scriptShopHeader: s ]		
   				) asFunction: #(event) )
  		);
		with: [ 
			html div 
				with: [ 
					html italic 
						class: 'large material-icons';
						with: 'info_outline'. 
					].
					html div 
						class: 'col s1';
						style: 'display:inline;font-weight:500;margin-left:30px;';
						with: 'Channel : '.
					html div 
						class: 'col s1 left-align';
						style: 'display:inline;margin-left:10px;';
						with: ( self shop at: 'channel' asSymbol ).
					html div 
						class: 'col s1';
						style: 'display:inline;margin-left:30px;font-weight:500;';
						with: 'Name : '.
					html div 
						id: 'header-shopname', ( self shop at: 'shopId' asSymbol ) asString;
						class: 'col s2 left-align';
						style: 'display:inline;margin-left:10px;';
						with: ( self shop at: 'shopName' asSymbol ).	
					html div 
						class: 'col s1';
						style: 'display:inline;margin-left:30px;font-weight:500;';
						with: 'Status : '.
					html div 
						id: 'header-shopstatus', ( self shop at: 'shopId' asSymbol ) asString;
						class: 'col s2 left-align';
						style: 'display:inline;margin-left:10px;';
						with: ( self shop at: 'status' asSymbol ).									
		].	