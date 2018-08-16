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

{ #category : #printing }
FGBLoginCommand >> fillPostContentDictionary: aDictionary [
	aDictionary
		at: 'cmd' put: 'logon';
		at: 'email' put: email;
		at: 'password' put: password
]

{ #category : #accessing }
FGBLoginCommand >> password [
	^ password
]

{ #category : #accessing }
FGBLoginCommand >> password: anObject [
	password := anObject
]
