Extension { #name : #FGBClient }

{ #category : #'*FogBugz-Calypso' }
FGBClient class >> getWorkingClientByAskingUser [
	| potentialCredentials client |
	client := nil.
	potentialCredentials := FGBClient credentials.
	[ client isNil ] whileTrue: [
		potentialCredentials ifNil: [ potentialCredentials := FGBLoginDialogModel getCredentials ].
		potentialCredentials ifNil: [ FGBUserCancelledLogin signal ].
		[ client := FGBClient loginUser: potentialCredentials key password: potentialCredentials value.
		  FGBClient credentials: potentialCredentials ]
			on: Error
			do: [ :err |
				potentialCredentials := nil.
				UIManager default alert: err messageText title: 'Could not log into Fogbugz.' ] ].
	^ client
]
