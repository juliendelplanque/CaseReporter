Class {
	#name : #FGBMilestone,
	#superclass : #FGBObject,
	#category : #'FogBugz-Core-Model'
}

{ #category : #'instance creation' }
FGBMilestone class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixFixFor);
		name: (aDictionary at: #sFixFor);
		yourself
]
