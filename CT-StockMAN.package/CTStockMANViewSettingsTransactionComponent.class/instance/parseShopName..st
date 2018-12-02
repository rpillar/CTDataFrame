accessing
parseShopName: aShopName

	| channelSuffix  myChannels myChannelNames |	
	myChannelNames := OrderedCollection new.
	
	myChannels := self session user channels.
	myChannels do: [ :ch | 
			myChannelNames add: ch channelName.
	].

	myChannelNames do: [ :ch |
		channelSuffix := '(', ch, ')'.
		( aShopName includesSubstring: channelSuffix )
			ifTrue: [
		 		^ aShopName withoutSuffix: ' (', ch, ')'
			].
	].