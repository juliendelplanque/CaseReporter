Class {
	#name : #CRListPeopleCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-FogBugz-Commands'
}

{ #category : #running }
CRListPeopleCommandTest >> setUp [

	super setUp.
	command := CRListPeopleCommand new
						token: 'foo42';
						yourself

]

{ #category : #tests }
CRListPeopleCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: {'cmd' -> 'listPeople'. 'fIncludeNormal'-> 1 . 'fIncludeVirtual'-> 1 . 'token' -> 'foo42' } asDictionary
]

{ #category : #tests }
CRListPeopleCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
