Class {
	#name : #FGBCaseCreator,
	#superclass : #ComposablePresenter,
	#instVars : [
		'titleLabel',
		'titleInput',
		'contentLabel',
		'contentText',
		'contentTemplate',
		'projectsLabel',
		'projectsDropList',
		'categoriesLabel',
		'categoriesDropList'
	],
	#category : #'FogBugz-Tools-Dialogs'
}

{ #category : #specs }
FGBCaseCreator class >> defaultSpec [
  <spec: #default>

  ^ SpecLayout composed
      newColumn: [ :col |
        col
			newRow: #titleLabel height: self defaultFont height;
			newRow: #titleInput height: self inputTextHeight;
			newRow: [ :catRow |
				catRow
					newColumn: #categoriesLabel;
					newColumn: #categoriesDropList;
					newColumn: #projectsLabel;
					newColumn: #projectsDropList ] height: self inputTextHeight;
			newRow: #contentLabel height: self defaultFont height;
			newRow: #contentText ];
       yourself
]

{ #category : #adapting }
FGBCaseCreator >> adaptToClient: aFogBugzClient [
	self
		categories: aFogBugzClient listCategories;
		projects: aFogBugzClient listProjects
]

{ #category : #accessing }
FGBCaseCreator >> categories: anOrderedCollectionOfString [
	self categoriesDropList
		items: anOrderedCollectionOfString
]

{ #category : #accessing }
FGBCaseCreator >> categoriesDropList [
	^ categoriesDropList
]

{ #category : #accessing }
FGBCaseCreator >> categoriesLabel [
	^ categoriesLabel
]

{ #category : #accessing }
FGBCaseCreator >> contentLabel [
	^ contentLabel
]

{ #category : #accessing }
FGBCaseCreator >> contentTemplate [
	^ contentTemplate ifNil: [ contentTemplate := '' ]
]

{ #category : #accessing }
FGBCaseCreator >> contentTemplate: anObject [
	contentTemplate := anObject.
	contentText
		text: self contentTemplate
]

{ #category : #accessing }
FGBCaseCreator >> contentText [
	^ contentText
]

{ #category : #initialization }
FGBCaseCreator >> initialize [
	super initialize.
	self title: 'Open a case' translated
]

{ #category : #initialization }
FGBCaseCreator >> initializeWidgets [
	titleLabel := self newLabel.
	titleLabel label: 'Title:'.
	titleInput := self newTextInput.
	titleInput
		ghostText: 'Short title to describe the issue'.
	contentLabel := self newLabel.
	contentLabel label: 'Description:'.
	contentText := self newText.
	contentText
		text: self contentTemplate.
	projectsLabel := self newLabel.
	projectsLabel label: 'Project:'.
	projectsDropList := self newDropList.
	categoriesLabel := self newLabel.
	categoriesLabel label: 'Category:'.
	categoriesDropList := self newDropList.
]

{ #category : #accessing }
FGBCaseCreator >> projects: anOrderedCollectionOfString [
	self projectsDropList
		items: anOrderedCollectionOfString
]

{ #category : #accessing }
FGBCaseCreator >> projectsDropList [
	^ projectsDropList
]

{ #category : #accessing }
FGBCaseCreator >> projectsLabel [
	^ projectsLabel
]

{ #category : #accessing }
FGBCaseCreator >> titleInput [
	^ titleInput
]

{ #category : #accessing }
FGBCaseCreator >> titleLabel [
	^ titleLabel
]
