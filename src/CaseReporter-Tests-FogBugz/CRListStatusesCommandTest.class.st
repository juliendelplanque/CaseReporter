Class {
	#name : #CRListStatusesCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-FogBugz-Commands'
}

{ #category : #running }
CRListStatusesCommandTest >> setUp [

	super setUp.
	command := CRListStatusesCommand new
						token: 'foo42';
						yourself

]

{ #category : #tests }
CRListStatusesCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: {'cmd' -> 'listStatuses' . 'token' -> 'foo42' } asDictionary
]

{ #category : #tests }
CRListStatusesCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
