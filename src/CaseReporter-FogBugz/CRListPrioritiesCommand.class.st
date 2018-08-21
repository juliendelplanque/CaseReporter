"
List available priorities.
"
Class {
	#name : #CRListPrioritiesCommand,
	#superclass : #CRTokenCommand,
	#category : #'CaseReporter-FogBugz-Commands'
}

{ #category : #accessing }
CRListPrioritiesCommand >> commandName [
	^ 'listPriorities'
]
