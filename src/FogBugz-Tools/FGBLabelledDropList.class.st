"
I am the combination of a label and drop list in a single widget.
"
Class {
	#name : #FGBLabelledDropList,
	#superclass : #ComposablePresenter,
	#instVars : [
		'label',
		'dropList',
		'items',
		'filteringBlock'
	],
	#category : #'FogBugz-Tools-Utilities'
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

{ #category : #private }
FGBLabelledDropList >> defaultFilteringBlock [
	"Filters nothing."
	^ [ :item | true ]
]

{ #category : #api }
FGBLabelledDropList >> displayBlock: aBlock [
	self dropList
		displayBlock: aBlock
]

{ #category : #accessing }
FGBLabelledDropList >> dropList [
	^ dropList
]

{ #category : #api }
FGBLabelledDropList >> filteringBlock [
	^ filteringBlock
]

{ #category : #api }
FGBLabelledDropList >> filteringBlock: anObject [
	filteringBlock := anObject.
	self items: items
]

{ #category : #initialization }
FGBLabelledDropList >> initialize [
	super initialize.
	items := OrderedCollection new.
	self resetFilter.
]

{ #category : #initialization }
FGBLabelledDropList >> initializeWidgets [
	label := self newLabel.
	dropList := self newDropList
]

{ #category : #api }
FGBLabelledDropList >> items [
	^ items
]

{ #category : #api }
FGBLabelledDropList >> items: aCollectionOfObjects [
	items := aCollectionOfObjects.
	self dropList
		items: (aCollectionOfObjects select: filteringBlock)
]

{ #category : #accessing }
FGBLabelledDropList >> label [
	^ label
]

{ #category : #api }
FGBLabelledDropList >> label: aString [
	self label
		label: aString
]

{ #category : #api }
FGBLabelledDropList >> resetFilter [
	self filteringBlock: self defaultFilteringBlock
]

{ #category : #accessing }
FGBLabelledDropList >> selectedItem [
	^ self dropList selectedItem
]

{ #category : #api }
FGBLabelledDropList >> selectedItem: anObject [
	self dropList setSelectedItem: anObject
]

{ #category : #api }
FGBLabelledDropList >> setSelectedItem: anObject [
	self dropList setSelectedItem: anObject
]

{ #category : #api }
FGBLabelledDropList >> whenSelectedItemChanged: aBlockClosure [ 
	self dropList whenSelectedItemChanged: aBlockClosure 
]
