"
I represent the error list that is returned by the REST API.

My #errors inst. var. hold the actual list of errors.
"
Class {
	#name : #CRFBErrorsList,
	#superclass : #Error,
	#instVars : [
		'errors'
	],
	#category : #'CaseReporter-FogBugz-Errors'
}

{ #category : #accessing }
CRFBErrorsList >> errors [
	^ errors
]

{ #category : #accessing }
CRFBErrorsList >> errors: anObject [
	errors := anObject
]

{ #category : #accessing }
CRFBErrorsList >> messageText [
	^ String streamContents: [ :s |
		s
			<< self errors size;
			<< ' error(s), first one is: "';
			<< self errors first messageText;
			<< $" ]
]
