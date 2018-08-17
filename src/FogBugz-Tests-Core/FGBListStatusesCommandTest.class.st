Class {
	#name : #FGBListStatusesCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'FogBugz-Tests-Core-Commands'
}

{ #category : #running }
FGBListStatusesCommandTest >> setUp [

	super setUp.
	command := FGBListStatusesCommand new
						token: 'foo42';
						yourself

]

{ #category : #tests }
FGBListStatusesCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: {'cmd' -> 'listStatuses' . 'token' -> 'foo42' } asDictionary
]

{ #category : #tests }
FGBListStatusesCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
