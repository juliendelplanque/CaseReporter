"
Login dialog
"
Class {
	#name : #CRLoginDialogModel,
	#superclass : #ComposablePresenter,
	#instVars : [
		'usernameLabel',
		'usernameField',
		'passwordLabel',
		'passwordField'
	],
	#category : #'CaseReporter-Tools-Utilities'
}

{ #category : #specs }
CRLoginDialogModel class >> defaultSpec [
  <spec: #default>

  ^ SpecLayout composed
      newColumn: [ :col |
        col 
          newRow: [ :row | 
            row 
              add: #usernameLabel width: 80; 
              add: #usernameField ]
          height: self inputTextHeight;
          newRow: [ :row | 
            row 
              add: #passwordLabel width: 80; 
              add: #passwordField ]
          height: self inputTextHeight ];
       yourself
]

{ #category : #'instance creation' }
CRLoginDialogModel class >> getCredentials [
	| login dialog |
	login := self new.
	dialog := login openDialogWithSpec.
	dialog modalRelativeTo: self currentWorld.
	dialog cancelled
		ifTrue: [ CRUserCancelledLogin signal ].
	^ login asCredentials
]

{ #category : #converting }
CRLoginDialogModel >> asCredentials [
	^ CRCredentials login: self usernameField text password: self passwordField text
]

{ #category : #defaults }
CRLoginDialogModel >> initialExtent [
  ^ 350 @ 150
]

{ #category : #'initialization widgets' }
CRLoginDialogModel >> initializeWidgets [
  usernameLabel := self newLabel.
  usernameLabel label: 'Username'.
  usernameField := self newTextInput.
  usernameField autoAccept: true; ghostText: 'pharo@fogbugz.com'.
  passwordLabel := self newLabel.
  passwordLabel label: 'Password'; yourself.
  passwordField := self newTextInput.
  passwordField beEncrypted; autoAccept: true; ghostText: '******'.
  self focusOrder add: usernameField; add: passwordField
]

{ #category : #accessing }
CRLoginDialogModel >> passwordField [
	^ passwordField
]

{ #category : #accessing }
CRLoginDialogModel >> passwordField: anObject [
	passwordField := anObject
]

{ #category : #accessing }
CRLoginDialogModel >> passwordLabel [
	^ passwordLabel
]

{ #category : #accessing }
CRLoginDialogModel >> passwordLabel: anObject [
	passwordLabel := anObject
]

{ #category : #defaults }
CRLoginDialogModel >> title [
  ^ 'Login'
]

{ #category : #accessing }
CRLoginDialogModel >> usernameField [
	^ usernameField
]

{ #category : #accessing }
CRLoginDialogModel >> usernameField: anObject [
	usernameField := anObject
]

{ #category : #accessing }
CRLoginDialogModel >> usernameLabel [
	^ usernameLabel
]

{ #category : #accessing }
CRLoginDialogModel >> usernameLabel: anObject [
	usernameLabel := anObject
]
