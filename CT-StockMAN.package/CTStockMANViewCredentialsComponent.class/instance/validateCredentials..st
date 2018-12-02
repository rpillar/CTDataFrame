validation
validateCredentials: myCredentials

	"check that each field is populated - nothing more (in other words check that each dictionary value does contain something).
	Because we cannot rely on the order of a dictionary we have to use the 'formCredentialsList' (an Array) to help us. "
	
	self formCredentialsList do: [ :each |
		( myCredentials at: each asSymbol ) = '' ifTrue: [ ^ 'The field ' , each asUppercase , ' has been left blank - please enter.' ]
	].

	^ ''.