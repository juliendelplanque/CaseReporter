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
FGBListProjectsCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: { 'cmd' -> 'listProjects' . 'token' -> 'foo42'} asDictionary
]

{ #category : #tests }
FGBListProjectsCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
