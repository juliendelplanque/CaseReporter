"
I am an abstract object retrieved from the REST API.

I have an id and a name.

I am not meant to be instantiated. Use my concrete subclasses.
"
Class {
	#name : #FGBObject,
	#superclass : #Object,
	#instVars : [
		'id',
		'name'
	],
	#category : #'FogBugz-Core-Model'
}

{ #category : #'instance creation' }
FGBObject class >> fromDictionary: aDictionary [
	"Returns a new instance of the class built from the dictionary provided as parameter.
	 This dictionary comes from the result of a call to the REST API of FogBugz."
	^ self subclassResponsibility
]

{ #category : #accessing }
FGBObject >> id [
	^ id
]

{ #category : #accessing }
FGBObject >> id: anObject [
	id := anObject
]

{ #category : #accessing }
FGBObject >> name [
	^ name
]

{ #category : #accessing }
FGBObject >> name: anObject [
	name := anObject
]

{ #category : #printing }
FGBObject >> printOn: aStream [
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
