"
A client for Pharo Fogbugz issue server.

https://pharo.fogbugz.com/f/

See class side example methods
"
Class {
	#name : #CRFBClient,
	#superclass : #CRClient,
	#instVars : [
		'token',
		'jsonAPILocation'
	],
	#category : #'CaseReporter-FogBugz-Client'
}

{ #category : #accessing }
CRFBClient class >> pharoJSONAPILocation [
	^ 'https://pharo.fogbugz.com/f/api/0/jsonapi'
]

{ #category : #'private - utilities' }
CRFBClient >> executeCommand: aCommand [
	aCommand requiresSession ifTrue: [ 
		aCommand token: token ].
	^ STON
		fromString:
			(ZnClient new
				post: self jsonAPILocation
				contents: aCommand asPostContentJSON)
]

{ #category : #'private - utilities' }
CRFBClient >> handleErrorsIn: aDictionary [
	(aDictionary at: #errors)
		ifNotEmpty: [ :rawErrors |
			CRFBErrorsList new
				errors: (rawErrors collect: [ :each |
								Error new
									messageText: (each at: #message);
									yourself ]);
				signal ]
]

{ #category : #testing }
CRFBClient >> isLoggedIn [

	^token notNil
]

{ #category : #accessing }
CRFBClient >> jsonAPILocation [
	^ jsonAPILocation ifNil: [ jsonAPILocation := self class pharoJSONAPILocation ]
]

{ #category : #accessing }
CRFBClient >> jsonAPILocation: anObject [
	jsonAPILocation := anObject
]

{ #category : #interacting }
CRFBClient >> listAreas [
	| rawResult |
	rawResult := self executeCommand: (CRFBListAreasCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
		(data at: #areas) 
				collect: [ :each | CRFBArea fromDictionary: each ] ]
]

{ #category : #interacting }
CRFBClient >> listCategories [
	| rawResult |
	rawResult := self executeCommand: (CRFBListCategoriesCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
			(data at: #categories) 
				collect: [ :each | CRFBCategory fromDictionary: each ]]
]

{ #category : #interacting }
CRFBClient >> listMilestones [
	| rawResult |
	rawResult := self executeCommand: (CRFBListMilestonesCommand new).
	
	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	^ (rawResult at: #data) ifNotEmpty: [ :data |
			(data at: #fixfors)
				collect: [ :each | CRFBMilestone fromDictionary: each ]]
]

{ #category : #interacting }
CRFBClient >> listPeople [
	| rawResult |
	rawResult := self executeCommand: (CRFBListPeopleCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
			(data at: #people) 
				collect: [ :each | CRFBUser fromDictionary: each ]]
]

{ #category : #interacting }
CRFBClient >> listPriorities [
	| rawResult |
	rawResult := self executeCommand: (CRFBListPrioritiesCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
			(data at: #priorities) 
				collect: [ :each | CRFBPriority fromDictionary: each ]]
]

{ #category : #interacting }
CRFBClient >> listProjects [
	| rawResult |
	rawResult := self executeCommand: (CRFBListProjectsCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
		(data at: #projects) 
			collect: [ :each | CRFBProject fromDictionary: each ] ].
]

{ #category : #interacting }
CRFBClient >> listStatuses [
	| rawResult |
	rawResult := self executeCommand: (CRFBListStatusesCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
		(data at: #statuses) 
			collect: [ :each | CRFBStatus fromDictionary: each ]].
]

{ #category : #authentication }
CRFBClient >> login: aCredential [
	| rawResult |
	rawResult := self
		executeCommand: (CRFBLoginCommand loginUser: aCredential login password: aCredential password).
	(rawResult at: #errorCode)
		ifNotNil: [ self handleErrorsIn: rawResult ].
		
	(rawResult at: #data)
		ifEmpty: [ self error: 'Unexpected error, empty data.' ]
		ifNotEmpty: [ :data | token := data at: #token ]
]

{ #category : #authentication }
CRFBClient >> logout [

	| rawResult |
	rawResult := self executeCommand: CRFBLogoutCommand new.
	(rawResult at: #errorCode)
		ifNotNil: [ self handleErrorsIn: rawResult ].
	token := nil
]

{ #category : #interacting }
CRFBClient >> newCase: aFogBugzCase [
	| rawResult |
	rawResult := self executeCommand: (
							CRFBNewCaseCommand new
									case: aFogBugzCase;
									yourself).
	(rawResult at: #errorCode)
		 ifNotNil: [ self handleErrorsIn: rawResult ]
]

{ #category : #ui }
CRFBClient >> openCaseCreationUIWithTemplate: aString [
	CRFBCaseCreatorPresenter openForClient: self withTemplate: aString
]

{ #category : #interacting }
CRFBClient >> query: aString [

	| rawResult |
	rawResult := self executeCommand: (CRFBSearchCommand query: aString).
   (rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [:c |
		(c at: #cases) collect: [ :each | CRFBCase fromDictionary: each ] ]
]
