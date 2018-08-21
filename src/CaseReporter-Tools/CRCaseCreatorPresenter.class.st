"
I am the widget allowing to describe a case to submit to fogBugz.

To try me:

[[[
	self example
]]]
"
Class {
	#name : #CRCaseCreatorPresenter,
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
	#category : #'CaseReporter-Tools-Dialogs'
}

{ #category : #specs }
CRCaseCreatorPresenter class >> defaultSpec [
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
CRCaseCreatorPresenter class >> example [
	| client |
	client := [ CRClient getWorkingClientByAskingUser ] on: CRUserCancelledLogin do: [ "abort" ^ self ].
	^ self openForClient: client withTemplate: 'A custom template for issue description.'
]

{ #category : #'instance creation' }
CRCaseCreatorPresenter class >> open [
	<script>
	^ self openWithTemplate: ''
]

{ #category : #'instance creation' }
CRCaseCreatorPresenter class >> openForClient: aFogBugzClient withTemplate: aString [
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
CRCaseCreatorPresenter class >> openWithTemplate: aString [
	^ self openForClient: CRClient getWorkingClientByAskingUser withTemplate: aString
]

{ #category : #adapting }
CRCaseCreatorPresenter >> adaptToClient: aFogBugzClient [
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
				on: CRInvalidInput
				do: [ :err | UIManager default alert: err messageText title: err class name ] ].
	self postAdaptationActions.
]

{ #category : #api }
CRCaseCreatorPresenter >> areaSelected [
	^ self areasDropList selectedItem
]

{ #category : #api }
CRCaseCreatorPresenter >> areas: aCollectionOfAreas [
	self areasDropList
		items: aCollectionOfAreas
]

{ #category : #accessing }
CRCaseCreatorPresenter >> areasDropList [
	^ areasDropList
]

{ #category : #api }
CRCaseCreatorPresenter >> asFogBugzCase [
	self checkUserInputs.
	^ CRCase new
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
CRCaseCreatorPresenter >> assignToDropList [
	^ assignToDropList
]

{ #category : #api }
CRCaseCreatorPresenter >> caseTitle [
	^ self titleInput text
]

{ #category : #api }
CRCaseCreatorPresenter >> categories: anOrderedCollectionOfString [
	self categoriesDropList
		items: anOrderedCollectionOfString
]

{ #category : #accessing }
CRCaseCreatorPresenter >> categoriesDropList [
	^ categoriesDropList
]

{ #category : #api }
CRCaseCreatorPresenter >> categorySelected [
	^ self categoriesDropList selectedItem
]

{ #category : #checking }
CRCaseCreatorPresenter >> checkUserInputs [
	self title
		ifEmpty: [ CRInvalidInput signal: 'The title of an issue can not be empty.' ].
		
	self content
		ifEmpty: [ CRInvalidInput signal: 'The content of an issue can not be empty.' ]
]

{ #category : #api }
CRCaseCreatorPresenter >> content [
	^ self contentText text
]

{ #category : #accessing }
CRCaseCreatorPresenter >> contentLabel [
	^ contentLabel
]

{ #category : #accessing }
CRCaseCreatorPresenter >> contentTemplate [
	^ contentTemplate ifNil: [ contentTemplate := '' ]
]

{ #category : #accessing }
CRCaseCreatorPresenter >> contentTemplate: anObject [
	contentTemplate := anObject.
	contentText
		text: self contentTemplate
]

{ #category : #accessing }
CRCaseCreatorPresenter >> contentText [
	^ contentText
]

{ #category : #initialization }
CRCaseCreatorPresenter >> initialize [
	super initialize.
	self title: 'Open a case' translated
]

{ #category : #initialization }
CRCaseCreatorPresenter >> initializeAreasDropList [
	areasDropList := self newLabelledDropList.
	areasDropList
		label: 'Area:' translated;
		displayBlock: [ :area | area name ]
]

{ #category : #initialization }
CRCaseCreatorPresenter >> initializeAssignToDropList [
	assignToDropList := self newLabelledDropList.
	assignToDropList
		label: 'Assign to:' translated;
		displayBlock: [ :user | user name ]
]

{ #category : #initialization }
CRCaseCreatorPresenter >> initializeCategoriesDropList [
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
CRCaseCreatorPresenter >> initializeLabelledDropLists [
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
CRCaseCreatorPresenter >> initializeMilestonesDropList [
	milestonesDropList := self newLabelledDropList.
	milestonesDropList
		label: 'Milestone:' translated;
		displayBlock: [ :milestone | milestone name ]
]

{ #category : #initialization }
CRCaseCreatorPresenter >> initializePrioritiesDropList [
	prioritiesDropList := self newLabelledDropList.
	prioritiesDropList
		label: 'Priority:' translated;
		displayBlock: [ :priority | priority name ]
]

{ #category : #initialization }
CRCaseCreatorPresenter >> initializeProjectsDropList [
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
CRCaseCreatorPresenter >> initializeStatusesDropList [
	statusesDropList := self newLabelledDropList.
	statusesDropList
		label: 'Status:' translated;
		displayBlock: [ :status | status name ]
]

{ #category : #initialization }
CRCaseCreatorPresenter >> initializeWidgets [
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
CRCaseCreatorPresenter >> milestoneSelected [
	^ self milestonesDropList selectedItem
]

{ #category : #api }
CRCaseCreatorPresenter >> milestones: aCollectionOfMilestones [
	self milestonesDropList
		items: aCollectionOfMilestones
]

{ #category : #accessing }
CRCaseCreatorPresenter >> milestonesDropList [
	^ milestonesDropList
]

{ #category : #widgets }
CRCaseCreatorPresenter >> newLabelledDropList [
	^ self instantiate: CRLabelledDropListPresenter
]

{ #category : #adapting }
CRCaseCreatorPresenter >> postAdaptationActions [
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
CRCaseCreatorPresenter >> priorities [
	^ self prioritiesDropList items
]

{ #category : #api }
CRCaseCreatorPresenter >> priorities: aCollectionOfPriorities [
	self prioritiesDropList
		items: aCollectionOfPriorities
]

{ #category : #accessing }
CRCaseCreatorPresenter >> prioritiesDropList [
	^ prioritiesDropList
]

{ #category : #api }
CRCaseCreatorPresenter >> prioritySelected [
	^ self prioritiesDropList selectedItem
]

{ #category : #api }
CRCaseCreatorPresenter >> projectSelected [
	^ self projectsDropList selectedItem
]

{ #category : #api }
CRCaseCreatorPresenter >> projects: anOrderedCollectionOfString [
	self projectsDropList
		items: anOrderedCollectionOfString
]

{ #category : #accessing }
CRCaseCreatorPresenter >> projectsDropList [
	^ projectsDropList
]

{ #category : #api }
CRCaseCreatorPresenter >> statusSelected [
	^ self statusesDropList selectedItem
]

{ #category : #api }
CRCaseCreatorPresenter >> statuses: aCollectionOfStatuses [
	self statusesDropList
		items: aCollectionOfStatuses
]

{ #category : #accessing }
CRCaseCreatorPresenter >> statusesDropList [
	^ statusesDropList
]

{ #category : #accessing }
CRCaseCreatorPresenter >> submitButton [
	^ submitButton
]

{ #category : #accessing }
CRCaseCreatorPresenter >> titleInput [
	^ titleInput
]

{ #category : #accessing }
CRCaseCreatorPresenter >> titleLabel [
	^ titleLabel
]

{ #category : #api }
CRCaseCreatorPresenter >> userSelected [
	^ self assignToDropList selectedItem
]

{ #category : #api }
CRCaseCreatorPresenter >> users: aCollectionOfUsers [
	self assignToDropList
		items: aCollectionOfUsers
]
