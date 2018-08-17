Class {
	#name : #FGBNewCaseCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'FogBugz-Tests-Core-Commands'
}

{ #category : #running }
FGBNewCaseCommandTest >> setUp [

	super setUp.
	command := FGBNewCaseCommand new
						token: 'foo42';
						case: FGBCase example;
						yourself

]

{ #category : #tests }
FGBNewCaseCommandTest >> testAsPostContentDictionary [
	self
		assert: command asPostContentDictionary
		equals: { 
			'cmd' -> 'new'.
			'token' -> 'foo42'.
			'sTitle' -> FGBCase example title.
			'sEvent' -> FGBCase example content.
			'sCategory' -> FGBCase example category name.
			'sProject' -> FGBCase example project name.
			'sArea' -> FGBCase example area name.
			'sMilestone' -> FGBCase example milestone name.
			'sStatus' -> FGBCase example status name.
			'sPersonAssignedTo' -> FGBCase example assignee name.
			'sPriority' -> FGBCase example priority name } asDictionary
]

{ #category : #tests }
FGBNewCaseCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
