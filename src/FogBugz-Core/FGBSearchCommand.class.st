"
A search command
"
Class {
	#name : #FGBSearchCommand,
	#superclass : #FGBTokenCommand,
	#instVars : [
		'query'
	],
	#category : #'FogBugz-Core-Commands'
}

{ #category : #'instance creation' }
FGBSearchCommand class >> query: query [

	^(self new)
		query: query;
		yourself
]

{ #category : #printing }
FGBSearchCommand >> printOn: aStream [

	aStream
		nextPutAll:
			('{"cmd": "search",
			   "token": "<1s>",
			   "q": "<2s>",
    			"cols": ["sTitle", "sStatus"]
			}' expandMacrosWith: token asString with: query asString)
]

{ #category : #accessing }
FGBSearchCommand >> query [
	^ query
]

{ #category : #accessing }
FGBSearchCommand >> query: anObject [
	query := anObject
]
