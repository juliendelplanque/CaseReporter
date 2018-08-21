"
I represent the error list that is returned by the REST API.

My #errors inst. var. hold the actual list of errors.
"
Class {
	#name : #CRErrorsList,
	#superclass : #Error,
	#instVars : [
		'errors'
	],
	#category : #'CaseReporter-FogBugz-Errors'
}

{ #category : #accessing }
CRErrorsList >> errors [
	^ errors
]

{ #category : #accessing }
CRErrorsList >> errors: anObject [
	errors := anObject
]

{ #category : #accessing }
CRErrorsList >> messageText [
	^ String streamContents: [ :s |
		s
			<< self errors size;
			<< ' error(s), first one is: "';
			<< self errors first messageText;
			<< $" ]
]
