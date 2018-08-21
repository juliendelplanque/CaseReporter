"
I model a project in the bugtracker.
"
Class {
	#name : #CRFBProject,
	#superclass : #CRFBObject,
	#instVars : [
		'defaultAssigneeId',
		'isInbox'
	],
	#category : #'CaseReporter-FogBugz-Model'
}

{ #category : #example }
CRFBProject class >> example [
	^ self new
		id: 6;
		name: 'My project';
		defaultAssigneeId: 8;
		isInbox: false;
		yourself
]

{ #category : #'instance creation' }
CRFBProject class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixProject);
		name: (aDictionary at: #sProject);
		defaultAssigneeId: (aDictionary at: #ixPersonOwner);
		isInbox: (aDictionary at: #fInbox);
		yourself
]

{ #category : #accessing }
CRFBProject >> defaultAssigneeId [
	^ defaultAssigneeId
]

{ #category : #accessing }
CRFBProject >> defaultAssigneeId: anInteger [ 
	defaultAssigneeId := anInteger 
]

{ #category : #accessing }
CRFBProject >> isInbox [
	^ isInbox
]

{ #category : #accessing }
CRFBProject >> isInbox: aBoolean [ 
	isInbox := aBoolean 
]
