Class {
	#name : #CRLogoutCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-FogBugz-Commands'
}

{ #category : #running }
CRLogoutCommandTest >> setUp [

	super setUp.
	command := CRLogoutCommand new token: 'pljl6316cjgv5h3cnmntbck295gf47'
]

{ #category : #tests }
CRLogoutCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: { 'cmd' -> 'logoff' . 'token' -> 'pljl6316cjgv5h3cnmntbck295gf47' } asDictionary
]

{ #category : #tests }
CRLogoutCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
