Class {
	#name : #FGBProject,
	#superclass : #FGBObject,
	#category : #'FogBugz-Core-Model'
}

{ #category : #'instance creation' }
FGBProject class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixProject);
		name: (aDictionary at: #sProject);
		yourself
]
