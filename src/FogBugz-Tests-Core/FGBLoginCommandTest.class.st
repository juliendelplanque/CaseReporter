Class {
	#name : #FGBLoginCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'FogBugz-Tests-Core-Commands'
}

{ #category : #running }
FGBLoginCommandTest >> setUp [

	super setUp.
	command := FGBLoginCommand loginUser: 'abc@def.com' password: 'pass'.

]

{ #category : #tests }
FGBLoginCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: { 'cmd' -> 'logon' . 'email' -> 'abc@def.com' . 'password' -> 'pass'} asDictionary
]

{ #category : #tests }
FGBLoginCommandTest >> testRequiresSession [

	self deny: command requiresSession 
]
