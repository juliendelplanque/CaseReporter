"
I model the category of a case in the bugtracker.
"
Class {
	#name : #CRFBCategory,
	#superclass : #CRFBObject,
	#instVars : [
		'defaultStatusId',
		'defaultStatusIdWhenActive'
	],
	#category : #'CaseReporter-FogBugz-Model'
}

{ #category : #example }
CRFBCategory class >> example [
	^ self new
		id: 3;
		name: 'Best category';
		defaultStatusId: 7;
		defaultStatusIdWhenActive: 7;
		yourself
]

{ #category : #'instance creation' }
CRFBCategory class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixCategory);
		name: (aDictionary at: #sCategory);
		defaultStatusId: (aDictionary at: #ixStatusDefault);
		defaultStatusIdWhenActive: (aDictionary at: #ixStatusDefaultActive);
		yourself
]

{ #category : #accessing }
CRFBCategory >> defaultStatusId [
	^ defaultStatusId
]

{ #category : #accessing }
CRFBCategory >> defaultStatusId: anInteger [ 
	defaultStatusId := anInteger
]

{ #category : #accessing }
CRFBCategory >> defaultStatusIdWhenActive [
	^ defaultStatusIdWhenActive
]

{ #category : #accessing }
CRFBCategory >> defaultStatusIdWhenActive: anInteger [ 
	defaultStatusIdWhenActive := anInteger
]
