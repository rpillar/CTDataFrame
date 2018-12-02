accessing
credentialsActive
	^ ( ( shopCredentials active ) = 'Y' ) ifTrue: [ credentialsActive := true ] ifFalse: [ credentialsActive := false ]