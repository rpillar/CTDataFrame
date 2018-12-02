accessing
getShopNames

	| myChannelNames myChannels myShops  |
	myChannelNames := OrderedCollection new.
	myShops := OrderedCollection new.
	
	myChannels := self session user channels.
	myChannels do: [ :ch | 
			myChannelNames add: ch channelName.
			ch shops do: [ :shop |
				myShops add: ( shop shopName, ' (', ch channelName, ')' ) asString.
			]
		].
	
	"save channel names - used in parse method ..."
	self channelNames: myChannelNames.

	^ myShops asArray.