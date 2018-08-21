"
I am the widget allowing to describe a case to submit to fogBugz.

To try me:

[[[
	self example
]]]
"
Class {
	#name : #CRFBCaseCreatorPresenter,
	#superclass : #CRAbstractCaseCreatorPresenter,
	#instVars : [
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
	#category : #'CaseReporter-FogBugz-UI'
}

{ #category : #specs }
CRFBCaseCreatorPresenter class >> defaultSpec [
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
CRFBCaseCreatorPresenter class >> example [
	| client |
	client := [ CRClient getWorkingClientByAskingUser ] on: CRUserCancelledLogin do: [ "abort" ^ self ].
	^ self openForClient: client withTemplate: 'A custom template for issue description.'
]

{ #category : #'world menu' }
CRFBCaseCreatorPresenter class >> menuCommandOn: aBuilder [
	<worldMenu> 		 
		
	(aBuilder item: #'Case Reporter')	 	 
		action: [ self open ]; 
		parent: #Tools;
		icon: (Smalltalk ui iconNamed: #warning).
	aBuilder withSeparatorAfter.
]

{ #category : #'instance creation' }
CRFBCaseCreatorPresenter class >> open [
	<script>
	^ self openWithTemplate: ''
]

{ #category : #'instance creation' }
CRFBCaseCreatorPresenter class >> openForClient: aFogBugzClient withTemplate: aString [
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
CRFBCaseCreatorPresenter class >> openWithTemplate: aString [
	^ self openForClient: CRClient getWorkingClientByAskingUser withTemplate: aString
]

{ #category : #adapting }
CRFBCaseCreatorPresenter >> adaptToClient: aFogBugzClient [
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
				aFogBugzClient newCase: self asCase.
				UIManager default inform: 'Case opened.'.
				self delete ]
				on: CRInvalidInput
				do: [ :err | UIManager default alert: err messageText title: err class name ] ].
	self postAdaptationActions.
]

{ #category : #api }
CRFBCaseCreatorPresenter >> areaSelected [
	^ self areasDropList selectedItem
]

{ #category : #api }
CRFBCaseCreatorPresenter >> areas: aCollectionOfAreas [
	self areasDropList
		items: aCollectionOfAreas
]

{ #category : #accessing }
CRFBCaseCreatorPresenter >> areasDropList [
	^ areasDropList
]

{ #category : #api }
CRFBCaseCreatorPresenter >> asCase [
	self checkUserInputs.
	^ CRFBCase new
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
CRFBCaseCreatorPresenter >> assignToDropList [
	^ assignToDropList
]

{ #category : #api }
CRFBCaseCreatorPresenter >> categories: anOrderedCollectionOfString [
	self categoriesDropList
		items: anOrderedCollectionOfString
]

{ #category : #accessing }
CRFBCaseCreatorPresenter >> categoriesDropList [
	^ categoriesDropList
]

{ #category : #api }
CRFBCaseCreatorPresenter >> categorySelected [
	^ self categoriesDropList selectedItem
]

{ #category : #initialization }
CRFBCaseCreatorPresenter >> initializeAreasDropList [
	areasDropList := self newLabelledDropList.
	areasDropList
		label: 'Area:' translated;
		displayBlock: [ :area | area name ]
]

{ #category : #initialization }
CRFBCaseCreatorPresenter >> initializeAssignToDropList [
	assignToDropList := self newLabelledDropList.
	assignToDropList
		label: 'Assign to:' translated;
		displayBlock: [ :user | user name ]
]

{ #category : #initialization }
CRFBCaseCreatorPresenter >> initializeCategoriesDropList [
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
CRFBCaseCreatorPresenter >> initializeLabelledDropLists [
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
CRFBCaseCreatorPresenter >> initializeMilestonesDropList [
	milestonesDropList := self newLabelledDropList.
	milestonesDropList
		label: 'Milestone:' translated;
		displayBlock: [ :milestone | milestone name ]
]

{ #category : #initialization }
CRFBCaseCreatorPresenter >> initializePrioritiesDropList [
	prioritiesDropList := self newLabelledDropList.
	prioritiesDropList
		label: 'Priority:' translated;
		displayBlock: [ :priority | priority name ]
]

{ #category : #initialization }
CRFBCaseCreatorPresenter >> initializeProjectsDropList [
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
CRFBCaseCreatorPresenter >> initializeStatusesDropList [
	statusesDropList := self newLabelledDropList.
	statusesDropList
		label: 'Status:' translated;
		displayBlock: [ :status | status name ]
]

{ #category : #initialization }
CRFBCaseCreatorPresenter >> initializeWidgets [
	super initializeWidgets.
	self initializeLabelledDropLists.
]

{ #category : #api }
CRFBCaseCreatorPresenter >> milestoneSelected [
	^ self milestonesDropList selectedItem
]

{ #category : #api }
CRFBCaseCreatorPresenter >> milestones: aCollectionOfMilestones [
	self milestonesDropList
		items: aCollectionOfMilestones
]

{ #category : #accessing }
CRFBCaseCreatorPresenter >> milestonesDropList [
	^ milestonesDropList
]

{ #category : #adapting }
CRFBCaseCreatorPresenter >> postAdaptationActions [
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
CRFBCaseCreatorPresenter >> priorities [
	^ self prioritiesDropList items
]

{ #category : #api }
CRFBCaseCreatorPresenter >> priorities: aCollectionOfPriorities [
	self prioritiesDropList
		items: aCollectionOfPriorities
]

{ #category : #accessing }
CRFBCaseCreatorPresenter >> prioritiesDropList [
	^ prioritiesDropList
]

{ #category : #api }
CRFBCaseCreatorPresenter >> prioritySelected [
	^ self prioritiesDropList selectedItem
]

{ #category : #api }
CRFBCaseCreatorPresenter >> projectSelected [
	^ self projectsDropList selectedItem
]

{ #category : #api }
CRFBCaseCreatorPresenter >> projects: anOrderedCollectionOfString [
	self projectsDropList
		items: anOrderedCollectionOfString
]

{ #category : #accessing }
CRFBCaseCreatorPresenter >> projectsDropList [
	^ projectsDropList
]

{ #category : #api }
CRFBCaseCreatorPresenter >> statusSelected [
	^ self statusesDropList selectedItem
]

{ #category : #api }
CRFBCaseCreatorPresenter >> statuses: aCollectionOfStatuses [
	self statusesDropList
		items: aCollectionOfStatuses
]

{ #category : #accessing }
CRFBCaseCreatorPresenter >> statusesDropList [
	^ statusesDropList
]

{ #category : #api }
CRFBCaseCreatorPresenter >> userSelected [
	^ self assignToDropList selectedItem
]

{ #category : #api }
CRFBCaseCreatorPresenter >> users: aCollectionOfUsers [
	self assignToDropList
		items: aCollectionOfUsers
]
