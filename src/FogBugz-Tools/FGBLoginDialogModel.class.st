"
Login dialog
"
Class {
	#name : #FGBLoginDialogModel,
	#superclass : #ComposableModel,
	#instVars : [
		'usernameLabel',
		'usernameField',
		'passwordLabel',
		'passwordField'
	],
	#category : #'FogBugz-Tools-Dialogs'
}

{ #category : #specs }
FGBLoginDialogModel class >> defaultSpec [
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
FGBLoginDialogModel class >> getCredentials [
	"self getCredentials"
	<script>
	
  | login dialog |
  login := self new.
  dialog := login openDialogWithSpec.
  dialog modalRelativeTo: self currentWorld.
  dialog cancelled ifTrue: [ ^ nil ].
  ^ login credentials
]

{ #category : #defaults }
FGBLoginDialogModel >> credentials [
  ^ usernameField text -> passwordField text

]

{ #category : #defaults }
FGBLoginDialogModel >> initialExtent [
  ^ 350 @ 150
]

{ #category : #'initialization widgets' }
FGBLoginDialogModel >> initializeWidgets [
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
FGBLoginDialogModel >> passwordField [
	^ passwordField
]

{ #category : #accessing }
FGBLoginDialogModel >> passwordField: anObject [
	passwordField := anObject
]

{ #category : #accessing }
FGBLoginDialogModel >> passwordLabel [
	^ passwordLabel
]

{ #category : #accessing }
FGBLoginDialogModel >> passwordLabel: anObject [
	passwordLabel := anObject
]

{ #category : #defaults }
FGBLoginDialogModel >> title [
  ^ 'Login'
]

{ #category : #accessing }
FGBLoginDialogModel >> usernameField [
	^ usernameField
]

{ #category : #accessing }
FGBLoginDialogModel >> usernameField: anObject [
	usernameField := anObject
]

{ #category : #accessing }
FGBLoginDialogModel >> usernameLabel [
	^ usernameLabel
]

{ #category : #accessing }
FGBLoginDialogModel >> usernameLabel: anObject [
	usernameLabel := anObject
]
