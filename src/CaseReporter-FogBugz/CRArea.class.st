"
I model the area of a project in the bugtracker.
"
Class {
	#name : #CRArea,
	#superclass : #CRObject,
	#instVars : [
		'projectId'
	],
	#category : #'CaseReporter-FogBugz-Model'
}

{ #category : #example }
CRArea class >> example [
	^ self new
		name: 'Foo';
		id: 1;
		projectId: 6;
		yourself
]

{ #category : #'instance creation' }
CRArea class >> fromDictionary: aDictionary [
	^ self new
		name: (aDictionary at: #sArea);
		id: (aDictionary at: #ixArea);
		projectId: (aDictionary at: #ixProject);
		yourself
]

{ #category : #accessing }
CRArea >> projectId [
	^ projectId
]

{ #category : #accessing }
CRArea >> projectId: anObject [
	projectId := anObject
]
