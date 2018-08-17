Class {
	#name : #FGBListAreasCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'FogBugz-Tests-Core-Commands'
}

{ #category : #running }
FGBListAreasCommandTest >> setUp [
	super setUp.
	command := FGBListAreasCommand new
						token: 'foo42';
						yourself
]

{ #category : #tests }
FGBListAreasCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: {'cmd' -> 'listAreas' . 'token' -> 'foo42' } asDictionary
]

{ #category : #tests }
FGBListAreasCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
