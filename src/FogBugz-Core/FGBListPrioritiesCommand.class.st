"
List available priorities.
"
Class {
	#name : #FGBListPrioritiesCommand,
	#superclass : #FGBTokenCommand,
	#category : #'FogBugz-Core-Commands'
}

{ #category : #accessing }
FGBListPrioritiesCommand >> commandName [
	^ 'listPriorities'
]
