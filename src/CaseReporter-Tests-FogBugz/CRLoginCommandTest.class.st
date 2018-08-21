Class {
	#name : #CRLoginCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-FogBugz-Commands'
}

{ #category : #running }
CRLoginCommandTest >> setUp [

	super setUp.
	command := CRLoginCommand loginUser: 'abc@def.com' password: 'pass'.

]

{ #category : #tests }
CRLoginCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: { 'cmd' -> 'logon' . 'email' -> 'abc@def.com' . 'password' -> 'pass'} asDictionary
]

{ #category : #tests }
CRLoginCommandTest >> testRequiresSession [

	self deny: command requiresSession 
]
