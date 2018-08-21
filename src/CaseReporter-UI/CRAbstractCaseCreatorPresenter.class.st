"
I provide a basic presenter to let user desvribe a case.

Basically, I define that a case has a title and a description and I allow to set a template for the description of the case.
"
Class {
	#name : #CRAbstractCaseCreatorPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'titleInput',
		'titleLabel',
		'contentText',
		'contentTemplate',
		'contentLabel',
		'submitButton'
	],
	#category : #'CaseReporter-UI-Dialogs'
}

{ #category : #'instance creation' }
CRAbstractCaseCreatorPresenter class >> open [
	<script>
	^ self openWithTemplate: ''
]

{ #category : #'instance creation' }
CRAbstractCaseCreatorPresenter class >> openForClient: aFogBugzClient withTemplate: aString [
	| caseCreator window |
	caseCreator := self new
						contentTemplate: aString;
						adaptToClient: aFogBugzClient;
						yourself.
	window := caseCreator openWithSpec.
	window
		extent: World extent * 0.65;
		centered;
		whenClosedDo: [ aFogBugzClient logout ].
	^ caseCreator
]

{ #category : #'instance creation' }
CRAbstractCaseCreatorPresenter class >> openWithTemplate: aString [
	^ self openForClient: CRClient getWorkingClientByAskingUser withTemplate: aString
]

{ #category : #adapting }
CRAbstractCaseCreatorPresenter >> adaptToClient: aCRClient [
	"Perform all actions required to update the UI according to data provided by aCRClient."
	self subclassResponsibility
]

{ #category : #converting }
CRAbstractCaseCreatorPresenter >> asCase [
	"Returns a correct case instance modelling the case described by user in the UI."
	^ self subclassResponsibility
]

{ #category : #api }
CRAbstractCaseCreatorPresenter >> caseTitle [
	^ self titleInput text
]

{ #category : #checking }
CRAbstractCaseCreatorPresenter >> checkUserInputs [
	self title
		ifEmpty: [ CRInvalidInput signal: 'The title of an issue can not be empty.' ].
		
	self content
		ifEmpty: [ CRInvalidInput signal: 'The content of an issue can not be empty.' ]
]

{ #category : #api }
CRAbstractCaseCreatorPresenter >> content [
	^ self contentText text
]

{ #category : #accessing }
CRAbstractCaseCreatorPresenter >> contentLabel [
	^ contentLabel
]

{ #category : #accessing }
CRAbstractCaseCreatorPresenter >> contentTemplate [
	^ contentTemplate ifNil: [ contentTemplate := '' ]
]

{ #category : #accessing }
CRAbstractCaseCreatorPresenter >> contentTemplate: anObject [
	contentTemplate := anObject.
	contentText
		text: self contentTemplate
]

{ #category : #accessing }
CRAbstractCaseCreatorPresenter >> contentText [
	^ contentText
]

{ #category : #initialization }
CRAbstractCaseCreatorPresenter >> initialize [
	super initialize.
	self title: 'Open a case' translated
]

{ #category : #initialization }
CRAbstractCaseCreatorPresenter >> initializeWidgets [
	titleLabel := self newLabel.
	titleLabel label: 'Title:'.
	titleInput := self newTextInput.
	titleInput
		ghostText: 'Short title to describe the issue';
		autoAccept: true.
	contentLabel := self newLabel.
	contentLabel label: 'Description:'.
	contentText := self newText.
	contentText
		text: self contentTemplate;
		autoAccept: true.
	submitButton := self newButton.
	submitButton label: 'Submit'.
]

{ #category : #widgets }
CRAbstractCaseCreatorPresenter >> newLabelledDropList [
	^ self instantiate: CRLabelledDropListPresenter
]

{ #category : #accessing }
CRAbstractCaseCreatorPresenter >> submitButton [
	^ submitButton
]

{ #category : #accessing }
CRAbstractCaseCreatorPresenter >> titleInput [
	^ titleInput
]

{ #category : #accessing }
CRAbstractCaseCreatorPresenter >> titleLabel [
	^ titleLabel
]
