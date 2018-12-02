validation
validateCategory
	
	( self categoryName = '' ) ifTrue: [ ^ 'A custom category name needs to be entered.' ].
		
	^ ''.