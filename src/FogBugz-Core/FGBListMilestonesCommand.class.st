"
List milestones available.
"
Class {
	#name : #FGBListMilestonesCommand,
	#superclass : #FGBTokenCommand,
	#category : #'FogBugz-Core-Commands'
}

{ #category : #filling }
FGBListMilestonesCommand >> fillPostContentDictionary: aDictionary [
	super fillPostContentDictionary: aDictionary.
	aDictionary
		at: 'cmd' put: 'listFixFors'
]
