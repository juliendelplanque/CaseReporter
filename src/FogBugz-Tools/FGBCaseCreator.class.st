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
		'categoriesDropList',
		'areasDropList',
		'milestonesDropList',
		'prioritiesDropList',
		'statusesDropList',
		'assignToDropList'
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
			newRow: [ :dropRow1 |
				dropRow1
					newColumn: #projectsDropList;
					newColumn: #areasDropList;
					newColumn: #milestonesDropList ] height: self inputTextHeight;
			newRow: [ :dropRow2 |
				dropRow2
					newColumn: #categoriesDropList;
					newColumn: #assignToDropList;
					newColumn: #statusesDropList ] height: self inputTextHeight;
			newRow: [ :mainRow |
				mainRow
					newColumn: [ :metadataColumn |
						metadataColumn
							newRow: #prioritiesDropList height: self inputTextHeight ];
					newColumn: [ :issueDescriptionColumn |
						issueDescriptionColumn
							newRow: #contentLabel height: self defaultFont height;
							newRow: #contentText ] ] ];
       yourself
]

{ #category : #adapting }
FGBCaseCreator >> adaptToClient: aFogBugzClient [
	| todo |
	todo := #(
		areas: listAreas
		categories: listCategories
		milestones: listMilestones
		priorities: listPriorities
		projects: listProjects
		statuses: listStatuses
		users: listPeople).
	UIManager default displayProgress: 'Fetching data from FogBugz' from: 0 to: todo size during: [ :bar |
		|i|
		i := 0.
		todo pairsDo: [ :mutator :accessor |
			bar
				current: (i := i + 1);
				title: ('Fetching data from FogBugz: {1}' format: { mutator allButLast }).
			self perform: mutator with: (accessor value: aFogBugzClient) ] ]
]

{ #category : #api }
FGBCaseCreator >> areas: aCollectionOfAreas [
	self areasDropList
		items: aCollectionOfAreas
]

{ #category : #accessing }
FGBCaseCreator >> areasDropList [
	^ areasDropList
]

{ #category : #accessing }
FGBCaseCreator >> assignToDropList [
	^ assignToDropList
]

{ #category : #api }
FGBCaseCreator >> categories: anOrderedCollectionOfString [
	self categoriesDropList
		items: anOrderedCollectionOfString
]

{ #category : #accessing }
FGBCaseCreator >> categoriesDropList [
	^ categoriesDropList
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
FGBCaseCreator >> initializeLabelledDropLists [
	areasDropList := self newLabelledDropList.
	areasDropList
		label: 'Area:' translated;
		displayBlock: [ :area | area name ].
	assignToDropList := self newLabelledDropList.
	assignToDropList
		label: 'Assign to:' translated;
		displayBlock: [ :user | user name ].
	categoriesDropList := self newLabelledDropList.
	categoriesDropList
		label: 'Category:' translated;
		displayBlock: [ :category | category name ].
	milestonesDropList := self newLabelledDropList.
	milestonesDropList
		label: 'Milestone:' translated;
		displayBlock: [ :milestone | milestone name ].
	prioritiesDropList := self newLabelledDropList.
	prioritiesDropList
		label: 'Priority:' translated;
		displayBlock: [ :priority | priority name ].
	projectsDropList := self newLabelledDropList.
	projectsDropList
		label: 'Project:' translated;
		displayBlock: [ :project | project name ].
	statusesDropList := self newLabelledDropList.
	statusesDropList
		label: 'Status:' translated;
		displayBlock: [ :status | status name ].
]

{ #category : #initialization }
FGBCaseCreator >> initializeWidgets [
	titleLabel := self newLabel.
	titleLabel label: 'Title:'.
	titleInput := self newTextInput.
	titleInput ghostText: 'Short title to describe the issue'.
	contentLabel := self newLabel.
	contentLabel label: 'Description:'.
	contentText := self newText.
	contentText text: self contentTemplate.
	self initializeLabelledDropLists
]

{ #category : #api }
FGBCaseCreator >> milestones: aCollectionOfMilestones [
	self milestonesDropList
		items: aCollectionOfMilestones
]

{ #category : #accessing }
FGBCaseCreator >> milestonesDropList [
	^ milestonesDropList
]

{ #category : #widgets }
FGBCaseCreator >> newLabelledDropList [
	^ self instantiate: FGBLabelledDropList
]

{ #category : #api }
FGBCaseCreator >> priorities: aCollectionOfPriorities [
	self prioritiesDropList
		items: aCollectionOfPriorities
]

{ #category : #accessing }
FGBCaseCreator >> prioritiesDropList [
	^ prioritiesDropList
]

{ #category : #api }
FGBCaseCreator >> projects: anOrderedCollectionOfString [
	self projectsDropList
		items: anOrderedCollectionOfString
]

{ #category : #accessing }
FGBCaseCreator >> projectsDropList [
	^ projectsDropList
]

{ #category : #api }
FGBCaseCreator >> statuses: aCollectionOfStatuses [
	self statusesDropList
		items: aCollectionOfStatuses
]

{ #category : #accessing }
FGBCaseCreator >> statusesDropList [
	^ statusesDropList
]

{ #category : #accessing }
FGBCaseCreator >> titleInput [
	^ titleInput
]

{ #category : #accessing }
FGBCaseCreator >> titleLabel [
	^ titleLabel
]

{ #category : #api }
FGBCaseCreator >> users: aCollectionOfUsers [
	self assignToDropList
		items: aCollectionOfUsers
]
