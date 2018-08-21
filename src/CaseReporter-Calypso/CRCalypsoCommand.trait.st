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
		CRCaseCreatorPresenter openWithTemplate: self issueTemplate
	] on: CRUserCancelledLogin do: [ 
		UIManager default inform: 'Log-in cancelled.'.
		^ self ].
]

{ #category : #accessing }
CRCalypsoCommand >> issueTemplate [
	^ self explicitRequirement
]
