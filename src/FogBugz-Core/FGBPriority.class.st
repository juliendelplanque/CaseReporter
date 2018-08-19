"
I model the priority of a case in the bugtracker.
"
Class {
	#name : #FGBPriority,
	#superclass : #FGBObject,
	#instVars : [
		'isDefault'
	],
	#category : #'FogBugz-Core-Model'
}

{ #category : #example }
FGBPriority class >> example [
	^ self new
		id: 5;
		name: 'Important';
		isDefault: true;
		yourself
]

{ #category : #'instance creation' }
FGBPriority class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixPriority);
		name: (aDictionary at: #sPriority);
		isDefault: (aDictionary at: #fDefault);
		yourself
]

{ #category : #accessing }
FGBPriority >> isDefault [
	^ isDefault
]

{ #category : #accessing }
FGBPriority >> isDefault: aBoolean [
	isDefault := aBoolean
]
