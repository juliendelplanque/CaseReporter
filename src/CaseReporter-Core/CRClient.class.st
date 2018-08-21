Class {
	#name : #CRClient,
	#superclass : #Object,
	#classInstVars : [
		'default'
	],
	#category : #'CaseReporter-Core'
}

{ #category : #accessing }
CRClient class >> clientClass [
	^ CRFBCachedClient
]

{ #category : #accessing }
CRClient class >> default [
	^ default
]

{ #category : #accessing }
CRClient class >> default: anObject [
	default := anObject
]

{ #category : #'instance creation' }
CRClient class >> login: aCredentials [

	^(self new)
		login: aCredentials;
		yourself
]

{ #category : #reset }
CRClient class >> reset [
	<script>
	self default: nil
]

{ #category : #authentication }
CRClient >> login: aCredential [
	^ self subclassResponsibility
]

{ #category : #ui }
CRClient >> openCaseCreationUIWithTemplate: aString [
	"Subclasses should override this method to open the UI allowing user to create a case."
	^ self subclassResponsibility
]
