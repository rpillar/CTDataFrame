rendering
renderGetTransactionsDataTableOn: html

	html table 					
		id: 'transaction-management-table';
		class: 'bordered';
		with: [ 
			html tableHead 
				with: [
					html tableRow 
						with: [ 
							html tableHeading 
								with: 'Channel'.
							html tableHeading 
								with: 'Shop'.
							html tableHeading 
								with: 'Start Date'.
							html tableHeading 
								with: 'End Date'.	
							html tableHeading 
								with: '#Data Records'.
						].
				].
			html tableBody 
				id: 'transaction-management-table-body'
		].