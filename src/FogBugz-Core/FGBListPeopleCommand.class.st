"
List people available on the server.
"
Class {
	#name : #FGBListPeopleCommand,
	#superclass : #FGBTokenCommand,
	#category : #'FogBugz-Core-Commands'
}

{ #category : #printing }
FGBListPeopleCommand >> printOn: aStream [

	aStream
		nextPutAll:
			('{"cmd": "listPeople", "token": "<1s>"}' expandMacrosWith: token asString)
]
