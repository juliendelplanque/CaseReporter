"
List people available on the server.
"
Class {
	#name : #CRFBListPeopleCommand,
	#superclass : #CRFBTokenCommand,
	#category : #'CaseReporter-FogBugz-Commands'
}

{ #category : #accessing }
CRFBListPeopleCommand >> commandName [
	^ 'listPeople'
]

{ #category : #filling }
CRFBListPeopleCommand >> fillPostContentDictionary: aDictionary [
	super fillPostContentDictionary: aDictionary.
	aDictionary
		at: 'fIncludeNormal' put: 1;
		at: 'fIncludeVirtual' put: 1
]
