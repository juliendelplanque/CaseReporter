"
I model the priority of a case in the bugtracker.
"
Class {
	#name : #CRFBPriority,
	#superclass : #CRFBObject,
	#instVars : [
		'isDefault'
	],
	#category : #'CaseReporter-FogBugz-Model'
}

{ #category : #example }
CRFBPriority class >> example [
	^ self new
		id: 5;
		name: 'Important';
		isDefault: true;
		yourself
]

{ #category : #'instance creation' }
CRFBPriority class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixPriority);
		name: (aDictionary at: #sPriority);
		isDefault: (aDictionary at: #fDefault);
		yourself
]

{ #category : #accessing }
CRFBPriority >> isDefault [
	^ isDefault
]

{ #category : #accessing }
CRFBPriority >> isDefault: aBoolean [
	isDefault := aBoolean
]
