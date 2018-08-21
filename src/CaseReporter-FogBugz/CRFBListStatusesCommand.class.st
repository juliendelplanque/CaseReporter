"
List statuses available.
"
Class {
	#name : #CRFBListStatusesCommand,
	#superclass : #CRFBTokenCommand,
	#category : #'CaseReporter-FogBugz-Commands'
}

{ #category : #accessing }
CRFBListStatusesCommand >> commandName [
	^ 'listStatuses'
]
