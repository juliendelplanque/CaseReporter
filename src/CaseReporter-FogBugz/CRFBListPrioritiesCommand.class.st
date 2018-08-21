"
List available priorities.
"
Class {
	#name : #CRFBListPrioritiesCommand,
	#superclass : #CRFBTokenCommand,
	#category : #'CaseReporter-FogBugz-Commands'
}

{ #category : #accessing }
CRFBListPrioritiesCommand >> commandName [
	^ 'listPriorities'
]
