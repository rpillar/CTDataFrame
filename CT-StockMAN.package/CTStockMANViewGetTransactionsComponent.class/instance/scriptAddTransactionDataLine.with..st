accessing
scriptAddTransactionDataLine: script with: response

	"prepend transaction retrieval details to the start of the table - remove last row if required. "
	( response at: #message ) = 'Success'
		ifTrue: [  
			script << ( ( script jQuery id: 'transaction-management-table-body' ) prepend: [ :r | self renderTransactionDataLineOn: r with: ( response at: #dataCount ) ] ).	
			( ( self tableRowCounter asInteger ) < 5 )
				ifTrue: [
					"set counter both on the DOM element (the table) and for this object."
					script << ( JSStream on: 'var rowCount = $(''#transaction-management-table >tbody >tr'').length; $(''#transaction-management-table-body'').data( "rowCounter", rowCount );' ). 
					self tableRowCounter: ( self tableRowCounter asInteger ) + 1.
				]
				ifFalse: [  
					script << ( JSStream on: '$(''#transaction-management-table-body >tr:last'').remove()' ).
				].
			script << ( ( script jQuery id: 'transaction-management-no-data' ) hide ).
			script << ( ( script jQuery id: 'transaction-management-table' ) show ).
		].