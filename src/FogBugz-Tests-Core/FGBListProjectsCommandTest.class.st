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

]

{ #category : #tests }
FGBListProjectsCommandTest >> testInstanceCreation [
	self assert: command printString equals: '{"cmd": "listProjects","token": "nil"}'
]

{ #category : #tests }
FGBListProjectsCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
