"
I model a project in the bugtracker.
"
Class {
	#name : #CRProject,
	#superclass : #CRObject,
	#instVars : [
		'defaultAssigneeId',
		'isInbox'
	],
	#category : #'CaseReporter-FogBugz-Model'
}

{ #category : #example }
CRProject class >> example [
	^ self new
		id: 6;
		name: 'My project';
		defaultAssigneeId: 8;
		isInbox: false;
		yourself
]

{ #category : #'instance creation' }
CRProject class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixProject);
		name: (aDictionary at: #sProject);
		defaultAssigneeId: (aDictionary at: #ixPersonOwner);
		isInbox: (aDictionary at: #fInbox);
		yourself
]

{ #category : #accessing }
CRProject >> defaultAssigneeId [
	^ defaultAssigneeId
]

{ #category : #accessing }
CRProject >> defaultAssigneeId: anInteger [ 
	defaultAssigneeId := anInteger 
]

{ #category : #accessing }
CRProject >> isInbox [
	^ isInbox
]

{ #category : #accessing }
CRProject >> isInbox: aBoolean [ 
	isInbox := aBoolean 
]
