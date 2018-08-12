"
List statuses available.
"
Class {
	#name : #FGBListStatusesCommand,
	#superclass : #FGBTokenCommand,
	#category : #'FogBugz-Core-Commands'
}

{ #category : #printing }
FGBListStatusesCommand >> printOn: aStream [

	aStream
		nextPutAll:
			('{"cmd": "listStatuses","token": "<1s>"}' expandMacrosWith: token asString)
]
