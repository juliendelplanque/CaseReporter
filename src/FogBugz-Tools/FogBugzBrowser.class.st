"
A browser for Fogbugz cases
"
Class {
	#name : #FogBugzBrowser,
	#superclass : #ComposablePresenter,
	#instVars : [
		'client',
		'casesModel',
		'toolBar',
		'mainMenu',
		'statusBar',
		'casesSearchField'
	],
	#category : #'FogBugz-Tools-UI'
}

{ #category : #spec }
FogBugzBrowser class >> contentSpec [
	<spec>
	| searchBarOffset delta |
	searchBarOffset := 5 + StandardFonts defaultFont height + 10.
	delta := 25.
	^SpecLayout composed 
		add: #casesModel origin: 0@0 corner: 1@1 offsetOrigin: 0@searchBarOffset offsetCorner: 0@0;
		add: #caseSearchField origin: 0@0 corner: 1@0 offsetOrigin: 0@0 offsetCorner: 0@searchBarOffset
]

{ #category : #spec }
FogBugzBrowser class >> defaultSpec [
	<spec>
	^ SpecLayout composed
		add: #mainMenu
			origin: 0 @ 0
			corner: 1 @ 0
			offsetOrigin: 0 @ 0
			offsetCorner: 0 @ self toolbarHeight;
		add: #toolBar
			origin: 0 @ 0
			corner: 1 @ 0
			offsetOrigin: 0 @ self toolbarHeight
			offsetCorner: 0 @ (self toolbarHeight + (self toolbarHeight + 4));
		add: #statusBar
			origin: 0 @ 1
			corner: 1 @ 1
			offsetOrigin: 0 @ (0 - self statusBarHeight)
			offsetCorner: 0 @ 0;
		add: self contentSpec
			origin: 0 @ 0
			corner: 1 @ 1
			offsetOrigin: 0 @ (self toolbarHeight + (self toolbarHeight + 4))
			offsetCorner: 0 @ (0 - self statusBarHeight);
		yourself
]

{ #category : #accessing }
FogBugzBrowser class >> icon [

	^FGBIconCache fogBugzIcon
]

{ #category : #menu }
FogBugzBrowser class >> menuCommandOn: aBuilder [
	<worldMenu> 		 
		
	(aBuilder item: #'FogBugz Browser')	 	 
		action: [ self open ]; 
		icon: self icon.
	aBuilder withSeparatorAfter.		
]

{ #category : #'instance creation' }
FogBugzBrowser class >> open [
	<script>
	
	(self basicNew)	 
		initialize;
		openWithSpec 
]

{ #category : #defaults }
FogBugzBrowser class >> statusBarHeight [

	^ StandardFonts defaultFont height + 2
]

{ #category : #'private - actions' }
FogBugzBrowser >> browseCase [
	casesModel selectedItem ifNotNil: [ :case | WebBrowser openOn: case asURL ]
]

{ #category : #'private - events' }
FogBugzBrowser >> caseSearchAccept: aString [ 
	| cases |
	client ifNil: [ ^self ].
	self casesModel items: OrderedCollection new.
	World doOneCycle.
	UIManager default showWaitCursorWhile: [ 
	cases := (client query: aString) asSortedCollection ].
	self casesModel items: cases.
	self statusBar label: cases size asString, ' found'
]

{ #category : #'private - accessing' }
FogBugzBrowser >> caseSearchField [
	
	^casesSearchField
]

{ #category : #'private - initialization' }
FogBugzBrowser >> casesListMenu: aMenu [ 

	casesModel selectedItem ifNil: [ ^nil ].
	aMenu target: self.
	aMenu addTitle:  'Case'.
	aMenu add: 'Browse online' selector: #browseCase.
	^aMenu
]

{ #category : #'private - accessing' }
FogBugzBrowser >> casesModel [

	^casesModel
]

{ #category : #'private - accessing' }
FogBugzBrowser >> casesModel: anObject [
	casesModel := anObject
]

{ #category : #'private - accessing' }
FogBugzBrowser >> iconProvider [

	^FGBIconCache 
]

{ #category : #'private - initialization menues' }
FogBugzBrowser >> initalFogBugzMenu [
	|builder|
	builder := FGBMenuBuilder new.
	builder
		addItem: 'Login'
		icon: self iconProvider fogBugzLoginIcon 
		action: [ self login ].
	builder
		addItem: 'Logout'
		icon: self iconProvider fogBugzLogoutIcon 
		action: [ self logout ].	
	^builder menu	
]

{ #category : #'private - initialization menues' }
FogBugzBrowser >> initalQueryMenu [
	|builder|
	builder := FGBMenuBuilder new.
	builder
		addItem: 'Search'
		icon: self iconProvider fogBugzSearchIcon 
		action: [ self search ].
	^builder menu	
]

{ #category : #initialization }
FogBugzBrowser >> initialExtent [

	^530@360
]

{ #category : #'private - initialization' }
FogBugzBrowser >> initializeCasesModel [
		
	casesModel := self instantiate: IconListModel.
	casesModel 
 		items: SortedCollection new;
		displayBlock: [ :case | case printString ];
		icons: [:user |  self iconProvider fogBugzIcon ];
		menu: [:menu | self casesListMenu: menu ]
]

{ #category : #'private - initialization' }
FogBugzBrowser >> initializeMainMenu [

	| builder |
	mainMenu := MenuModel new.
	builder := FGBMenuBuilder forMenu: mainMenu.
	builder addItem: 'FogBugz' icon: nil subMenu: self initalFogBugzMenu.
	builder addItem: 'Query' icon: nil subMenu: self initalQueryMenu.						
	"builder addItem: 'Help' icon: nil subMenu: self initalHelpMenu.	"	
]

{ #category : #'private - initialization' }
FogBugzBrowser >> initializeSearchField [

	casesSearchField := SearchMorph new
								model: self;
								acceptSelector: #caseSearchAccept:; 		 
								searchList: OrderedCollection new;
								asSpecAdapter
]

{ #category : #'private - initialization' }
FogBugzBrowser >> initializeStatusBar [
	statusBar := LabelModel new.
	self statusBar 
		color: Color gray;
		label: 'Ready'
]

{ #category : #'private - initialization' }
FogBugzBrowser >> initializeToolBar [

	toolBar := MenuModel new
		addGroup: [ :group |			 
			group addItem: [ :item |
				item
					name: nil;
					description: 'Login';
					icon: (self iconProvider fogBugzLoginIcon);
					action: [ self login ] ].
			group addItem: [ :item |
				item
					name: nil;
					description: 'Logout';
					icon: (self iconProvider fogBugzLogoutIcon);
					action: [ self logout ] ].	
			group addItem: [ :item |
				item
					name: nil;
					description: 'Search';
					icon: (self iconProvider fogBugzSearchIcon);
					action: [ self search ] ].	
					
			 
		 
		].
		
	toolBar applyTo: self.
]

{ #category : #'private - initialization' }
FogBugzBrowser >> initializeWidgets [
	self 
		initializeMainMenu; 		
		initializeToolBar;
		initializeStatusBar;
		initializeSearchField;
		initializeCasesModel

]

{ #category : #'private - actions' }
FogBugzBrowser >> login [

	|cr fog|
	cr :=	FGBLoginDialogModel getCredentials.
	cr ifNil: [ ^self ].
	fog := FogBugzClient loginUser: cr key password: cr value.
	fog isLoggedIn 
		ifTrue: [ client := fog.
			self statusBar label: 'Connected' ]
		ifFalse: [ self inform: fog summarizedErrors ]
]

{ #category : #'private - actions' }
FogBugzBrowser >> logout [
	client ifNotNil: [ 
		client logout.
		self casesModel items: OrderedCollection new.
		self statusBar label: 'Ready'. 
		client := nil. ].
]

{ #category : #accessing }
FogBugzBrowser >> mainMenu [
	^ mainMenu
]

{ #category : #accessing }
FogBugzBrowser >> mainMenu: anObject [
	mainMenu := anObject
]

{ #category : #'private - actions' }
FogBugzBrowser >> search [

	self caseSearchAccept: self caseSearchField widget searchString
]

{ #category : #accessing }
FogBugzBrowser >> statusBar [
	^ statusBar
]

{ #category : #accessing }
FogBugzBrowser >> statusBar: anObject [
	statusBar := anObject
]

{ #category : #accessing }
FogBugzBrowser >> taskbarIcon [

	^self class icon
]

{ #category : #accessing }
FogBugzBrowser >> title [

	^'FogBugz Browser'
]

{ #category : #'private - accessing' }
FogBugzBrowser >> toolBar [
	^ toolBar
]

{ #category : #'private - accessing' }
FogBugzBrowser >> toolBar: anObject [
	toolBar := anObject
]
