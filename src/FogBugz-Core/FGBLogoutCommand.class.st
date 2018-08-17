"
Logout from Fogbugz
"
Class {
	#name : #FGBLogoutCommand,
	#superclass : #FGBTokenCommand,
	#category : #'FogBugz-Core-Commands'
}

{ #category : #accessing }
FGBLogoutCommand >> commandName [
	^ 'logoff'
]
