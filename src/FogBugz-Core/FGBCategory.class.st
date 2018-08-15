Class {
	#name : #FGBCategory,
	#superclass : #FGBObject,
	#category : #'FogBugz-Core-Model'
}

{ #category : #'instance creation' }
FGBCategory class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixCategory);
		name: (aDictionary at: #sCategory);
		yourself
]
