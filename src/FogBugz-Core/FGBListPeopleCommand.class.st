"
List people available on the server.
"
Class {
	#name : #FGBListPeopleCommand,
	#superclass : #FGBTokenCommand,
	#category : #'FogBugz-Core-Commands'
}

{ #category : #filling }
FGBListPeopleCommand >> fillPostContentDictionary: aDictionary [
	super fillPostContentDictionary: aDictionary.
	aDictionary
		at: 'cmd' put: 'listPeople';
		at: 'fIncludeNormal' put: 1;
		at: 'fIncludeVirtual' put: 1
]
