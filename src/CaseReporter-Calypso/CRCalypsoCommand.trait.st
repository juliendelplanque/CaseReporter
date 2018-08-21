"
Common behaviour for command allowing to open case.
"
Trait {
	#name : #CRCalypsoCommand,
	#category : #'CaseReporter-Calypso'
}

{ #category : #accessing }
CRCalypsoCommand classSide >> defaultMenuIconName [
	^ #warning
]

{ #category : #accessing }
CRCalypsoCommand classSide >> defaultMenuItemName [
	^ 'Open case on Fogbugz'
]

{ #category : #accessing }
CRCalypsoCommand classSide >> itemOrder [
	^ 20
]

{ #category : #execution }
CRCalypsoCommand >> execute [
	[ 
		CRClient getWorkingClientByAskingUser openCaseCreationUIWithTemplate: self issueTemplate
	] on: CRUserCancelledLogin do: [ 
		UIManager default inform: 'Log-in cancelled.' ].
]

{ #category : #accessing }
CRCalypsoCommand >> issueTemplate [
	^ self explicitRequirement
]
