"
I represent the credentials of a user.
"
Class {
	#name : #CRCredentials,
	#superclass : #Object,
	#instVars : [
		'login',
		'password'
	],
	#category : #'CaseReporter-Core'
}

{ #category : #private }
CRCredentials class >> login: aString password: anotherString [
	^ self new
		login: aString;
		password: anotherString;
		yourself
]

{ #category : #accessing }
CRCredentials >> login [
	^ login
]

{ #category : #accessing }
CRCredentials >> login: anObject [
	login := anObject
]

{ #category : #accessing }
CRCredentials >> password [
	^ password
]

{ #category : #accessing }
CRCredentials >> password: anObject [
	password := anObject
]
