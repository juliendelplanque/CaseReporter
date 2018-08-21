"
I model a user of the bugtracker.
"
Class {
	#name : #CRUser,
	#superclass : #CRObject,
	#instVars : [
		'isVirtual'
	],
	#category : #'CaseReporter-FogBugz-Model'
}

{ #category : #example }
CRUser class >> example [
	^ self new
		id: 8;
		name: 'John Doe';
		isVirtual: false;
		yourself
]

{ #category : #'instance creation' }
CRUser class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixPerson);
		name: (aDictionary at: #sFullName);
		isVirtual: (aDictionary at: #fVirtual);
		yourself
]

{ #category : #accessing }
CRUser >> isVirtual [
	^ isVirtual
]

{ #category : #accessing }
CRUser >> isVirtual: aBoolean [
	isVirtual := aBoolean
]
