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
			self case content .
			self case category asString.
			self case project asString.
			self case area.
			self case milestone.
			self case status.
			self case assignee.
			self case priority.
			self token })
]
