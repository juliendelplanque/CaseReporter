"
I model a user of the bugtracker.
"
Class {
	#name : #CRFBUser,
	#superclass : #CRFBObject,
	#instVars : [
		'isVirtual'
	],
	#category : #'CaseReporter-FogBugz-Model'
}

{ #category : #example }
CRFBUser class >> example [
	^ self new
		id: 8;
		name: 'John Doe';
		isVirtual: false;
		yourself
]

{ #category : #'instance creation' }
CRFBUser class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixPerson);
		name: (aDictionary at: #sFullName);
		isVirtual: (aDictionary at: #fVirtual);
		yourself
]

{ #category : #accessing }
CRFBUser >> isVirtual [
	^ isVirtual
]

{ #category : #accessing }
CRFBUser >> isVirtual: aBoolean [
	isVirtual := aBoolean
]
