"
Login dialog
"
Class {
	#name : #CRLoginDialogPresenter,
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
CRLoginDialogPresenter class >> defaultSpec [
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
CRLoginDialogPresenter class >> getCredentials [
	| login dialog |
	login := self new.
	dialog := login openDialogWithSpec.
	dialog modalRelativeTo: self currentWorld.
	dialog cancelled
		ifTrue: [ CRUserCancelledLogin signal ].
	^ login asCredentials
]

{ #category : #converting }
CRLoginDialogPresenter >> asCredentials [
	^ CRCredentials login: self usernameField text password: self passwordField text
]

{ #category : #defaults }
CRLoginDialogPresenter >> initialExtent [
  ^ 350 @ 150
]

{ #category : #'initialization widgets' }
CRLoginDialogPresenter >> initializeWidgets [
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
CRLoginDialogPresenter >> passwordField [
	^ passwordField
]

{ #category : #accessing }
CRLoginDialogPresenter >> passwordField: anObject [
	passwordField := anObject
]

{ #category : #accessing }
CRLoginDialogPresenter >> passwordLabel [
	^ passwordLabel
]

{ #category : #accessing }
CRLoginDialogPresenter >> passwordLabel: anObject [
	passwordLabel := anObject
]

{ #category : #defaults }
CRLoginDialogPresenter >> title [
  ^ 'Login'
]

{ #category : #accessing }
CRLoginDialogPresenter >> usernameField [
	^ usernameField
]

{ #category : #accessing }
CRLoginDialogPresenter >> usernameField: anObject [
	usernameField := anObject
]

{ #category : #accessing }
CRLoginDialogPresenter >> usernameLabel [
	^ usernameLabel
]

{ #category : #accessing }
CRLoginDialogPresenter >> usernameLabel: anObject [
	usernameLabel := anObject
]
