"
A search command
"
Class {
	#name : #CRFBSearchCommand,
	#superclass : #CRFBTokenCommand,
	#instVars : [
		'query'
	],
	#category : #'CaseReporter-FogBugz-Commands'
}

{ #category : #'instance creation' }
CRFBSearchCommand class >> query: query [

	^(self new)
		query: query;
		yourself
]

{ #category : #accessing }
CRFBSearchCommand >> commandName [
	^ 'search'
]

{ #category : #printing }
CRFBSearchCommand >> fillPostContentDictionary: aDictionary [
	super fillPostContentDictionary: aDictionary.
	aDictionary
		at: 'q' put: query asString;
		at: 'cols' put: #('sTitle' 'sStatus')
]

{ #category : #accessing }
CRFBSearchCommand >> query [
	^ query
]

{ #category : #accessing }
CRFBSearchCommand >> query: anObject [
	query := anObject
]
