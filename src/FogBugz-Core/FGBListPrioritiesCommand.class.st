"
List available priorities.
"
Class {
	#name : #FGBListPrioritiesCommand,
	#superclass : #FGBTokenCommand,
	#category : #'FogBugz-Core-Commands'
}

{ #category : #printing }
FGBListPrioritiesCommand >> printOn: aStream [

	aStream
		nextPutAll:
			('{"cmd": "listPriorities", "token": "<1s>"}' expandMacrosWith: token asString)
]
