Class {
	#name : #FGBStatus,
	#superclass : #FGBObject,
	#category : #'FogBugz-Core-Model'
}

{ #category : #'instance creation' }
FGBStatus class >> fromDictionary: aDictionary [
	^ self new
		id: (aDictionary at: #ixStatus);
		name: (aDictionary at: #sStatus);
		yourself
]
