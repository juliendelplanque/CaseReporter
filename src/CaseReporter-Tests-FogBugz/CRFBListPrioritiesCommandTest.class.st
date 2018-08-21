Class {
	#name : #CRFBListPrioritiesCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-FogBugz-Commands'
}

{ #category : #running }
CRFBListPrioritiesCommandTest >> setUp [

	super setUp.
	command := CRFBListPrioritiesCommand new
						token: 'foo42';
						yourself

]

{ #category : #tests }
CRFBListPrioritiesCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: {'cmd' -> 'listPriorities' . 'token' -> 'foo42' } asDictionary
]

{ #category : #tests }
CRFBListPrioritiesCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
