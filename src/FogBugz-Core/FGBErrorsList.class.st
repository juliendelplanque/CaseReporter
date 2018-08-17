"
I represent the error list that is returned by the REST API.

My #errors inst. var. hold the actual list of errors.
"
Class {
	#name : #FGBErrorsList,
	#superclass : #Error,
	#instVars : [
		'errors'
	],
	#category : #'FogBugz-Core-Errors'
}

{ #category : #accessing }
FGBErrorsList >> errors [
	^ errors
]

{ #category : #accessing }
FGBErrorsList >> errors: anObject [
	errors := anObject
]

{ #category : #accessing }
FGBErrorsList >> messageText [
	^ String streamContents: [ :s |
		s
			<< self errors size;
			<< ' error(s), first one is: "';
			<< self errors first messageText;
			<< $" ]
]
