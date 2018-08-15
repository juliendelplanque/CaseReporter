Class {
	#name : #FGBCategory,
	#superclass : #FGBObject,
	#instVars : [
		'idDefaultStatus',
		'idDefaultStatusWhenActive'
	],
	#category : #'FogBugz-Core-Model'
}

{ #category : #'instance creation' }
FGBCategory class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixCategory);
		name: (aDictionary at: #sCategory);
		idDefaultStatus: (aDictionary at: #ixStatusDefault);
		idDefaultStatusWhenActive: (aDictionary at: #ixStatusDefaultActive);
		yourself
]

{ #category : #accessing }
FGBCategory >> idDefaultStatus [
	^ idDefaultStatus
]

{ #category : #accessing }
FGBCategory >> idDefaultStatus: anInteger [ 
	idDefaultStatus := anInteger
]

{ #category : #accessing }
FGBCategory >> idDefaultStatusWhenActive [
	^ idDefaultStatusWhenActive
]

{ #category : #accessing }
FGBCategory >> idDefaultStatusWhenActive: anInteger [ 
	idDefaultStatusWhenActive := anInteger
]
