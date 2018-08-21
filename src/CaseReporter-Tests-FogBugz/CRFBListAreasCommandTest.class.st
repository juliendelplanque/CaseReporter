Class {
	#name : #CRFBListAreasCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-FogBugz-Commands'
}

{ #category : #running }
CRFBListAreasCommandTest >> setUp [
	super setUp.
	command := CRFBListAreasCommand new
						token: 'foo42';
						yourself
]

{ #category : #tests }
CRFBListAreasCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: {'cmd' -> 'listAreas' . 'token' -> 'foo42' } asDictionary
]

{ #category : #tests }
CRFBListAreasCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
