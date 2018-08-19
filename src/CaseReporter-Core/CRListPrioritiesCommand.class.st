"
List available priorities.
"
Class {
	#name : #CRListPrioritiesCommand,
	#superclass : #CRTokenCommand,
	#category : #'CaseReporter-Core-Commands'
}

{ #category : #accessing }
CRListPrioritiesCommand >> commandName [
	^ 'listPriorities'
]
