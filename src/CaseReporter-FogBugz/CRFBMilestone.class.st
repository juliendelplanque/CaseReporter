"
I model a milestone for a project of the bugtracker.
"
Class {
	#name : #CRFBMilestone,
	#superclass : #CRFBObject,
	#instVars : [
		'projectId'
	],
	#category : #'CaseReporter-FogBugz-Model'
}

{ #category : #example }
CRFBMilestone class >> example [
	^ self new
		id: 4;
		name: 'Soon';
		projectId: 5;
		yourself
]

{ #category : #'instance creation' }
CRFBMilestone class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixFixFor);
		name: (aDictionary at: #sFixFor);
		projectId: (aDictionary at: #ixProject);
		yourself
]

{ #category : #accessing }
CRFBMilestone >> projectId [
	^ projectId
]

{ #category : #accessing }
CRFBMilestone >> projectId: anInteger [ 
	projectId := anInteger
]
