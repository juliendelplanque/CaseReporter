"
I model a milestone for a project of the bugtracker.
"
Class {
	#name : #CRMilestone,
	#superclass : #CRObject,
	#instVars : [
		'projectId'
	],
	#category : #'CaseReporter-Core-Model'
}

{ #category : #example }
CRMilestone class >> example [
	^ self new
		id: 4;
		name: 'Soon';
		projectId: 5;
		yourself
]

{ #category : #'instance creation' }
CRMilestone class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixFixFor);
		name: (aDictionary at: #sFixFor);
		projectId: (aDictionary at: #ixProject);
		yourself
]

{ #category : #accessing }
CRMilestone >> projectId [
	^ projectId
]

{ #category : #accessing }
CRMilestone >> projectId: anInteger [ 
	projectId := anInteger
]
