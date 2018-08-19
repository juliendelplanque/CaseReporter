Class {
	#name : #CRSearchCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-Core-Commands'
}

{ #category : #running }
CRSearchCommandTest >> setUp [

	super setUp.
	command := CRSearchCommand new
						token: 'foo42';
						query: 'query';
						yourself

]

{ #category : #tests }
CRSearchCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: {'cmd' -> 'search' . 'q' -> 'query'. 'cols'-> #('sTitle' 'sStatus'). 'token' -> 'foo42' } asDictionary
]

{ #category : #tests }
CRSearchCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
