"
A command with a session command
"
Class {
	#name : #CRTokenCommand,
	#superclass : #CRCommand,
	#instVars : [
		'token'
	],
	#category : #'CaseReporter-FogBugz-Commands'
}

{ #category : #filling }
CRTokenCommand >> fillPostContentDictionary: aDictionary [
	super fillPostContentDictionary: aDictionary.
	aDictionary
		at: 'token' put: token
]

{ #category : #testing }
CRTokenCommand >> requiresSession [

	^true
]

{ #category : #accessing }
CRTokenCommand >> token [
	^ token
]

{ #category : #accessing }
CRTokenCommand >> token: anObject [
	token := anObject
]
