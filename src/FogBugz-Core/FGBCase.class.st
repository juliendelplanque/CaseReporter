"
A case in FogBugz
"
Class {
	#name : #FGBCase,
	#superclass : #FGBObject,
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
	#category : #'FogBugz-Core-Model'
}

{ #category : #example }
FGBCase class >> example [
	^ self new
		id: 2;
		title: 'Short case description';
		content: 'Long case description';
		status: FGBStatus example;
		project: FGBProject example;
		priority: FGBPriority example;
		milestone: FGBMilestone example;
		category: FGBCategory example;
		assignee: FGBUser example;
		area: FGBArea example;
		yourself
]

{ #category : #'instance creation' }
FGBCase class >> fromDictionary: aCollection [ 
	|case|
	case := self new.
	case 
		id: (aCollection at: #ixBug) asNumber;
		title: (aCollection at: #sTitle);
		status: (aCollection at: #sStatus) asSymbol.
	^case
]

{ #category : #comparision }
FGBCase >> <= anotherCase [

	^self id <= anotherCase id
]

{ #category : #accessing }
FGBCase >> area [
	^ area
]

{ #category : #accessing }
FGBCase >> area: anObject [
	area := anObject
]

{ #category : #conversion }
FGBCase >> asURL [
	^'https://pharo.fogbugz.com/f/cases/', self id asString
]

{ #category : #accessing }
FGBCase >> assignee [
	^ assignee
]

{ #category : #accessing }
FGBCase >> assignee: anObject [
	assignee := anObject
]

{ #category : #accessing }
FGBCase >> category [
	^ category
]

{ #category : #accessing }
FGBCase >> category: anObject [
	category := anObject
]

{ #category : #accessing }
FGBCase >> content [
	^ content
]

{ #category : #accessing }
FGBCase >> content: anObject [
	content := anObject
]

{ #category : #comparision }
FGBCase >> hash [
	self id ifNil: [ ^super hash ].
	^self id hash
]

{ #category : #accessing }
FGBCase >> milestone [
	^ milestone
]

{ #category : #accessing }
FGBCase >> milestone: anObject [
	milestone := anObject
]

{ #category : #printing }
FGBCase >> printOn: aStream [

	aStream 
		nextPutAll: self id asString;
		nextPutAll: ' - ';
		nextPutAll: self title asString
]

{ #category : #accessing }
FGBCase >> priority [
	^ priority
]

{ #category : #accessing }
FGBCase >> priority: anObject [
	priority := anObject
]

{ #category : #accessing }
FGBCase >> project [
	^ project
]

{ #category : #accessing }
FGBCase >> project: anObject [
	project := anObject
]

{ #category : #accessing }
FGBCase >> status [

	^status
]

{ #category : #accessing }
FGBCase >> status: aSymbol [
	status := aSymbol
]

{ #category : #accessing }
FGBCase >> title [

	^ self name
]

{ #category : #accessing }
FGBCase >> title: aString [ 

	self name: aString
]
