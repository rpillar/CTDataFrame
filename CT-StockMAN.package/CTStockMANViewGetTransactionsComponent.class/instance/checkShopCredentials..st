rendering
checkShopCredentials: aShopName

	| myCredentials |

	myCredentials := self getShopCredentials: ( self parseShopName: aShopName ).
	self shopCredentials: ( STON reader on: ( myCredentials at: 1 ) credentials readStream ) next.
		
	( ( ( myCredentials at: 1 ) active ) = 'N' ) ifTrue: [ ^ 'ERROR : the shops credentials are not active - please update before retrieving channel categories.' ].
	( ( ( myCredentials at: 1 ) credentials ) = '' ) ifTrue: [ ^ 'ERROR : no credentials have been defined for this shop. They are required for this process to work.' ].
	
	"set channel - this will be used later when parsing / processing the transactions."
	self channel: ( myCredentials at: 1 ) channel.
					
	^ ''.