"
I am an abstract object retrieved from the REST API.

I have an id and a name.

I am not meant to be instantiated. Use my concrete subclasses.
"
Class {
	#name : #CRObject,
	#superclass : #Object,
	#instVars : [
		'id',
		'name'
	],
	#category : #'CaseReporter-Core-Model'
}

{ #category : #'instance creation' }
CRObject class >> fromDictionary: aDictionary [
	"Returns a new instance of the class built from the dictionary provided as parameter.
	 This dictionary comes from the result of a call to the REST API of FogBugz."
	^ self subclassResponsibility
]

{ #category : #accessing }
CRObject >> id [
	^ id
]

{ #category : #accessing }
CRObject >> id: anObject [
	id := anObject
]

{ #category : #accessing }
CRObject >> name [
	^ name
]

{ #category : #accessing }
CRObject >> name: anObject [
	name := anObject
]

{ #category : #printing }
CRObject >> printOn: aStream [
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
