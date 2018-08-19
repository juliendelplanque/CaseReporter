"
I model a project in the bugtracker.
"
Class {
	#name : #FGBProject,
	#superclass : #FGBObject,
	#instVars : [
		'defaultAssigneeId',
		'isInbox'
	],
	#category : #'FogBugz-Core-Model'
}

{ #category : #example }
FGBProject class >> example [
	^ self new
		id: 6;
		name: 'My project';
		defaultAssigneeId: 8;
		isInbox: false;
		yourself
]

{ #category : #'instance creation' }
FGBProject class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixProject);
		name: (aDictionary at: #sProject);
		defaultAssigneeId: (aDictionary at: #ixPersonOwner);
		isInbox: (aDictionary at: #fInbox);
		yourself
]

{ #category : #accessing }
FGBProject >> defaultAssigneeId [
	^ defaultAssigneeId
]

{ #category : #accessing }
FGBProject >> defaultAssigneeId: anInteger [ 
	defaultAssigneeId := anInteger 
]

{ #category : #accessing }
FGBProject >> isInbox [
	^ isInbox
]

{ #category : #accessing }
FGBProject >> isInbox: aBoolean [ 
	isInbox := aBoolean 
]
