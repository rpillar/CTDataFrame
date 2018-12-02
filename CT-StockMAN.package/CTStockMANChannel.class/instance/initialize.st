initialization
initialize
	super initialize.
	
	self znClient: ZnClient new beOneShot.
	self znClient timeout: 5.
	self znClient enforceHttpSuccess: true;
  		ifFail: [ :exception | Transcript show: exception printString. ].