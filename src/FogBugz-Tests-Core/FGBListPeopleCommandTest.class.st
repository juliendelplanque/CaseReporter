Class {
	#name : #FGBListPeopleCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'FogBugz-Tests-Core-Commands'
}

{ #category : #running }
FGBListPeopleCommandTest >> setUp [

	super setUp.
	command := FGBListPeopleCommand new
						token: 'foo42';
						yourself

]

{ #category : #tests }
FGBListPeopleCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: {'cmd' -> 'listPeople'. 'fIncludeNormal'-> 1 . 'fIncludeVirtual'-> 1 . 'token' -> 'foo42' } asDictionary
]

{ #category : #tests }
FGBListPeopleCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
