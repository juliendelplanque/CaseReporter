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
		'assignToDropList',
		'submitButton'
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
					addSplitter;
					newColumn: [ :issueDescriptionColumn |
						issueDescriptionColumn
							newRow: #contentLabel height: self defaultFont height;
							newRow: #contentText ] ];
			newRow: [ :submitRow |
				submitRow
					newColumn: #submitButton width: self buttonWidth ] height: self buttonHeight ];
       yourself
]

{ #category : #'instance creation' }
FGBCaseCreator class >> openForClient: aFogBugzClient withTemplate: aString [
	| caseCreator window |
	caseCreator := self new
						contentTemplate: aString;
						adaptToClient: aFogBugzClient;
						yourself.
	window := caseCreator openWithSpec.
	window
		extent: World extent * 0.65;
		centered.
	^ caseCreator
]

{ #category : #adapting }
FGBCaseCreator >> adaptToClient: aFogBugzClient [
	| todo |
	todo := #(
		areas: listAreas
		milestones: listMilestones
		priorities: listPriorities
		statuses: listStatuses
		users: listPeople
		projects: listProjects
		categories: listCategories).
	UIManager default displayProgress: 'Fetching data from FogBugz' from: 0 to: todo size during: [ :bar |
		|i|
		i := 0.
		todo pairsDo: [ :mutator :accessor |
			bar
				current: (i := i + 1);
				title: ('Fetching data from FogBugz: {1}' format: { mutator allButLast }).
			self perform: mutator with: (accessor value: aFogBugzClient) ] ].
	submitButton
		action: [ 
			[
				aFogBugzClient newCase: self asFogBugzCase.
				UIManager default inform: 'Case opened.'.
				self delete ]
				on: FGBInvalidInput
				do: [ :err | UIManager default alert: err messageText title: err class name ] ].
	self postAdaptationActions.
]

{ #category : #api }
FGBCaseCreator >> areaSelected [
	^ self areasDropList selectedItem
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

{ #category : #api }
FGBCaseCreator >> asFogBugzCase [
	self checkUserInputs.
	^ FogBugzCase new
		title: self caseTitle;
		content: self content;
		status: self statusSelected;
		project: self projectSelected;
		priority: self prioritySelected;
		milestone: self milestoneSelected;
		category: self categorySelected;
		assignee: self userSelected;
		area: self areaSelected;
		yourself
]

{ #category : #accessing }
FGBCaseCreator >> assignToDropList [
	^ assignToDropList
]

{ #category : #api }
FGBCaseCreator >> caseTitle [
	^ self titleInput text
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

{ #category : #api }
FGBCaseCreator >> categorySelected [
	^ self categoriesDropList selectedItem
]

{ #category : #checking }
FGBCaseCreator >> checkUserInputs [
	self title
		ifEmpty: [ FGBInvalidInput signal: 'The title of an issue can not be empty.' ].
		
	self content
		ifEmpty: [ FGBInvalidInput signal: 'The content of an issue can not be empty.' ]
]

{ #category : #api }
FGBCaseCreator >> content [
	^ self contentText text
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
FGBCaseCreator >> initializeAreasDropList [
	areasDropList := self newLabelledDropList.
	areasDropList
		label: 'Area:' translated;
		displayBlock: [ :area | area name ]
]

{ #category : #initialization }
FGBCaseCreator >> initializeAssignToDropList [
	assignToDropList := self newLabelledDropList.
	assignToDropList
		label: 'Assign to:' translated;
		displayBlock: [ :user | user name ]
]

{ #category : #initialization }
FGBCaseCreator >> initializeCategoriesDropList [
	categoriesDropList := self newLabelledDropList.
	categoriesDropList
		label: 'Category:' translated;
		displayBlock: [ :category | category name ];
		whenSelectedItemChanged: [ :category |
			"When category modified, filter statuses selectable and modify currently selected status to default status for the category."
			category ifNotNil: [
				self statusesDropList
					filteringBlock: [ :status | category id = status categoryId ];
					selectedItem: (self statusesDropList items detect: [ :status | status id = category defaultStatusIdWhenActive ]) ] ]
]

{ #category : #initialization }
FGBCaseCreator >> initializeLabelledDropLists [
	self
		initializeAreasDropList;
		initializeAssignToDropList;
		initializeMilestonesDropList;
		initializePrioritiesDropList;
		initializeStatusesDropList;
		initializeCategoriesDropList;
		initializeProjectsDropList
]

{ #category : #initialization }
FGBCaseCreator >> initializeMilestonesDropList [
	milestonesDropList := self newLabelledDropList.
	milestonesDropList
		label: 'Milestone:' translated;
		displayBlock: [ :milestone | milestone name ]
]

{ #category : #initialization }
FGBCaseCreator >> initializePrioritiesDropList [
	prioritiesDropList := self newLabelledDropList.
	prioritiesDropList
		label: 'Priority:' translated;
		displayBlock: [ :priority | priority name ]
]

{ #category : #initialization }
FGBCaseCreator >> initializeProjectsDropList [
	projectsDropList := self newLabelledDropList.
	projectsDropList
		label: 'Project:' translated;
		displayBlock: [ :project | project name ];
		whenSelectedItemChanged: [ :project |
			project ifNotNil: [ 
				"When project modified, set default assignee."
				assignToDropList
					selectedItem: (assignToDropList items detect: [ :user | user id = project defaultAssigneeId ]).
				"When project modified, filter areas valid for the selected project."
				areasDropList
					filteringBlock: [ :area | area projectId = project id ] ] ]
]

{ #category : #initialization }
FGBCaseCreator >> initializeStatusesDropList [
	statusesDropList := self newLabelledDropList.
	statusesDropList
		label: 'Status:' translated;
		displayBlock: [ :status | status name ]
]

{ #category : #initialization }
FGBCaseCreator >> initializeWidgets [
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
	self initializeLabelledDropLists.
	submitButton := self newButton.
	submitButton label: 'Submit'
]

{ #category : #api }
FGBCaseCreator >> milestoneSelected [
	^ self milestonesDropList selectedItem
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

{ #category : #adapting }
FGBCaseCreator >> postAdaptationActions [
	self prioritiesDropList
		setSelectedItem: (self priorities detect: #isDefault).
	
	self statusesDropList
		items: (self statusesDropList items sorted: [ :a :b | a orderIndex < b orderIndex ]).
		
	self projectsDropList
		selectedItem: self projectsDropList items first.
	self categoriesDropList
		selectedItem: self categoriesDropList items first.
]

{ #category : #api }
FGBCaseCreator >> priorities [
	^ self prioritiesDropList items
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
FGBCaseCreator >> prioritySelected [
	^ self prioritiesDropList selectedItem
]

{ #category : #api }
FGBCaseCreator >> projectSelected [
	^ self projectsDropList selectedItem
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
FGBCaseCreator >> statusSelected [
	^ self statusesDropList selectedItem
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
FGBCaseCreator >> submitButton [
	^ submitButton
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
FGBCaseCreator >> userSelected [
	^ self assignToDropList selectedItem
]

{ #category : #api }
FGBCaseCreator >> users: aCollectionOfUsers [
	self assignToDropList
		items: aCollectionOfUsers
]
