"
Login command
"
Class {
	#name : #FGBLoginCommand,
	#superclass : #FGBCommand,
	#instVars : [
		'email',
		'password'
	],
	#category : #'FogBugz-Core-Commands'
}

{ #category : #'instance creation' }
FGBLoginCommand class >> loginUser: email password: password [

	^(self new)
		email: email;
		password: password;
		yourself
		
]

{ #category : #accessing }
FGBLoginCommand >> email [
	^ email
]

{ #category : #accessing }
FGBLoginCommand >> email: anObject [
	email := anObject
]

{ #category : #accessing }
FGBLoginCommand >> password [
	^ password
]

{ #category : #accessing }
FGBLoginCommand >> password: anObject [
	password := anObject
]

{ #category : #printing }
FGBLoginCommand >> printOn: aStream [

	aStream
		nextPutAll:
			('{"cmd": "logon","email": "<1s>","password": "<2s>"}' expandMacrosWith: email with: password)
]
