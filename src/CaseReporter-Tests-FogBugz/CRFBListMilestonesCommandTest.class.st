Class {
	#name : #CRFBListMilestonesCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-FogBugz-Commands'
}

{ #category : #running }
CRFBListMilestonesCommandTest >> setUp [
	super setUp.
	command := CRFBListMilestonesCommand new
						token: 'foo42';
						yourself
]

{ #category : #tests }
CRFBListMilestonesCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: {'cmd' -> 'listFixFors' . 'token' -> 'foo42' } asDictionary
]

{ #category : #tests }
CRFBListMilestonesCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
