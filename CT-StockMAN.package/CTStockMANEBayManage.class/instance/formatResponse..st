response transforming
formatResponse: aResponse

	| channelResponse |
	"no response - 500"
	channelResponse := CTStockMANResponse new.
	( aResponse isNil )
		ifTrue: [  
			channelResponse code: 500.
			channelResponse content: 'There has been a problem. Please check the format of your request and the system logs for details.'.
			^ channelResponse.
	].

	"formatted response as this is the response string - we also need to check the Ack - as we can get a <200> but an Ack of <Failure>."	
	( aResponse statusLine code = 200 ) 
		ifTrue: [  
			channelResponse code: aResponse statusLine code asString.
			channelResponse content: aResponse entity string.
		]
		ifFalse: [  
			channelResponse code: 500.
			channelResponse content: 'There has been a problem. Please check the format of your request and the system logs for details.'.
		].
	^ channelResponse.