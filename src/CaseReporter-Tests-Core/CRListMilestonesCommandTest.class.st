Class {
	#name : #CRListMilestonesCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-Core-Commands'
}

{ #category : #running }
CRListMilestonesCommandTest >> setUp [
	super setUp.
	command := CRListMilestonesCommand new
						token: 'foo42';
						yourself
]

{ #category : #tests }
CRListMilestonesCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: {'cmd' -> 'listFixFors' . 'token' -> 'foo42' } asDictionary
]

{ #category : #tests }
CRListMilestonesCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
