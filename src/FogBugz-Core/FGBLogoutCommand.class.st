"
Logout from Fogbugz
"
Class {
	#name : #FGBLogoutCommand,
	#superclass : #FGBTokenCommand,
	#category : #'FogBugz-Core-Commands'
}

{ #category : #filling }
FGBLogoutCommand >> fillPostContentDictionary: aDictionary [
	super fillPostContentDictionary: aDictionary.
	aDictionary
		at: 'cmd' put: 'logoff'
]
