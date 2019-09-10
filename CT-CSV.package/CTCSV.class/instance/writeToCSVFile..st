loading
writeToCSVFile: filePath

	| fileContents |

	( filePath asFileReference exists ) ifTrue: [ self success: false. ^ '' ].
	
	"collect keys / values as a set of collection objects."
	fileContents := OrderedCollection new.
	fileContents add: ( self data first collectKeysAsStrings: [ :k | k ] ).
	fileContents add: ( self data first keys ).
	self data do: [ :line |
		fileContents add: line values.
	].	

	"write the file ..."
	FileStream
		forceNewFileNamed: filePath
		do: [ :stream |
			(NeoCSVWriter on: stream)
				nextPutAll: fileContents ].	
	
	self success: true.