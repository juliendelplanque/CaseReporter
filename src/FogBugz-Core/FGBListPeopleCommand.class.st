"
List people available on the server.
"
Class {
	#name : #FGBListPeopleCommand,
	#superclass : #FGBTokenCommand,
	#category : #'FogBugz-Core-Commands'
}

{ #category : #accessing }
FGBListPeopleCommand >> commandName [
	^ 'listPeople'
]

{ #category : #filling }
FGBListPeopleCommand >> fillPostContentDictionary: aDictionary [
	super fillPostContentDictionary: aDictionary.
	aDictionary
		at: 'fIncludeNormal' put: 1;
		at: 'fIncludeVirtual' put: 1
]
