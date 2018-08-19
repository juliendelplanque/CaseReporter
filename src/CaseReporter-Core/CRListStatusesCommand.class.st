"
List statuses available.
"
Class {
	#name : #CRListStatusesCommand,
	#superclass : #CRTokenCommand,
	#category : #'CaseReporter-Core-Commands'
}

{ #category : #accessing }
CRListStatusesCommand >> commandName [
	^ 'listStatuses'
]
