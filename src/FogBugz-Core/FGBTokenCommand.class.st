"
A command with a session command
"
Class {
	#name : #FGBTokenCommand,
	#superclass : #FGBCommand,
	#instVars : [
		'token'
	],
	#category : #'FogBugz-Core-Commands'
}

{ #category : #filling }
FGBTokenCommand >> fillPostContentDictionary: aDictionary [
	aDictionary
		at: 'token' put: token
]

{ #category : #testing }
FGBTokenCommand >> requiresSession [

	^true
]

{ #category : #accessing }
FGBTokenCommand >> token [
	^ token
]

{ #category : #accessing }
FGBTokenCommand >> token: anObject [
	token := anObject
]
