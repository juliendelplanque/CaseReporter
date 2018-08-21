"
I am an abstract object retrieved from the REST API.

I have an id and a name.

I am not meant to be instantiated. Use my concrete subclasses.
"
Class {
	#name : #CRFBObject,
	#superclass : #Object,
	#instVars : [
		'id',
		'name'
	],
	#category : #'CaseReporter-FogBugz-Model'
}

{ #category : #'instance creation' }
CRFBObject class >> fromDictionary: aDictionary [
	"Returns a new instance of the class built from the dictionary provided as parameter.
	 This dictionary comes from the result of a call to the REST API of FogBugz."
	^ self subclassResponsibility
]

{ #category : #accessing }
CRFBObject >> id [
	^ id
]

{ #category : #accessing }
CRFBObject >> id: anObject [
	id := anObject
]

{ #category : #accessing }
CRFBObject >> name [
	^ name
]

{ #category : #accessing }
CRFBObject >> name: anObject [
	name := anObject
]

{ #category : #printing }
CRFBObject >> printOn: aStream [
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
