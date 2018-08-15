Class {
	#name : #FGBStatus,
	#superclass : #FGBObject,
	#instVars : [
		'categoryId',
		'orderIndex'
	],
	#category : #'FogBugz-Core-Model'
}

{ #category : #'instance creation' }
FGBStatus class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixStatus);
		name: (aDictionary at: #sStatus);
		categoryId: (aDictionary at: #ixCategory);
		orderIndex: (aDictionary at: #iOrder);
		yourself
]

{ #category : #accessing }
FGBStatus >> categoryId [
	^ categoryId
]

{ #category : #accessing }
FGBStatus >> categoryId: anInteger [ 
	categoryId := anInteger 
]

{ #category : #accessing }
FGBStatus >> orderIndex [
	^ orderIndex
]

{ #category : #accessing }
FGBStatus >> orderIndex: anInteger [ 
	orderIndex := anInteger 
]
