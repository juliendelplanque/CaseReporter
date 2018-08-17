Class {
	#name : #FGBSearchCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'FogBugz-Tests-Core-Commands'
}

{ #category : #running }
FGBSearchCommandTest >> setUp [

	super setUp.
	command := FGBSearchCommand new
						token: 'foo42';
						query: 'query';
						yourself

]

{ #category : #tests }
FGBSearchCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: {'cmd' -> 'search' . 'q' -> 'query'. 'cols'-> #('sTitle' 'sStatus'). 'token' -> 'foo42' } asDictionary
]

{ #category : #tests }
FGBSearchCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
