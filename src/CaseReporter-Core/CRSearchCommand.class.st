"
A search command
"
Class {
	#name : #CRSearchCommand,
	#superclass : #CRTokenCommand,
	#instVars : [
		'query'
	],
	#category : #'CaseReporter-Core-Commands'
}

{ #category : #'instance creation' }
CRSearchCommand class >> query: query [

	^(self new)
		query: query;
		yourself
]

{ #category : #accessing }
CRSearchCommand >> commandName [
	^ 'search'
]

{ #category : #printing }
CRSearchCommand >> fillPostContentDictionary: aDictionary [
	super fillPostContentDictionary: aDictionary.
	aDictionary
		at: 'q' put: query asString;
		at: 'cols' put: #('sTitle' 'sStatus')
]

{ #category : #accessing }
CRSearchCommand >> query [
	^ query
]

{ #category : #accessing }
CRSearchCommand >> query: anObject [
	query := anObject
]
