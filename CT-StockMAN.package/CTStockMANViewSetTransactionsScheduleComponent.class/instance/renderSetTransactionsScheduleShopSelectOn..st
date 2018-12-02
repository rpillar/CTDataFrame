accessing
renderSetTransactionsScheduleShopSelectOn: html

	html div 
		class: 'row';
		with: [ 
			html div
				class: 'input-field col s5';
				style: 'margin-left:45px;';
				with: [
					html select
						id: 'shopname';
						style: 'margin-left:20px;';
						size: 2;	
						list: self getShopNames;
						selected: ( self getShopNames at: 1);
						callback: [ :value | self shopName: value asString ].		
					html label 
						attributeAt: 'for' put: 'shopname';
						with: 'Shop Name'.			
				].	
		].