"
I model the category of a case in the bugtracker.
"
Class {
	#name : #CRCategory,
	#superclass : #CRObject,
	#instVars : [
		'defaultStatusId',
		'defaultStatusIdWhenActive'
	],
	#category : #'CaseReporter-FogBugz-Model'
}

{ #category : #example }
CRCategory class >> example [
	^ self new
		id: 3;
		name: 'Best category';
		defaultStatusId: 7;
		defaultStatusIdWhenActive: 7;
		yourself
]

{ #category : #'instance creation' }
CRCategory class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixCategory);
		name: (aDictionary at: #sCategory);
		defaultStatusId: (aDictionary at: #ixStatusDefault);
		defaultStatusIdWhenActive: (aDictionary at: #ixStatusDefaultActive);
		yourself
]

{ #category : #accessing }
CRCategory >> defaultStatusId [
	^ defaultStatusId
]

{ #category : #accessing }
CRCategory >> defaultStatusId: anInteger [ 
	defaultStatusId := anInteger
]

{ #category : #accessing }
CRCategory >> defaultStatusIdWhenActive [
	^ defaultStatusIdWhenActive
]

{ #category : #accessing }
CRCategory >> defaultStatusIdWhenActive: anInteger [ 
	defaultStatusIdWhenActive := anInteger
]
