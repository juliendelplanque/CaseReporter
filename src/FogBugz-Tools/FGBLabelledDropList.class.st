"
I am the combination of a label and drop list in a single widget.
"
Class {
	#name : #FGBLabelledDropList,
	#superclass : #ComposablePresenter,
	#instVars : [
		'label',
		'dropList'
	],
	#category : #'FogBugz-Tools-Dialogs'
}

{ #category : #specs }
FGBLabelledDropList class >> defaultSpec [
  <spec: #default>

  ^ SpecLayout composed
      newRow: [ :row |
			row
				add: #label;
				add: #dropList ]
			
]

{ #category : #accessing }
FGBLabelledDropList >> displayBlock: aBlock [
	self dropList
		displayBlock: aBlock
]

{ #category : #accessing }
FGBLabelledDropList >> dropList [
	^ dropList
]

{ #category : #initialization }
FGBLabelledDropList >> initializeWidgets [
	label := self newLabel.
	dropList := self newDropList
]

{ #category : #accessing }
FGBLabelledDropList >> items: aCollectionOfObjects [
	self dropList
		items: aCollectionOfObjects
]

{ #category : #accessing }
FGBLabelledDropList >> label [
	^ label
]

{ #category : #accessing }
FGBLabelledDropList >> label: aString [
	self label
		label: aString
]
