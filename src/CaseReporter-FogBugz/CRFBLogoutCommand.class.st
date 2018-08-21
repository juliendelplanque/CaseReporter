"
Logout from Fogbugz
"
Class {
	#name : #CRFBLogoutCommand,
	#superclass : #CRFBTokenCommand,
	#category : #'CaseReporter-FogBugz-Commands'
}

{ #category : #accessing }
CRFBLogoutCommand >> commandName [
	^ 'logoff'
]
