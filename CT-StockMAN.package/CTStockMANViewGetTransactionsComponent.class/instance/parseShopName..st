as yet unclassified
parseShopName: aShopName

	| channelSuffix |
	( self channelNames ) do: [ :ch |
		channelSuffix := '(', ch, ')'.
		( aShopName includesSubstring: channelSuffix )
			ifTrue: [
		 		^ aShopName withoutSuffix: ' (', ch, ')'
			].
	].