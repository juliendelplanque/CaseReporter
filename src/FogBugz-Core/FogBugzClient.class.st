"
A client for Pharo Fogbugz issue server.

https://pharo.fogbugz.com/f/

See class side example methods
"
Class {
	#name : #FogBugzClient,
	#superclass : #Object,
	#instVars : [
		'token',
		'errors'
	],
	#category : #'FogBugz-Core-Base'
}

{ #category : #examples }
FogBugzClient class >> example [
	
	|client|
	client := FogBugzClient loginUser: 'abc@def.com' password: 'secret'.
	(client query: 'UFFI') inspect.
	client logout
]

{ #category : #'instance creation' }
FogBugzClient class >> loginUser: email password: password [

	^(self new)
		login: email password: password;
		yourself
]

{ #category : #'private - accessing' }
FogBugzClient >> errors [

	^errors 
]

{ #category : #'private - utilities' }
FogBugzClient >> executeCommand: aCommand [
	errors := nil.
	aCommand requiresSession ifTrue: [ 
		aCommand token: token ].
	^ STON
		fromString:
			(ZnClient new
				post: self jsonAPILocation
				contents: aCommand printString)
]

{ #category : #testing }
FogBugzClient >> isLoggedIn [

	^token notNil
]

{ #category : #'private - accessing' }
FogBugzClient >> jsonAPILocation [
	^'https://pharo.fogbugz.com/f/api/0/jsonapi'
]

{ #category : #interacting }
FogBugzClient >> listAreas [
	| rawResult |
	rawResult := self executeCommand: (FGBListAreasCommand new).

	(rawResult at: #errorCode) ifNil: [
		(rawResult at: #data) ifNotEmpty: [ :data |
			^ (data at: #areas) 
				collect: [ :each | FGBArea fromDictionary: each ]]].
	^ #()
]

{ #category : #interacting }
FogBugzClient >> listCategories [
	| rawResult |
	rawResult := self executeCommand: (FGBListCategoriesCommand new).

	(rawResult at: #errorCode) ifNil: [
		(rawResult at: #data) ifNotEmpty: [ :data |
			^ (data at: #categories) 
				collect: [ :each | FGBCategory fromDictionary: each ]]].
	^ #()
]

{ #category : #interacting }
FogBugzClient >> listMilestones [
	| rawResult |
	rawResult := self executeCommand: (FGBListMilestonesCommand new).
	
	(rawResult at: #errorCode) ifNil: [
		(rawResult at: #data) ifNotEmpty: [ :data |
			^ (data at: #fixfors) 
				collect: [ :each | FGBMilestone fromDictionary: each ]]].
	^ #()
]

{ #category : #interacting }
FogBugzClient >> listPeople [
	| rawResult |
	rawResult := self executeCommand: (FGBListPeopleCommand new).

	(rawResult at: #errorCode) ifNil: [
		(rawResult at: #data) ifNotEmpty: [ :data |
			^ (data at: #people) 
				collect: [ :each | FGBUser fromDictionary: each ]]].
	^ #()
]

{ #category : #interacting }
FogBugzClient >> listPriorities [
	| rawResult |
	rawResult := self executeCommand: (FGBListPrioritiesCommand new).

	(rawResult at: #errorCode) ifNil: [
		(rawResult at: #data) ifNotEmpty: [ :data |
			^ (data at: #priorities) 
				collect: [ :each | FGBPriority fromDictionary: each ]]].
	^ #()
]

{ #category : #interacting }
FogBugzClient >> listProjects [
	| rawResult |
	rawResult := self executeCommand: (FGBListProjectsCommand new).

	(rawResult at: #errorCode) ifNil: [
		(rawResult at: #data) ifNotEmpty: [ :data |
			^ (data at: #projects) 
				collect: [ :each | FGBProject fromDictionary: each ]]].
	^ #()
]

{ #category : #interacting }
FogBugzClient >> listStatuses [
	| rawResult |
	rawResult := self executeCommand: (FGBListStatusesCommand new).

	(rawResult at: #errorCode) ifNil: [
		(rawResult at: #data) ifNotEmpty: [ :data |
			^ (data at: #statuses) 
				collect: [ :each | FGBStatus fromDictionary: each ]]].
	^ #()
]

{ #category : #private }
FogBugzClient >> login: email password: password [
	| ston |
	ston := self
		executeCommand: (FGBLoginCommand loginUser: email password: password).
	(ston at: #data)
		ifEmpty: [ self readErrorsFrom: ston ]
		ifNotEmpty: [ :x | token := x at: #token ]
]

{ #category : #authentication }
FogBugzClient >> logout [

	| res |
	res := self executeCommand: FGBLogoutCommand new.
	(res at: #errorCode) isNil ifTrue: [token := nil. ^self].
	self readErrorsFrom: res
]

{ #category : #interacting }
FogBugzClient >> newCase: aFogBugzCase [
	| rawResult |
	rawResult := self executeCommand: (
							FGBNewCaseCommand new
									case: aFogBugzCase;
									yourself).
	(rawResult at: #errorCode)
		ifNil: [ ^ self ].
	
	self error: ((rawResult at: #errors) first at: #message)
]

{ #category : #interacting }
FogBugzClient >> query: aString [

	| res |
	res := self executeCommand: (FGBSearchCommand query: aString).
   (res at: #errorCode) ifNil: [
		(res at: #data) ifNotEmpty: [:c |
			^(c at: #cases) 
				collect: [:each | FogBugzCase fromDictionary: each ]]].
	^#()
]

{ #category : #'private - utilities' }
FogBugzClient >> readErrorsFrom: ston [
	errors := (ston at: #errors) collect: [ :each | each at: #message ]
]

{ #category : #accessing }
FogBugzClient >> summarizedErrors [

	^String streamContents: [:s | 
		self errors do: [:each | s nextPutAll: each; cr ]	]
]
