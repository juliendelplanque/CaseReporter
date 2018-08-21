"
I model a case of the bugtracker.
"
Class {
	#name : #CRFBCase,
	#superclass : #CRFBObject,
	#instVars : [
		'status',
		'content',
		'project',
		'category',
		'area',
		'milestone',
		'assignee',
		'priority'
	],
	#category : #'CaseReporter-FogBugz-Model'
}

{ #category : #example }
CRFBCase class >> example [
	^ self new
		id: 2;
		title: 'Short case description';
		content: 'Long case description';
		status: CRFBStatus example;
		project: CRFBProject example;
		priority: CRFBPriority example;
		milestone: CRFBMilestone example;
		category: CRFBCategory example;
		assignee: CRFBUser example;
		area: CRFBArea example;
		yourself
]

{ #category : #'instance creation' }
CRFBCase class >> fromDictionary: aCollection [ 
	|case|
	case := self new.
	case 
		id: (aCollection at: #ixBug) asNumber;
		title: (aCollection at: #sTitle);
		status: (aCollection at: #sStatus) asSymbol.
	^case
]

{ #category : #comparision }
CRFBCase >> <= anotherCase [

	^self id <= anotherCase id
]

{ #category : #accessing }
CRFBCase >> area [
	^ area
]

{ #category : #accessing }
CRFBCase >> area: anObject [
	area := anObject
]

{ #category : #conversion }
CRFBCase >> asURL [
	^'https://pharo.fogbugz.com/f/cases/', self id asString
]

{ #category : #accessing }
CRFBCase >> assignee [
	^ assignee
]

{ #category : #accessing }
CRFBCase >> assignee: anObject [
	assignee := anObject
]

{ #category : #accessing }
CRFBCase >> category [
	^ category
]

{ #category : #accessing }
CRFBCase >> category: anObject [
	category := anObject
]

{ #category : #accessing }
CRFBCase >> content [
	^ content
]

{ #category : #accessing }
CRFBCase >> content: anObject [
	content := anObject
]

{ #category : #comparision }
CRFBCase >> hash [
	self id ifNil: [ ^super hash ].
	^self id hash
]

{ #category : #accessing }
CRFBCase >> milestone [
	^ milestone
]

{ #category : #accessing }
CRFBCase >> milestone: anObject [
	milestone := anObject
]

{ #category : #printing }
CRFBCase >> printOn: aStream [

	aStream 
		nextPutAll: self id asString;
		nextPutAll: ' - ';
		nextPutAll: self title asString
]

{ #category : #accessing }
CRFBCase >> priority [
	^ priority
]

{ #category : #accessing }
CRFBCase >> priority: anObject [
	priority := anObject
]

{ #category : #accessing }
CRFBCase >> project [
	^ project
]

{ #category : #accessing }
CRFBCase >> project: anObject [
	project := anObject
]

{ #category : #accessing }
CRFBCase >> status [

	^status
]

{ #category : #accessing }
CRFBCase >> status: aSymbol [
	status := aSymbol
]

{ #category : #accessing }
CRFBCase >> title [

	^ self name
]

{ #category : #accessing }
CRFBCase >> title: aString [ 

	self name: aString
]
