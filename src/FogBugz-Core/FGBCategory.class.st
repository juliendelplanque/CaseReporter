Class {
	#name : #FGBCategory,
	#superclass : #FGBObject,
	#instVars : [
		'defaultStatusId',
		'defaultStatusIdWhenActive'
	],
	#category : #'FogBugz-Core-Model'
}

{ #category : #example }
FGBCategory class >> example [
	^ self new
		id: 3;
		name: 'Best category';
		defaultStatusId: 7;
		defaultStatusIdWhenActive: 7;
		yourself
]

{ #category : #'instance creation' }
FGBCategory class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixCategory);
		name: (aDictionary at: #sCategory);
		defaultStatusId: (aDictionary at: #ixStatusDefault);
		defaultStatusIdWhenActive: (aDictionary at: #ixStatusDefaultActive);
		yourself
]

{ #category : #accessing }
FGBCategory >> defaultStatusId [
	^ defaultStatusId
]

{ #category : #accessing }
FGBCategory >> defaultStatusId: anInteger [ 
	defaultStatusId := anInteger
]

{ #category : #accessing }
FGBCategory >> defaultStatusIdWhenActive [
	^ defaultStatusIdWhenActive
]

{ #category : #accessing }
FGBCategory >> defaultStatusIdWhenActive: anInteger [ 
	defaultStatusIdWhenActive := anInteger
]
