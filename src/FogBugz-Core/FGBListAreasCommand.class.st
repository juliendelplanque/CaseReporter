"
List areas available.
"
Class {
	#name : #FGBListAreasCommand,
	#superclass : #FGBTokenCommand,
	#category : #'FogBugz-Core-Commands'
}

{ #category : #printing }
FGBListAreasCommand >> printOn: aStream [

	aStream
		nextPutAll:
			('{"cmd": "listAreas","token": "<1s>"}' expandMacrosWith: token asString)
]
