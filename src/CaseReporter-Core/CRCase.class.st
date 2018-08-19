"
I model a case of the bugtracker.
"
Class {
	#name : #CRCase,
	#superclass : #CRObject,
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
	#category : #'CaseReporter-Core-Model'
}

{ #category : #example }
CRCase class >> example [
	^ self new
		id: 2;
		title: 'Short case description';
		content: 'Long case description';
		status: CRStatus example;
		project: CRProject example;
		priority: CRPriority example;
		milestone: CRMilestone example;
		category: CRCategory example;
		assignee: CRUser example;
		area: CRArea example;
		yourself
]

{ #category : #'instance creation' }
CRCase class >> fromDictionary: aCollection [ 
	|case|
	case := self new.
	case 
		id: (aCollection at: #ixBug) asNumber;
		title: (aCollection at: #sTitle);
		status: (aCollection at: #sStatus) asSymbol.
	^case
]

{ #category : #comparision }
CRCase >> <= anotherCase [

	^self id <= anotherCase id
]

{ #category : #accessing }
CRCase >> area [
	^ area
]

{ #category : #accessing }
CRCase >> area: anObject [
	area := anObject
]

{ #category : #conversion }
CRCase >> asURL [
	^'https://pharo.fogbugz.com/f/cases/', self id asString
]

{ #category : #accessing }
CRCase >> assignee [
	^ assignee
]

{ #category : #accessing }
CRCase >> assignee: anObject [
	assignee := anObject
]

{ #category : #accessing }
CRCase >> category [
	^ category
]

{ #category : #accessing }
CRCase >> category: anObject [
	category := anObject
]

{ #category : #accessing }
CRCase >> content [
	^ content
]

{ #category : #accessing }
CRCase >> content: anObject [
	content := anObject
]

{ #category : #comparision }
CRCase >> hash [
	self id ifNil: [ ^super hash ].
	^self id hash
]

{ #category : #accessing }
CRCase >> milestone [
	^ milestone
]

{ #category : #accessing }
CRCase >> milestone: anObject [
	milestone := anObject
]

{ #category : #printing }
CRCase >> printOn: aStream [

	aStream 
		nextPutAll: self id asString;
		nextPutAll: ' - ';
		nextPutAll: self title asString
]

{ #category : #accessing }
CRCase >> priority [
	^ priority
]

{ #category : #accessing }
CRCase >> priority: anObject [
	priority := anObject
]

{ #category : #accessing }
CRCase >> project [
	^ project
]

{ #category : #accessing }
CRCase >> project: anObject [
	project := anObject
]

{ #category : #accessing }
CRCase >> status [

	^status
]

{ #category : #accessing }
CRCase >> status: aSymbol [
	status := aSymbol
]

{ #category : #accessing }
CRCase >> title [

	^ self name
]

{ #category : #accessing }
CRCase >> title: aString [ 

	self name: aString
]
