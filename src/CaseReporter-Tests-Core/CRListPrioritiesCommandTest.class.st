Class {
	#name : #CRListPrioritiesCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-Core-Commands'
}

{ #category : #running }
CRListPrioritiesCommandTest >> setUp [

	super setUp.
	command := CRListPrioritiesCommand new
						token: 'foo42';
						yourself

]

{ #category : #tests }
CRListPrioritiesCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: {'cmd' -> 'listPriorities' . 'token' -> 'foo42' } asDictionary
]

{ #category : #tests }
CRListPrioritiesCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
