Class {
	#name : #CRFBListStatusesCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-FogBugz-Commands'
}

{ #category : #running }
CRFBListStatusesCommandTest >> setUp [

	super setUp.
	command := CRFBListStatusesCommand new
						token: 'foo42';
						yourself

]

{ #category : #tests }
CRFBListStatusesCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: {'cmd' -> 'listStatuses' . 'token' -> 'foo42' } asDictionary
]

{ #category : #tests }
CRFBListStatusesCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
