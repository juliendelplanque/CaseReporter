"
A command with a session command
"
Class {
	#name : #CRFBTokenCommand,
	#superclass : #CRFBCommand,
	#instVars : [
		'token'
	],
	#category : #'CaseReporter-FogBugz-Commands'
}

{ #category : #filling }
CRFBTokenCommand >> fillPostContentDictionary: aDictionary [
	super fillPostContentDictionary: aDictionary.
	aDictionary
		at: 'token' put: token
]

{ #category : #testing }
CRFBTokenCommand >> requiresSession [

	^true
]

{ #category : #accessing }
CRFBTokenCommand >> token [
	^ token
]

{ #category : #accessing }
CRFBTokenCommand >> token: anObject [
	token := anObject
]
