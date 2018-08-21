Class {
	#name : #CRFBListProjectsCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-FogBugz-Commands'
}

{ #category : #running }
CRFBListProjectsCommandTest >> setUp [

	super setUp.
	command := CRFBListProjectsCommand new
						token: 'foo42';
						yourself

]

{ #category : #tests }
CRFBListProjectsCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: { 'cmd' -> 'listProjects' . 'token' -> 'foo42'} asDictionary
]

{ #category : #tests }
CRFBListProjectsCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
