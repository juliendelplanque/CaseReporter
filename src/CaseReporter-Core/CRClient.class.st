"
A client for Pharo Fogbugz issue server.

https://pharo.fogbugz.com/f/

See class side example methods
"
Class {
	#name : #CRClient,
	#superclass : #Object,
	#instVars : [
		'token',
		'jsonAPILocation'
	],
	#classInstVars : [
		'default'
	],
	#category : #'CaseReporter-Core-Client'
}

{ #category : #accessing }
CRClient class >> clientClass [
	^ CRCachedClient
]

{ #category : #accessing }
CRClient class >> default [
	^ default
]

{ #category : #accessing }
CRClient class >> default: anObject [
	default := anObject
]

{ #category : #examples }
CRClient class >> example [
	
	|client|
	client := CRClient loginUser: 'abc@def.com' password: 'secret'.
	(client query: 'UFFI') inspect.
	client logout
]

{ #category : #'instance creation' }
CRClient class >> login: aCredentials [

	^(self new)
		login: aCredentials;
		yourself
]

{ #category : #'instance creation' }
CRClient class >> loginUser: email password: password [

	^(self new)
		login: email password: password;
		yourself
]

{ #category : #accessing }
CRClient class >> pharoJSONAPILocation [
	^ 'https://pharo.fogbugz.com/f/api/0/jsonapi'
]

{ #category : #reset }
CRClient class >> reset [
	<script>
	self default: nil
]

{ #category : #'private - utilities' }
CRClient >> executeCommand: aCommand [
	aCommand requiresSession ifTrue: [ 
		aCommand token: token ].
	^ STON
		fromString:
			(ZnClient new
				post: self jsonAPILocation
				contents: aCommand asPostContentJSON)
]

{ #category : #'private - utilities' }
CRClient >> handleErrorsIn: aDictionary [
	(aDictionary at: #errors)
		ifNotEmpty: [ :rawErrors |
			CRErrorsList new
				errors: (rawErrors collect: [ :each |
								Error new
									messageText: (each at: #message);
									yourself ]);
				signal ]
]

{ #category : #testing }
CRClient >> isLoggedIn [

	^token notNil
]

{ #category : #accessing }
CRClient >> jsonAPILocation [
	^ jsonAPILocation ifNil: [ jsonAPILocation := self class pharoJSONAPILocation ]
]

{ #category : #accessing }
CRClient >> jsonAPILocation: anObject [
	jsonAPILocation := anObject
]

{ #category : #interacting }
CRClient >> listAreas [
	<crWidget: #LabelledDropList position: 2 named: 'Area:'>
	| rawResult |
	rawResult := self executeCommand: (CRListAreasCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
		(data at: #areas) 
				collect: [ :each | CRArea fromDictionary: each ] ]
]

{ #category : #interacting }
CRClient >> listCategories [
	<crWidget: #LabelledDropList position: 4 named: 'Category:'>
	| rawResult |
	rawResult := self executeCommand: (CRListCategoriesCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
			(data at: #categories) 
				collect: [ :each | CRCategory fromDictionary: each ]]
]

{ #category : #interacting }
CRClient >> listMilestones [
	<crWidget: #LabelledDropList position: 3 named: 'Milestone:'>
	| rawResult |
	rawResult := self executeCommand: (CRListMilestonesCommand new).
	
	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	^ (rawResult at: #data) ifNotEmpty: [ :data |
			(data at: #fixfors)
				collect: [ :each | CRMilestone fromDictionary: each ]]
]

{ #category : #interacting }
CRClient >> listPeople [
	<crWidget: #LabelledDropList position: 4 named: 'Assign to:'>
	| rawResult |
	rawResult := self executeCommand: (CRListPeopleCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
			(data at: #people) 
				collect: [ :each | CRUser fromDictionary: each ]]
]

{ #category : #interacting }
CRClient >> listPriorities [
	<crWidget: #LabelledDropList position: 7 named: 'Priority:'>
	| rawResult |
	rawResult := self executeCommand: (CRListPrioritiesCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
			(data at: #priorities) 
				collect: [ :each | CRPriority fromDictionary: each ]]
]

{ #category : #interacting }
CRClient >> listProjects [
	<crWidget: #LabelledDropList position: 1 named: 'Project'>
	| rawResult |
	rawResult := self executeCommand: (CRListProjectsCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
		(data at: #projects) 
			collect: [ :each | CRProject fromDictionary: each ] ].
]

{ #category : #interacting }
CRClient >> listStatuses [
	<crWidget: #LabelledDropList position: 5 named: 'Status:'>
	| rawResult |
	rawResult := self executeCommand: (CRListStatusesCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
		(data at: #statuses) 
			collect: [ :each | CRStatus fromDictionary: each ]].
]

{ #category : #authentication }
CRClient >> login: aCredential [
	^ self login: aCredential login password: aCredential password
]

{ #category : #authentication }
CRClient >> login: email password: password [
	| rawResult |
	rawResult := self
		executeCommand: (CRLoginCommand loginUser: email password: password).
	(rawResult at: #errorCode)
		ifNotNil: [ self handleErrorsIn: rawResult ].
		
	(rawResult at: #data)
		ifEmpty: [ self error: 'Unexpected error, empty data.' ]
		ifNotEmpty: [ :data | token := data at: #token ]
]

{ #category : #authentication }
CRClient >> logout [

	| rawResult |
	rawResult := self executeCommand: CRLogoutCommand new.
	(rawResult at: #errorCode)
		ifNotNil: [ self handleErrorsIn: rawResult ].
	token := nil
]

{ #category : #interacting }
CRClient >> newCase: aFogBugzCase [
	| rawResult |
	rawResult := self executeCommand: (
							CRNewCaseCommand new
									case: aFogBugzCase;
									yourself).
	(rawResult at: #errorCode)
		 ifNotNil: [ self handleErrorsIn: rawResult ]
]

{ #category : #interacting }
CRClient >> query: aString [

	| rawResult |
	rawResult := self executeCommand: (CRSearchCommand query: aString).
   (rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [:c |
		(c at: #cases) collect: [ :each | CRCase fromDictionary: each ] ]
]
