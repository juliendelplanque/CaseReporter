"
Logout from Fogbugz
"
Class {
	#name : #CRLogoutCommand,
	#superclass : #CRTokenCommand,
	#category : #'CaseReporter-FogBugz-Commands'
}

{ #category : #accessing }
CRLogoutCommand >> commandName [
	^ 'logoff'
]
