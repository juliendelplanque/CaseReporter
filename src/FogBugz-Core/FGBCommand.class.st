"
A fogbugz API command
"
Class {
	#name : #FGBCommand,
	#superclass : #Object,
	#category : #'FogBugz-Core-Commands'
}

{ #category : #converting }
FGBCommand >> asPostContentDictionary [
	"Generates the Dictionary for post content in the call to Fogbugz API."
	| d |
	d := Dictionary new.
	self fillPostContentDictionary: d.
	^ d
]

{ #category : #converting }
FGBCommand >> asPostContentJSON [
	"Generates the JSON version of the Dictionary for post content in the call to Fogbugz API."
	^ STONJSON toString: self asPostContentDictionary
]

{ #category : #filling }
FGBCommand >> fillPostContentDictionary: aDictionary [
	"The responsibility of this method is to add required keys-values to the dictionary that will be used to generate post content."
	self subclassResponsibility
]

{ #category : #printing }
FGBCommand >> printOn: aStream [
	super printOn: aStream.
	aStream
		<< $(;
		<< self asPostContentJSON;
		<< $)
]

{ #category : #testing }
FGBCommand >> requiresSession [

	^false
]
