Trait {
	#name : #FBGCalypsoCommand,
	#category : #'FogBugz-Calypso'
}

{ #category : #accessing }
FBGCalypsoCommand classSide >> defaultMenuIconName [
	^ #warning
]

{ #category : #accessing }
FBGCalypsoCommand classSide >> defaultMenuItemName [
	^ 'Open case on Fogbugz'
]

{ #category : #accessing }
FBGCalypsoCommand classSide >> itemOrder [
	^ 20
]
