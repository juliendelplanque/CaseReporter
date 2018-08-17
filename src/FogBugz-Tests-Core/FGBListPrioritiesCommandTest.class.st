Class {
	#name : #FGBListPrioritiesCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'FogBugz-Tests-Core-Commands'
}

{ #category : #running }
FGBListPrioritiesCommandTest >> setUp [

	super setUp.
	command := FGBListPrioritiesCommand new
						token: 'foo42';
						yourself

]

{ #category : #tests }
FGBListPrioritiesCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: {'cmd' -> 'listPriorities' . 'token' -> 'foo42' } asDictionary
]

{ #category : #tests }
FGBListPrioritiesCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
