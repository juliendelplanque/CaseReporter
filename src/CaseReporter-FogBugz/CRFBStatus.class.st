"
I model the status of a case in the bugtracker.
"
Class {
	#name : #CRFBStatus,
	#superclass : #CRFBObject,
	#instVars : [
		'categoryId',
		'orderIndex'
	],
	#category : #'CaseReporter-FogBugz-Model'
}

{ #category : #example }
CRFBStatus class >> example [
	^ self new
		id: 7;
		name: 'TODO';
		categoryId: 3;
		orderIndex: 1;
		yourself
]

{ #category : #'instance creation' }
CRFBStatus class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixStatus);
		name: (aDictionary at: #sStatus);
		categoryId: (aDictionary at: #ixCategory);
		orderIndex: (aDictionary at: #iOrder);
		yourself
]

{ #category : #accessing }
CRFBStatus >> categoryId [
	^ categoryId
]

{ #category : #accessing }
CRFBStatus >> categoryId: anInteger [ 
	categoryId := anInteger 
]

{ #category : #accessing }
CRFBStatus >> orderIndex [
	^ orderIndex
]

{ #category : #accessing }
CRFBStatus >> orderIndex: anInteger [ 
	orderIndex := anInteger 
]
