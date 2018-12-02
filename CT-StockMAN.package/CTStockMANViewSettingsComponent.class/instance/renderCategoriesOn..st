rendering
renderCategoriesOn: html

	| myAddCategoryComponent myGetCategoriesComponent |
	
	myAddCategoryComponent := CTStockMANViewAddCategoriesComponent new.
	myGetCategoriesComponent := CTStockMANViewGetCategoriesComponent new.
		
	html div 
		class: 'row';
		with: [  
			html heading level: 2; 
			class: 'heading-main';	 
			style: 'font-weight:300;font-size:3rem';
			with: [ 
				html span 
				style: 'border-bottom: 3px solid lightblue;'; 
				with: 'Product Categories'.
			]
		].
	
	html div 
		class: 'row';
		with: [ 
			html paragraph 
				style: 'font-size: 18px;font-weight:300;';
				with: 'Retrieve product categories for the selected channel (Shop - they hold the credentials) and if appropriate create a custom StockMAN category for cases where the category names do not match across the different channels.' 
		].
	
	html div 
		class: 'row add-category';
		style: 'margin-top:25px;';
		with: [ 
			html div
				class: 'col s3';
				style: 'width:240px;';
				with: [ 
					html anchor 
						class: 'btn-large waves-effect waves-light hoverable modal-trigger'; 
						url: '#get-categories-modal';	
						script: (
    						( html jQuery this )
    							on: 'click'
      							do: ( (
									( ( html jQuery class: 'collapsible-header' ) removeClass: 'active' ),		
									( ( html jQuery class: 'collapsible-body' ) cssAt: 'display' put: 'none' ),
        							( ( html jQuery id: 'get-categories-modal' ) load html: [ :r | r render: myGetCategoriesComponent ] )			
      							) asFunction: #(event) )
  						);			
						with: 'Get Categories'.			
				].
			html div
				class: 'col s3';
				with: [ 
					html anchor 
						class: 'btn-large waves-effect waves-light hoverable modal-trigger'; 
						url: '#add-category-modal';	
						script: (
    						( html jQuery this )
      						on: 'click'
      						do: ( (
        						( ( html jQuery class: 'collapsible-header' ) removeClass: 'active' ),		
								( ( html jQuery class: 'collapsible-body' ) cssAt: 'display' put: 'none' ),
								( ( html jQuery id: 'add-category-modal' ) load html: [ :r | r render: myAddCategoryComponent ] )			
      						) asFunction: #(event) )
  						);					
						with: 'Add New Category'.			
				]
		].	

	html div 
		class: 'row';
		with: [ 
			html div 
			style: 'width:30%;margin:0 auto;'; 
			with: [
				html horizontalRule  
			]. 
		].	