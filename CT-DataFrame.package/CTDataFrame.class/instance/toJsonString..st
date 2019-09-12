accessing
toJsonString: aCollection

	"returns the collection as a JSON string"
	^ NeoJSONWriter toString: aCollection.