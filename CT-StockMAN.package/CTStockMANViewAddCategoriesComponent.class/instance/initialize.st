initialization
initialize
	
	super initialize.
	self channel: ( self channelNames at: 1 ).
	self messageComponent:  CTStockMANViewMessageComponent new.