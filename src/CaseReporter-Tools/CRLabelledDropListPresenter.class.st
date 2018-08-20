"
I am the combination of a label and drop list in a single widget.
"
Class {
	#name : #CRLabelledDropListPresenter,
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
CRLabelledDropListPresenter class >> defaultSpec [
  <spec: #default>

  ^ SpecLayout composed
      newRow: [ :row |
			row
				add: #label;
				add: #dropList ]
			
]

{ #category : #private }
CRLabelledDropListPresenter >> defaultFilteringBlock [
	"Filters nothing."
	^ [ :item | true ]
]

{ #category : #api }
CRLabelledDropListPresenter >> displayBlock: aBlock [
	self dropList
		displayBlock: aBlock
]

{ #category : #accessing }
CRLabelledDropListPresenter >> dropList [
	^ dropList
]

{ #category : #api }
CRLabelledDropListPresenter >> filteringBlock [
	^ filteringBlock
]

{ #category : #api }
CRLabelledDropListPresenter >> filteringBlock: anObject [
	filteringBlock := anObject.
	self items: items
]

{ #category : #initialization }
CRLabelledDropListPresenter >> initialize [
	super initialize.
	items := OrderedCollection new.
	self resetFilter.
]

{ #category : #initialization }
CRLabelledDropListPresenter >> initializeWidgets [
	label := self newLabel.
	dropList := self newDropList
]

{ #category : #api }
CRLabelledDropListPresenter >> items [
	^ items
]

{ #category : #api }
CRLabelledDropListPresenter >> items: aCollectionOfObjects [
	items := aCollectionOfObjects.
	self dropList
		items: (aCollectionOfObjects select: filteringBlock)
]

{ #category : #accessing }
CRLabelledDropListPresenter >> label [
	^ label
]

{ #category : #api }
CRLabelledDropListPresenter >> label: aString [
	self label
		label: aString
]

{ #category : #api }
CRLabelledDropListPresenter >> resetFilter [
	self filteringBlock: self defaultFilteringBlock
]

{ #category : #accessing }
CRLabelledDropListPresenter >> selectedItem [
	^ self dropList selectedItem
]

{ #category : #api }
CRLabelledDropListPresenter >> selectedItem: anObject [
	self dropList setSelectedItem: anObject
]

{ #category : #api }
CRLabelledDropListPresenter >> setSelectedItem: anObject [
	self dropList setSelectedItem: anObject
]

{ #category : #api }
CRLabelledDropListPresenter >> whenSelectedItemChanged: aBlockClosure [ 
	self dropList whenSelectedItemChanged: aBlockClosure 
]
