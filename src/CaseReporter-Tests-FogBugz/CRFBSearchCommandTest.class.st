Class {
	#name : #CRFBSearchCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-FogBugz-Commands'
}

{ #category : #running }
CRFBSearchCommandTest >> setUp [

	super setUp.
	command := CRFBSearchCommand new
						token: 'foo42';
						query: 'query';
						yourself

]

{ #category : #tests }
CRFBSearchCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: {'cmd' -> 'search' . 'q' -> 'query'. 'cols'-> #('sTitle' 'sStatus'). 'token' -> 'foo42' } asDictionary
]

{ #category : #tests }
CRFBSearchCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
