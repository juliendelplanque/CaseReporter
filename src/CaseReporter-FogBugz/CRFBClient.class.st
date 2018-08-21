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
			CRErrorsList new
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
	rawResult := self executeCommand: (CRListAreasCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
		(data at: #areas) 
				collect: [ :each | CRArea fromDictionary: each ] ]
]

{ #category : #interacting }
CRFBClient >> listCategories [
	| rawResult |
	rawResult := self executeCommand: (CRListCategoriesCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
			(data at: #categories) 
				collect: [ :each | CRCategory fromDictionary: each ]]
]

{ #category : #interacting }
CRFBClient >> listMilestones [
	| rawResult |
	rawResult := self executeCommand: (CRListMilestonesCommand new).
	
	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	^ (rawResult at: #data) ifNotEmpty: [ :data |
			(data at: #fixfors)
				collect: [ :each | CRMilestone fromDictionary: each ]]
]

{ #category : #interacting }
CRFBClient >> listPeople [
	| rawResult |
	rawResult := self executeCommand: (CRListPeopleCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
			(data at: #people) 
				collect: [ :each | CRUser fromDictionary: each ]]
]

{ #category : #interacting }
CRFBClient >> listPriorities [
	| rawResult |
	rawResult := self executeCommand: (CRListPrioritiesCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
			(data at: #priorities) 
				collect: [ :each | CRPriority fromDictionary: each ]]
]

{ #category : #interacting }
CRFBClient >> listProjects [
	| rawResult |
	rawResult := self executeCommand: (CRListProjectsCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
		(data at: #projects) 
			collect: [ :each | CRProject fromDictionary: each ] ].
]

{ #category : #interacting }
CRFBClient >> listStatuses [
	| rawResult |
	rawResult := self executeCommand: (CRListStatusesCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
		(data at: #statuses) 
			collect: [ :each | CRStatus fromDictionary: each ]].
]

{ #category : #authentication }
CRFBClient >> login: aCredential [
	| rawResult |
	rawResult := self
		executeCommand: (CRLoginCommand loginUser: aCredential login password: aCredential password).
	(rawResult at: #errorCode)
		ifNotNil: [ self handleErrorsIn: rawResult ].
		
	(rawResult at: #data)
		ifEmpty: [ self error: 'Unexpected error, empty data.' ]
		ifNotEmpty: [ :data | token := data at: #token ]
]

{ #category : #authentication }
CRFBClient >> logout [

	| rawResult |
	rawResult := self executeCommand: CRLogoutCommand new.
	(rawResult at: #errorCode)
		ifNotNil: [ self handleErrorsIn: rawResult ].
	token := nil
]

{ #category : #interacting }
CRFBClient >> newCase: aFogBugzCase [
	| rawResult |
	rawResult := self executeCommand: (
							CRNewCaseCommand new
									case: aFogBugzCase;
									yourself).
	(rawResult at: #errorCode)
		 ifNotNil: [ self handleErrorsIn: rawResult ]
]

{ #category : #ui }
CRFBClient >> openCaseCreationUIWithTemplate: aString [
	CRCaseCreatorPresenter openForClient: self withTemplate: aString
]

{ #category : #interacting }
CRFBClient >> query: aString [

	| rawResult |
	rawResult := self executeCommand: (CRSearchCommand query: aString).
   (rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [:c |
		(c at: #cases) collect: [ :each | CRCase fromDictionary: each ] ]
]
