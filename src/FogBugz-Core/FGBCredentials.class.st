"
I represent the credentials of a user.
"
Class {
	#name : #FGBCredentials,
	#superclass : #Object,
	#instVars : [
		'login',
		'password'
	],
	#category : #'FogBugz-Core-Client'
}

{ #category : #private }
FGBCredentials class >> login: aString password: anotherString [
	^ self new
		login: aString;
		password: anotherString;
		yourself
]

{ #category : #accessing }
FGBCredentials >> login [
	^ login
]

{ #category : #accessing }
FGBCredentials >> login: anObject [
	login := anObject
]

{ #category : #accessing }
FGBCredentials >> password [
	^ password
]

{ #category : #accessing }
FGBCredentials >> password: anObject [
	password := anObject
]
