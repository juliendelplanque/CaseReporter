Class {
	#name : #CRNewCaseCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-Core-Commands'
}

{ #category : #running }
CRNewCaseCommandTest >> setUp [

	super setUp.
	command := CRNewCaseCommand new
						token: 'foo42';
						case: CRCase example;
						yourself

]

{ #category : #tests }
CRNewCaseCommandTest >> testAsPostContentDictionary [
	self
		assert: command asPostContentDictionary
		equals: { 
			'cmd' -> 'new'.
			'token' -> 'foo42'.
			'sTitle' -> CRCase example title.
			'sEvent' -> CRCase example content.
			'sCategory' -> CRCase example category name.
			'sProject' -> CRCase example project name.
			'sArea' -> CRCase example area name.
			'sMilestone' -> CRCase example milestone name.
			'sStatus' -> CRCase example status name.
			'sPersonAssignedTo' -> CRCase example assignee name.
			'sPriority' -> CRCase example priority name } asDictionary
]

{ #category : #tests }
CRNewCaseCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
