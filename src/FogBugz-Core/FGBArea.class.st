Class {
	#name : #FGBArea,
	#superclass : #FGBObject,
	#instVars : [
		'projectId'
	],
	#category : #'FogBugz-Core-Model'
}

{ #category : #example }
FGBArea class >> example [
	^ self new
		name: 'Foo';
		id: 1;
		projectId: 6;
		yourself
]

{ #category : #'instance creation' }
FGBArea class >> fromDictionary: aDictionary [
	^ self new
		name: (aDictionary at: #sArea);
		id: (aDictionary at: #ixArea);
		projectId: (aDictionary at: #ixProject);
		yourself
]

{ #category : #accessing }
FGBArea >> projectId [
	^ projectId
]

{ #category : #accessing }
FGBArea >> projectId: anObject [
	projectId := anObject
]
