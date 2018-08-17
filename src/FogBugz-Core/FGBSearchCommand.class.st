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

{ #category : #accessing }
FGBSearchCommand >> commandName [
	^ 'search'
]

{ #category : #printing }
FGBSearchCommand >> fillPostContentDictionary: aDictionary [
	super fillPostContentDictionary: aDictionary.
	aDictionary
		at: 'q' put: query asString;
		at: 'cols' put: #('sTitle' 'sStatus')
]

{ #category : #accessing }
FGBSearchCommand >> query [
	^ query
]

{ #category : #accessing }
FGBSearchCommand >> query: anObject [
	query := anObject
]
