"
Command allowing to create a new case on fogbugz.
"
Class {
	#name : #FGBNewCaseCommand,
	#superclass : #FGBTokenCommand,
	#instVars : [
		'case'
	],
	#category : #'FogBugz-Core-Commands'
}

{ #category : #accessing }
FGBNewCaseCommand >> case [
	^ case
]

{ #category : #accessing }
FGBNewCaseCommand >> case: anObject [
	case := anObject
]

{ #category : #filling }
FGBNewCaseCommand >> fillPostContentDictionary: aDictionary [
	super fillPostContentDictionary: aDictionary.
	aDictionary
		at: 'cmd' put: 'new';
		at: 'sTitle' put: self case title;
		at: 'sEvent' put: self case content asString;
		at: 'sCategory' put: self case category name;
		at: 'sProject' put: self case project name;
		at: 'sArea' put: self case area name;
		at: 'sMilestone' put: self case milestone name;
		at: 'sStatus' put: self case status name;
		at: 'sPersonAssignedTo' put: self case assignee name;
		at: 'sPriority' put: self case priority name
]
