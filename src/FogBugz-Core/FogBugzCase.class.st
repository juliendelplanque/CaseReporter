"
A case in FogBugz
"
Class {
	#name : #FogBugzCase,
	#superclass : #FGBObject,
	#instVars : [
		'title',
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

{ #category : #'instance creation' }
FogBugzCase class >> fromDictionary: aCollection [ 
	|case|
	case := self new.
	case 
		id: (aCollection at: #ixBug) asNumber;
		title: (aCollection at: #sTitle);
		status: (aCollection at: #sStatus) asSymbol.
	^case
]

{ #category : #comparision }
FogBugzCase >> <= anotherCase [

	^self id <= anotherCase id
]

{ #category : #accessing }
FogBugzCase >> area [
	^ area
]

{ #category : #accessing }
FogBugzCase >> area: anObject [
	area := anObject
]

{ #category : #conversion }
FogBugzCase >> asURL [
	^'https://pharo.fogbugz.com/f/cases/', self id asString
]

{ #category : #accessing }
FogBugzCase >> assignee [
	^ assignee
]

{ #category : #accessing }
FogBugzCase >> assignee: anObject [
	assignee := anObject
]

{ #category : #accessing }
FogBugzCase >> category [
	^ category
]

{ #category : #accessing }
FogBugzCase >> category: anObject [
	category := anObject
]

{ #category : #accessing }
FogBugzCase >> content [
	^ content
]

{ #category : #accessing }
FogBugzCase >> content: anObject [
	content := anObject
]

{ #category : #comparision }
FogBugzCase >> hash [
	self id ifNil: [ ^super hash ].
	^self id hash
]

{ #category : #accessing }
FogBugzCase >> milestone [
	^ milestone
]

{ #category : #accessing }
FogBugzCase >> milestone: anObject [
	milestone := anObject
]

{ #category : #accessing }
FogBugzCase >> name [
	^ self title
]

{ #category : #accessing }
FogBugzCase >> name: aString [
	^ self shouldNotImplement "Use #title instead."
]

{ #category : #printing }
FogBugzCase >> printOn: aStream [

	aStream 
		nextPutAll: self id asString;
		nextPutAll: ' - ';
		nextPutAll: self title asString
]

{ #category : #accessing }
FogBugzCase >> priority [
	^ priority
]

{ #category : #accessing }
FogBugzCase >> priority: anObject [
	priority := anObject
]

{ #category : #accessing }
FogBugzCase >> project [
	^ project
]

{ #category : #accessing }
FogBugzCase >> project: anObject [
	project := anObject
]

{ #category : #accessing }
FogBugzCase >> status [

	^status
]

{ #category : #accessing }
FogBugzCase >> status: aSymbol [
	status := aSymbol
]

{ #category : #accessing }
FogBugzCase >> title [

	^title
]

{ #category : #accessing }
FogBugzCase >> title: aString [ 

	title := aString
]
