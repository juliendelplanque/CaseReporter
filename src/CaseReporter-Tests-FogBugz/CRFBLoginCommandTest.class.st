Class {
	#name : #CRFBLoginCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-FogBugz-Commands'
}

{ #category : #running }
CRFBLoginCommandTest >> setUp [

	super setUp.
	command := CRFBLoginCommand loginUser: 'abc@def.com' password: 'pass'.

]

{ #category : #tests }
CRFBLoginCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: { 'cmd' -> 'logon' . 'email' -> 'abc@def.com' . 'password' -> 'pass'} asDictionary
]

{ #category : #tests }
CRFBLoginCommandTest >> testRequiresSession [

	self deny: command requiresSession 
]
