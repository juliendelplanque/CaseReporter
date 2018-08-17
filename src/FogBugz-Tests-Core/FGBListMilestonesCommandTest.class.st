Class {
	#name : #FGBListMilestonesCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'FogBugz-Tests-Core-Commands'
}

{ #category : #running }
FGBListMilestonesCommandTest >> setUp [
	super setUp.
	command := FGBListMilestonesCommand new
						token: 'foo42';
						yourself
]

{ #category : #tests }
FGBListMilestonesCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: {'cmd' -> 'listFixFors' . 'token' -> 'foo42' } asDictionary
]

{ #category : #tests }
FGBListMilestonesCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
