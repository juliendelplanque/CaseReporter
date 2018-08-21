"
A fogbugz API command
"
Class {
	#name : #CRFBCommand,
	#superclass : #Object,
	#category : #'CaseReporter-FogBugz-Commands'
}

{ #category : #converting }
CRFBCommand >> asPostContentDictionary [
	"Generates the Dictionary for post content in the call to Fogbugz API."
	| d |
	d := Dictionary new.
	self fillPostContentDictionary: d.
	^ d
]

{ #category : #converting }
CRFBCommand >> asPostContentJSON [
	"Generates the JSON version of the Dictionary for post content in the call to Fogbugz API."
	^ STONJSON toString: self asPostContentDictionary
]

{ #category : #accessing }
CRFBCommand >> commandName [
	^ self subclassResponsibility
]

{ #category : #filling }
CRFBCommand >> fillPostContentDictionary: aDictionary [
	"The responsibility of this method is to add required keys-values to the dictionary that will be used to generate post content."
	aDictionary
		at: 'cmd' put: self commandName
]

{ #category : #printing }
CRFBCommand >> printOn: aStream [
	super printOn: aStream.
	aStream
		<< $(;
		<< self asPostContentJSON;
		<< $)
]

{ #category : #testing }
CRFBCommand >> requiresSession [

	^false
]
