Extension { #name : #FGBClient }

{ #category : #'*FogBugz-Tools' }
FGBClient class >> getWorkingClientByAskingUser [
	"Return the default client if not nil, else interact with the user to get his login/password and create a working client."
	| potentialCredentials client |
	self default ifNotNil: [ ^ self default ].
	client := self default.
	potentialCredentials := nil.
	[ client isNil ] whileTrue: [
		potentialCredentials ifNil: [ potentialCredentials := FGBLoginDialogModel getCredentials ].
		potentialCredentials ifNil: [ FGBUserCancelledLogin signal ].
		[ client := self clientClass loginUser: potentialCredentials key password: potentialCredentials value.
		  self default: client ]
			on: Error
			do: [ :err |
				potentialCredentials := nil.
				UIManager default alert: err messageText title: 'Could not log into Fogbugz.' ] ].
	^ client
]
