accessing
addCredentials: aShop

	| myCredentials myData mySTONDict mySTONString |

	mySTONDict := Dictionary new.
	( aShop channel = 'EBay' ) 
		ifTrue: [  
			( self credentialFieldsEbay ) do: [ :each | mySTONDict at: each asSymbol put: '' ].
			mySTONString := STON toString: mySTONDict.
		].

	"add a skeleton set of credentials for the 'inserted' shop"
	myData := Array new: 5.
	myData at: 1 put: self channel.
	myData at: 2 put: aShop shopId.	
	myData at: 3 put: aShop shopName.	
	myData at: 4 put: mySTONString.
	myData at: 5 put: 'N'.	
	myData := self session dbResource insert: 'credentials' fields: #(channel shopId shopName credentials active ) with: myData.	

	"return a credentials model"
	myCredentials := CTStockMANModelCredentials new.
	myCredentials channel: self channel.
	myCredentials shopId: aShop shopId.
	myCredentials shopName: aShop shopName.
		
	^ myCredentials.
	
