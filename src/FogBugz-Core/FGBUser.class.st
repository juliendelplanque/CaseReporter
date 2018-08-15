Class {
	#name : #FGBUser,
	#superclass : #FGBObject,
	#category : #'FogBugz-Core-Model'
}

{ #category : #'instance creation' }
FGBUser class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixPerson);
		name: (aDictionary at: #sFullName);
		yourself
]
