"
Command allowing to create a new case on fogbugz.
"
Class {
	#name : #FGBNewCaseCommand,
	#superclass : #FGBTokenCommand,
	#instVars : [
		'case'
	],
	#category : #'FogBugz-Core-Commands'
}

{ #category : #accessing }
FGBNewCaseCommand >> case [
	^ case
]

{ #category : #accessing }
FGBNewCaseCommand >> case: anObject [
	case := anObject
]

{ #category : #printing }
FGBNewCaseCommand >> printOn: aStream [

	aStream
		nextPutAll:
			('{"cmd": "new","sTitle": "<1s>", "sEvent": "<2s>", "sCategory": "<3s>", "sProject": "<4s>", "sArea": "<5s>", "sMilestone" : "<6s>", "sStatus": "<7s>", "sPersonAssignedTo": "<8s>", "sPriority": "<9s>", "token": "<10s>"}' expandMacrosWithArguments: {
			self case title .
			self case content asString.
			self case category name.
			self case project name.
			self case area name.
			self case milestone name.
			self case status name.
			self case assignee name.
			self case priority name.
			self token })
]
