"
List areas available.
"
Class {
	#name : #FGBListAreasCommand,
	#superclass : #FGBTokenCommand,
	#category : #'FogBugz-Core-Commands'
}

{ #category : #filling }
FGBListAreasCommand >> fillPostContentDictionary: aDictionary [
	super fillPostContentDictionary: aDictionary.
	aDictionary
		at: 'cmd' put: 'listAreas'
]
