"
I model the status of a case in the bugtracker.
"
Class {
	#name : #CRStatus,
	#superclass : #CRObject,
	#instVars : [
		'categoryId',
		'orderIndex'
	],
	#category : #'CaseReporter-Core-Model'
}

{ #category : #example }
CRStatus class >> example [
	^ self new
		id: 7;
		name: 'TODO';
		categoryId: 3;
		orderIndex: 1;
		yourself
]

{ #category : #'instance creation' }
CRStatus class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixStatus);
		name: (aDictionary at: #sStatus);
		categoryId: (aDictionary at: #ixCategory);
		orderIndex: (aDictionary at: #iOrder);
		yourself
]

{ #category : #accessing }
CRStatus >> categoryId [
	^ categoryId
]

{ #category : #accessing }
CRStatus >> categoryId: anInteger [ 
	categoryId := anInteger 
]

{ #category : #accessing }
CRStatus >> orderIndex [
	^ orderIndex
]

{ #category : #accessing }
CRStatus >> orderIndex: anInteger [ 
	orderIndex := anInteger 
]
