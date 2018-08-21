"
I model the priority of a case in the bugtracker.
"
Class {
	#name : #CRPriority,
	#superclass : #CRObject,
	#instVars : [
		'isDefault'
	],
	#category : #'CaseReporter-FogBugz-Model'
}

{ #category : #example }
CRPriority class >> example [
	^ self new
		id: 5;
		name: 'Important';
		isDefault: true;
		yourself
]

{ #category : #'instance creation' }
CRPriority class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixPriority);
		name: (aDictionary at: #sPriority);
		isDefault: (aDictionary at: #fDefault);
		yourself
]

{ #category : #accessing }
CRPriority >> isDefault [
	^ isDefault
]

{ #category : #accessing }
CRPriority >> isDefault: aBoolean [
	isDefault := aBoolean
]
