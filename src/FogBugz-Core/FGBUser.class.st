Class {
	#name : #FGBUser,
	#superclass : #FGBObject,
	#instVars : [
		'isVirtual'
	],
	#category : #'FogBugz-Core-Model'
}

{ #category : #example }
FGBUser class >> example [
	^ self new
		id: 8;
		name: 'John Doe';
		isVirtual: false;
		yourself
]

{ #category : #'instance creation' }
FGBUser class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixPerson);
		name: (aDictionary at: #sFullName);
		isVirtual: (aDictionary at: #fVirtual);
		yourself
]

{ #category : #accessing }
FGBUser >> isVirtual [
	^ isVirtual
]

{ #category : #accessing }
FGBUser >> isVirtual: aBoolean [
	isVirtual := aBoolean
]
