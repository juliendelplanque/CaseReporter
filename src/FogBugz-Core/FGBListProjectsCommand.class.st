"
List projects available.
"
Class {
	#name : #FGBListProjectsCommand,
	#superclass : #FGBTokenCommand,
	#category : #'FogBugz-Core-Commands'
}

{ #category : #printing }
FGBListProjectsCommand >> printOn: aStream [

	aStream
		nextPutAll:
			('{"cmd": "listProjects","token": "<1s>"}' expandMacrosWith: token asString)
]
