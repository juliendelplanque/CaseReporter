"
A fogbugz API command
"
Class {
	#name : #CRCommand,
	#superclass : #Object,
	#category : #'CaseReporter-FogBugz-Commands'
}

{ #category : #converting }
CRCommand >> asPostContentDictionary [
	"Generates the Dictionary for post content in the call to Fogbugz API."
	| d |
	d := Dictionary new.
	self fillPostContentDictionary: d.
	^ d
]

{ #category : #converting }
CRCommand >> asPostContentJSON [
	"Generates the JSON version of the Dictionary for post content in the call to Fogbugz API."
	^ STONJSON toString: self asPostContentDictionary
]

{ #category : #accessing }
CRCommand >> commandName [
	^ self subclassResponsibility
]

{ #category : #filling }
CRCommand >> fillPostContentDictionary: aDictionary [
	"The responsibility of this method is to add required keys-values to the dictionary that will be used to generate post content."
	aDictionary
		at: 'cmd' put: self commandName
]

{ #category : #printing }
CRCommand >> printOn: aStream [
	super printOn: aStream.
	aStream
		<< $(;
		<< self asPostContentJSON;
		<< $)
]

{ #category : #testing }
CRCommand >> requiresSession [

	^false
]
