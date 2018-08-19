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
