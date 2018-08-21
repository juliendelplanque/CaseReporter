"
Login command
"
Class {
	#name : #CRLoginCommand,
	#superclass : #CRCommand,
	#instVars : [
		'email',
		'password'
	],
	#category : #'CaseReporter-FogBugz-Commands'
}

{ #category : #'instance creation' }
CRLoginCommand class >> loginUser: email password: password [

	^(self new)
		email: email;
		password: password;
		yourself
		
]

{ #category : #printing }
CRLoginCommand >> commandName [
	^ 'logon'
]

{ #category : #accessing }
CRLoginCommand >> email [
	^ email
]

{ #category : #accessing }
CRLoginCommand >> email: anObject [
	email := anObject
]

{ #category : #printing }
CRLoginCommand >> fillPostContentDictionary: aDictionary [
	super fillPostContentDictionary: aDictionary.
	aDictionary
		at: 'email' put: email;
		at: 'password' put: password
]

{ #category : #accessing }
CRLoginCommand >> password [
	^ password
]

{ #category : #accessing }
CRLoginCommand >> password: anObject [
	password := anObject
]
