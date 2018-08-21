"
List people available on the server.
"
Class {
	#name : #CRListPeopleCommand,
	#superclass : #CRTokenCommand,
	#category : #'CaseReporter-FogBugz-Commands'
}

{ #category : #accessing }
CRListPeopleCommand >> commandName [
	^ 'listPeople'
]

{ #category : #filling }
CRListPeopleCommand >> fillPostContentDictionary: aDictionary [
	super fillPostContentDictionary: aDictionary.
	aDictionary
		at: 'fIncludeNormal' put: 1;
		at: 'fIncludeVirtual' put: 1
]
