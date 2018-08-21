Class {
	#name : #CRListAreasCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-FogBugz-Commands'
}

{ #category : #running }
CRListAreasCommandTest >> setUp [
	super setUp.
	command := CRListAreasCommand new
						token: 'foo42';
						yourself
]

{ #category : #tests }
CRListAreasCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: {'cmd' -> 'listAreas' . 'token' -> 'foo42' } asDictionary
]

{ #category : #tests }
CRListAreasCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
