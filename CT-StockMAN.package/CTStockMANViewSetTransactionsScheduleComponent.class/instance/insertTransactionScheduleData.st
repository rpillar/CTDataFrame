inserting
insertTransactionScheduleData

	| myData |
	
	myData := Array new: 3.
	myData at: 1 put: self channel.
	myData at: 2 put: self shopName.
	myData at: 3 put: self startTime.	
	self session dbResource insert: 'transaction_schedule_data' fields: #(channel shopName schedule_time ) with: myData. 
