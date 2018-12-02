accessing
validateSetTransactionSchedule

	| credentialsStatus shopActiveStatus |

	"check that the shop is ACTIVE."
	shopActiveStatus := ( self checkShopActiveStatus: self shopName ).
	( shopActiveStatus ~= '' )
		ifTrue: [ ^ shopActiveStatus ].
		
	"check that time are populated."
	( self startTime = '' )
		ifTrue: [ ^ 'A valid Start Date needs to be entered.' ].
			
	"check that credentials are set"
	credentialsStatus := ( self checkShopCredentials: self shopName ).
				
	^ credentialsStatus.