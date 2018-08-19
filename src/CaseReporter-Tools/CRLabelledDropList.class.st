"
I am the combination of a label and drop list in a single widget.
"
Class {
	#name : #CRLabelledDropList,
	#superclass : #ComposablePresenter,
	#instVars : [
		'label',
		'dropList',
		'items',
		'filteringBlock'
	],
	#category : #'CaseReporter-Tools-Utilities'
}

{ #category : #specs }
CRLabelledDropList class >> defaultSpec [
  <spec: #default>

  ^ SpecLayout composed
      newRow: [ :row |
			row
				add: #label;
				add: #dropList ]
			
]

{ #category : #private }
CRLabelledDropList >> defaultFilteringBlock [
	"Filters nothing."
	^ [ :item | true ]
]

{ #category : #api }
CRLabelledDropList >> displayBlock: aBlock [
	self dropList
		displayBlock: aBlock
]

{ #category : #accessing }
CRLabelledDropList >> dropList [
	^ dropList
]

{ #category : #api }
CRLabelledDropList >> filteringBlock [
	^ filteringBlock
]

{ #category : #api }
CRLabelledDropList >> filteringBlock: anObject [
	filteringBlock := anObject.
	self items: items
]

{ #category : #initialization }
CRLabelledDropList >> initialize [
	super initialize.
	items := OrderedCollection new.
	self resetFilter.
]

{ #category : #initialization }
CRLabelledDropList >> initializeWidgets [
	label := self newLabel.
	dropList := self newDropList
]

{ #category : #api }
CRLabelledDropList >> items [
	^ items
]

{ #category : #api }
CRLabelledDropList >> items: aCollectionOfObjects [
	items := aCollectionOfObjects.
	self dropList
		items: (aCollectionOfObjects select: filteringBlock)
]

{ #category : #accessing }
CRLabelledDropList >> label [
	^ label
]

{ #category : #api }
CRLabelledDropList >> label: aString [
	self label
		label: aString
]

{ #category : #api }
CRLabelledDropList >> resetFilter [
	self filteringBlock: self defaultFilteringBlock
]

{ #category : #accessing }
CRLabelledDropList >> selectedItem [
	^ self dropList selectedItem
]

{ #category : #api }
CRLabelledDropList >> selectedItem: anObject [
	self dropList setSelectedItem: anObject
]

{ #category : #api }
CRLabelledDropList >> setSelectedItem: anObject [
	self dropList setSelectedItem: anObject
]

{ #category : #api }
CRLabelledDropList >> whenSelectedItemChanged: aBlockClosure [ 
	self dropList whenSelectedItemChanged: aBlockClosure 
]
