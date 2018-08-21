"
I model the area of a project in the bugtracker.
"
Class {
	#name : #CRFBArea,
	#superclass : #CRFBObject,
	#instVars : [
		'projectId'
	],
	#category : #'CaseReporter-FogBugz-Model'
}

{ #category : #example }
CRFBArea class >> example [
	^ self new
		name: 'Foo';
		id: 1;
		projectId: 6;
		yourself
]

{ #category : #'instance creation' }
CRFBArea class >> fromDictionary: aDictionary [
	^ self new
		name: (aDictionary at: #sArea);
		id: (aDictionary at: #ixArea);
		projectId: (aDictionary at: #ixProject);
		yourself
]

{ #category : #accessing }
CRFBArea >> projectId [
	^ projectId
]

{ #category : #accessing }
CRFBArea >> projectId: anObject [
	projectId := anObject
]
