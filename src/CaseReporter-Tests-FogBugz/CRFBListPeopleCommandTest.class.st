Class {
	#name : #CRFBListPeopleCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-FogBugz-Commands'
}

{ #category : #running }
CRFBListPeopleCommandTest >> setUp [

	super setUp.
	command := CRFBListPeopleCommand new
						token: 'foo42';
						yourself

]

{ #category : #tests }
CRFBListPeopleCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: {'cmd' -> 'listPeople'. 'fIncludeNormal'-> 1 . 'fIncludeVirtual'-> 1 . 'token' -> 'foo42' } asDictionary
]

{ #category : #tests }
CRFBListPeopleCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
