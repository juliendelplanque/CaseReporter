"
A client for Pharo Fogbugz issue server.

https://pharo.fogbugz.com/f/

See class side example methods
"
Class {
	#name : #FGBClient,
	#superclass : #Object,
	#instVars : [
		'token',
		'jsonAPILocation'
	],
	#classInstVars : [
		'default'
	],
	#category : #'FogBugz-Core-Client'
}

{ #category : #accessing }
FGBClient class >> clientClass [
	^ FGBCachedClient
]

{ #category : #accessing }
FGBClient class >> default [
	^ default
]

{ #category : #accessing }
FGBClient class >> default: anObject [
	default := anObject
]

{ #category : #examples }
FGBClient class >> example [
	
	|client|
	client := FGBClient loginUser: 'abc@def.com' password: 'secret'.
	(client query: 'UFFI') inspect.
	client logout
]

{ #category : #'instance creation' }
FGBClient class >> loginUser: email password: password [

	^(self new)
		login: email password: password;
		yourself
]

{ #category : #accessing }
FGBClient class >> pharoJSONAPILocation [
	^ 'https://pharo.fogbugz.com/f/api/0/jsonapi'
]

{ #category : #reset }
FGBClient class >> reset [
	self default: nil
]

{ #category : #'private - utilities' }
FGBClient >> executeCommand: aCommand [
	aCommand requiresSession ifTrue: [ 
		aCommand token: token ].
	^ STON
		fromString:
			(ZnClient new
				post: self jsonAPILocation
				contents: aCommand asPostContentJSON)
]

{ #category : #'private - utilities' }
FGBClient >> handleErrorsIn: aDictionary [
	(aDictionary at: #errors)
		ifNotEmpty: [ :rawErrors |
			FGBErrorsList new
				errors: (rawErrors collect: [ :each |
								Error new
									messageText: (each at: #message);
									yourself ]);
				signal ]
]

{ #category : #testing }
FGBClient >> isLoggedIn [

	^token notNil
]

{ #category : #accessing }
FGBClient >> jsonAPILocation [
	^ jsonAPILocation ifNil: [ jsonAPILocation := self class pharoJSONAPILocation ]
]

{ #category : #accessing }
FGBClient >> jsonAPILocation: anObject [
	jsonAPILocation := anObject
]

{ #category : #interacting }
FGBClient >> listAreas [
	| rawResult |
	rawResult := self executeCommand: (FGBListAreasCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
		(data at: #areas) 
				collect: [ :each | FGBArea fromDictionary: each ] ]
]

{ #category : #interacting }
FGBClient >> listCategories [
	| rawResult |
	rawResult := self executeCommand: (FGBListCategoriesCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
			(data at: #categories) 
				collect: [ :each | FGBCategory fromDictionary: each ]]
]

{ #category : #interacting }
FGBClient >> listMilestones [
	| rawResult |
	rawResult := self executeCommand: (FGBListMilestonesCommand new).
	
	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	^ (rawResult at: #data) ifNotEmpty: [ :data |
			(data at: #fixfors)
				collect: [ :each | FGBMilestone fromDictionary: each ]]
]

{ #category : #interacting }
FGBClient >> listPeople [
	| rawResult |
	rawResult := self executeCommand: (FGBListPeopleCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
			(data at: #people) 
				collect: [ :each | FGBUser fromDictionary: each ]]
]

{ #category : #interacting }
FGBClient >> listPriorities [
	| rawResult |
	rawResult := self executeCommand: (FGBListPrioritiesCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
			(data at: #priorities) 
				collect: [ :each | FGBPriority fromDictionary: each ]]
]

{ #category : #interacting }
FGBClient >> listProjects [
	| rawResult |
	rawResult := self executeCommand: (FGBListProjectsCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
		(data at: #projects) 
			collect: [ :each | FGBProject fromDictionary: each ] ].
]

{ #category : #interacting }
FGBClient >> listStatuses [
	| rawResult |
	rawResult := self executeCommand: (FGBListStatusesCommand new).

	(rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [ :data |
		(data at: #statuses) 
			collect: [ :each | FGBStatus fromDictionary: each ]].
]

{ #category : #authentication }
FGBClient >> login: aCredential [
	^ self login: aCredential login password: aCredential password
]

{ #category : #authentication }
FGBClient >> login: email password: password [
	| rawResult |
	rawResult := self
		executeCommand: (FGBLoginCommand loginUser: email password: password).
	(rawResult at: #errorCode)
		ifNotNil: [ self handleErrorsIn: rawResult ].
		
	(rawResult at: #data)
		ifEmpty: [ self error: 'Unexpected error, empty data.' ]
		ifNotEmpty: [ :data | token := data at: #token ]
]

{ #category : #authentication }
FGBClient >> logout [

	| rawResult |
	rawResult := self executeCommand: FGBLogoutCommand new.
	(rawResult at: #errorCode)
		ifNotNil: [ self handleErrorsIn: rawResult ].
	token := nil
]

{ #category : #interacting }
FGBClient >> newCase: aFogBugzCase [
	| rawResult |
	rawResult := self executeCommand: (
							FGBNewCaseCommand new
									case: aFogBugzCase;
									yourself).
	(rawResult at: #errorCode)
		 ifNotNil: [ self handleErrorsIn: rawResult ]
]

{ #category : #interacting }
FGBClient >> query: aString [

	| rawResult |
	rawResult := self executeCommand: (FGBSearchCommand query: aString).
   (rawResult at: #errorCode) ifNotNil: [ self handleErrorsIn: rawResult ].
	
	^ (rawResult at: #data) ifNotEmpty: [:c |
		(c at: #cases) collect: [ :each | FGBCase fromDictionary: each ] ]
]
