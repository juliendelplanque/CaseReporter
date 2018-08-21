"
Login command
"
Class {
	#name : #CRFBLoginCommand,
	#superclass : #CRFBCommand,
	#instVars : [
		'email',
		'password'
	],
	#category : #'CaseReporter-FogBugz-Commands'
}

{ #category : #'instance creation' }
CRFBLoginCommand class >> loginUser: email password: password [

	^(self new)
		email: email;
		password: password;
		yourself
		
]

{ #category : #printing }
CRFBLoginCommand >> commandName [
	^ 'logon'
]

{ #category : #accessing }
CRFBLoginCommand >> email [
	^ email
]

{ #category : #accessing }
CRFBLoginCommand >> email: anObject [
	email := anObject
]

{ #category : #printing }
CRFBLoginCommand >> fillPostContentDictionary: aDictionary [
	super fillPostContentDictionary: aDictionary.
	aDictionary
		at: 'email' put: email;
		at: 'password' put: password
]

{ #category : #accessing }
CRFBLoginCommand >> password [
	^ password
]

{ #category : #accessing }
CRFBLoginCommand >> password: anObject [
	password := anObject
]
