Class {
	#name : #CRFBNewCaseCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-FogBugz-Commands'
}

{ #category : #running }
CRFBNewCaseCommandTest >> setUp [

	super setUp.
	command := CRFBNewCaseCommand new
						token: 'foo42';
						case: CRFBCase example;
						yourself

]

{ #category : #tests }
CRFBNewCaseCommandTest >> testAsPostContentDictionary [
	self
		assert: command asPostContentDictionary
		equals: { 
			'cmd' -> 'new'.
			'token' -> 'foo42'.
			'sTitle' -> CRFBCase example title.
			'sEvent' -> CRFBCase example content.
			'sCategory' -> CRFBCase example category name.
			'sProject' -> CRFBCase example project name.
			'sArea' -> CRFBCase example area name.
			'sMilestone' -> CRFBCase example milestone name.
			'sStatus' -> CRFBCase example status name.
			'sPersonAssignedTo' -> CRFBCase example assignee name.
			'sPriority' -> CRFBCase example priority name } asDictionary
]

{ #category : #tests }
CRFBNewCaseCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
