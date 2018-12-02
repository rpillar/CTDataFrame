rendering
renderAddCategoryChannelSelectOn: html

	| customCategory initialCategories |
	initialCategories := self channelCategoryNames: ( self channelNames at: 1 ).
	
	html div 
		class: 'row';
		with: [ 
			html div
				class: 'input-field col s5';
				style: 'margin-left:45px;';
				with: [
					html select
						id: 'channel-category';
						style: 'margin-left:20px;';
						size: 4;	
						list: initialCategories;
						selected: ( initialCategories at: 1);
						callback: [ :value | self channelCategory: value asString ];
						script: ( html jQuery this
							on: 'change'
							do: ( (
								html jQuery ajax
									serialize: (html jQuery expression: (JSStream on:'event.target'));
									script: [ :s | customCategory := self getCustomCategory.
										s << ( ( s jQuery class: 'category-name' ) addClass: 'active' ).
										s << ( ( s jQuery class: 'category-name' ) value: customCategory ). 
									]
							) asFunction: #(event) )
						).		
					html label 
						attributeAt: 'for' put: 'channelCatgeory';
						with: 'Channel Category'.			
				].	
				
				html div 
					class: 'input-field col s5';
					style: 'margin-left:20px;';
					with: [
					html textInput 
						class: 'category-name';
						attributeAt: 'autocomplete' put: 'off';
						attributeAt: 'length' put: 65;
						attributeAt: 'placeholder' put: 'Category Name';
						on: #categoryName of: self.				
					html label 
						class: 'active';
						attributeAt: 'for' put: 'icon-prefix';
						with: 'Category Name'.	
				].	
		].