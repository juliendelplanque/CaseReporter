Class {
	#name : #FGBMilestone,
	#superclass : #FGBObject,
	#instVars : [
		'projectId'
	],
	#category : #'FogBugz-Core-Model'
}

{ #category : #'instance creation' }
FGBMilestone class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixFixFor);
		name: (aDictionary at: #sFixFor);
		projectId: (aDictionary at: #ixProject);
		yourself
]

{ #category : #accessing }
FGBMilestone >> projectId [
	^ projectId
]

{ #category : #accessing }
FGBMilestone >> projectId: anInteger [ 
	projectId := anInteger
]
