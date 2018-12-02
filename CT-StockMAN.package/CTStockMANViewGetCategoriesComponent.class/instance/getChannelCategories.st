accessing
getChannelCategories

	| channelAPI data dict doc message myData response result status |
	
	( self channel = 'EBay' ) ifTrue: [ 
		channelAPI := CTStockMANEBayManage new. 
		channelAPI myEbay credentials: self shopCredentials.
		response := channelAPI getEBayCategories.

		"check the response code"
		( ( response code ) = '200' )
			ifTrue: [  
				doc := XMLDOMParser parse: response content.	
				"check the response status"
				result := doc nodes elementAt: 'GetCategoriesResponse'.
				status := ( result nodes elementAt: 'Ack' ) contentString.
			]
			ifFalse: [  
				status := 'Failure'.
				message := response content.
			].

		( status = 'Success' ) 
			ifTrue: [
				"parse the getCategories response - XML."
				data := self parseGetEBayCategoriesResponse: result.		
				"remove existing categories for this channel"
				self session dbResource query: 'delete from channel_categories where channel = ? ' with: (Array with: self channel).
				message := 'The category data for channel - ', self channel, ' - has been retrieved and updated.'.
			]
			ifFalse: [ 
				data := Array new. 
				message := 'A problem has occured. Please check the system logs / retry later.'
			].
	].
	
	"insert category data into the database."
	data do: [ :e |
		myData := Array new: 3.
		myData at: 1 put: self channel.
		myData at: 2 put: ( e at: #CategoryName ).	
		myData at: 3 put: ( e at: #CategoryId ).	
		self session dbResource insert: 'channel_categories' fields: #(channel categoryName categoryKey ) with: myData. 
	].

	"return the <success> status / category / count / message."
	dict := Dictionary new.
	dict at: #status put: status.
	dict at: #size put: ( data size ).
	dict at: #message put: message.
	^ dict.
