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
FogBugzClient >> listProjects [
	| rawResult |
	rawResult := self executeCommand: (FGBListProjectsCommand new).

	(rawResult at: #errorCode) ifNil: [
		(rawResult at: #data) ifNotEmpty: [ :data |
			^ (data at: #projects) 
				collect: [ :each | each at: #sProject ]]].
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
