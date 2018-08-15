Class {
	#name : #FGBPriority,
	#superclass : #FGBObject,
	#category : #'FogBugz-Core-Model'
}

{ #category : #'instance creation' }
FGBPriority class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixPriority);
		name: (aDictionary at: #sPriority);
		yourself
]
