"
I model a milestone for a project of the bugtracker.
"
Class {
	#name : #FGBMilestone,
	#superclass : #FGBObject,
	#instVars : [
		'projectId'
	],
	#category : #'FogBugz-Core-Model'
}

{ #category : #example }
FGBMilestone class >> example [
	^ self new
		id: 4;
		name: 'Soon';
		projectId: 5;
		yourself
]

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
