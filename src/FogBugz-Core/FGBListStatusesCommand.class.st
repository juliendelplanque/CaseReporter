"
List statuses available.
"
Class {
	#name : #FGBListStatusesCommand,
	#superclass : #FGBTokenCommand,
	#category : #'FogBugz-Core-Commands'
}

{ #category : #accessing }
FGBListStatusesCommand >> commandName [
	^ 'listStatuses'
]
