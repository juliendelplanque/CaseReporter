"
List milestones available.
"
Class {
	#name : #FGBListMilestonesCommand,
	#superclass : #FGBTokenCommand,
	#category : #'FogBugz-Core-Commands'
}

{ #category : #printing }
FGBListMilestonesCommand >> printOn: aStream [

	aStream
		nextPutAll:
			('{"cmd": "listFixFors","token": "<1s>"}' expandMacrosWith: token asString)
]
