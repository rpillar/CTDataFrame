rendering
validateGetTransactions

	| credentialsStatus shopActiveStatus transactionData |

	"check that the shop is ACTIVE."
	shopActiveStatus := ( self checkShopActiveStatus: self shopName ).
	( shopActiveStatus ~= '' )
		ifTrue: [ ^ shopActiveStatus ].
		
	"check that dates are populated."
	( self startDate = '' )
		ifTrue: [ ^ 'A valid Start Date needs to be entered.' ].
	( self endDate = '' )
		ifTrue: [ ^ 'A valid End Date needs to be entered.' ].
		
	"check that dates are valid - not today or after - only for scheduled 'gets'."
	( self startDate >= ( Date today yyyymmdd ) )
		ifTrue: [ ^ 'Start Date must be in the past.' ].
	( self endDate >= ( Date today yyyymmdd ) )
		ifTrue: [ ^ 'End Date must be in the past.' ].
		
	"check that an existing request for these date has not already been made for these dates"
	transactionData := self getTransactionDataFor: self shopName.
	( transactionData isNotEmpty )
		ifTrue: [  
			^ 'Transaction data for this period (or part of it) has already been retrieved. Check the transaction data logs.'
		].
			
	"check that credentials are set"
	credentialsStatus := ( self checkShopCredentials: self shopName ).
				
	^ credentialsStatus.