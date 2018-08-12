Class {
	#name : #FGBListProjectsCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'FogBugz-Tests-Core-Commands'
}

{ #category : #running }
FGBListProjectsCommandTest >> setUp [

	super setUp.
	command := FGBListProjectsCommand new
						token: 'foo42';
						yourself

]

{ #category : #tests }
FGBListProjectsCommandTest >> testInstanceCreation [
	self assert: command printString equals: '{"cmd": "listProjects","token": "foo42"}'
]

{ #category : #tests }
FGBListProjectsCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
