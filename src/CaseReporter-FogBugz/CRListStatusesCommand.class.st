"
List statuses available.
"
Class {
	#name : #CRListStatusesCommand,
	#superclass : #CRTokenCommand,
	#category : #'CaseReporter-FogBugz-Commands'
}

{ #category : #accessing }
CRListStatusesCommand >> commandName [
	^ 'listStatuses'
]
