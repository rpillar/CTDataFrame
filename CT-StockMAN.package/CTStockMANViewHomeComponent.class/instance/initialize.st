initialization
initialize
	
	super initialize.
	self shops: ( self session user rShops ).
	
	"are any of my shops 'active' - if not set summaryData to the 'sample' data structure."
	self shopsActive: false.
	self shops dbResultset do: [ :shop | 
			( ( shop at: #status ) = 'Active' )
				ifTrue: [ self shopsActive: true ]
		].
	
	"get sales / customer / category data"
	( self shopsActive )
		ifTrue: [  ]
		ifFalse: [  ].