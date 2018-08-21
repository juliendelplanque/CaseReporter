Class {
	#name : #CRListProjectsCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-FogBugz-Commands'
}

{ #category : #running }
CRListProjectsCommandTest >> setUp [

	super setUp.
	command := CRListProjectsCommand new
						token: 'foo42';
						yourself

]

{ #category : #tests }
CRListProjectsCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: { 'cmd' -> 'listProjects' . 'token' -> 'foo42'} asDictionary
]

{ #category : #tests }
CRListProjectsCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
