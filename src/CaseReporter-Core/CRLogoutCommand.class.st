"
Logout from Fogbugz
"
Class {
	#name : #CRLogoutCommand,
	#superclass : #CRTokenCommand,
	#category : #'CaseReporter-Core-Commands'
}

{ #category : #accessing }
CRLogoutCommand >> commandName [
	^ 'logoff'
]
