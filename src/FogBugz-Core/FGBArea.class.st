Class {
	#name : #FGBArea,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'projectId'
	],
	#category : #'FogBugz-Core-Model'
}

{ #category : #'instance creation' }
FGBArea class >> fromDictionary: aDictionary [
	^ self new
		name: (aDictionary at: #sArea);
		id: (aDictionary at: #ixArea);
		projectId: (aDictionary at: #ixProject);
		yourself
]

{ #category : #accessing }
FGBArea >> id [
	^ id
]

{ #category : #accessing }
FGBArea >> id: anObject [
	id := anObject
]

{ #category : #accessing }
FGBArea >> name [
	^ name
]

{ #category : #accessing }
FGBArea >> name: anObject [
	name := anObject
]

{ #category : #printing }
FGBArea >> printOn: aStream [
	super printOn: aStream.
	aStream
		<< $(.
	self id printOn: aStream.
	aStream
		<< $:.
	self name printOn: aStream.
	aStream
		<< $)
]

{ #category : #accessing }
FGBArea >> projectId [
	^ projectId
]

{ #category : #accessing }
FGBArea >> projectId: anObject [
	projectId := anObject
]
