Class {
	#name : #CRFBLogoutCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-FogBugz-Commands'
}

{ #category : #running }
CRFBLogoutCommandTest >> setUp [

	super setUp.
	command := CRFBLogoutCommand new token: 'pljl6316cjgv5h3cnmntbck295gf47'
]

{ #category : #tests }
CRFBLogoutCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: { 'cmd' -> 'logoff' . 'token' -> 'pljl6316cjgv5h3cnmntbck295gf47' } asDictionary
]

{ #category : #tests }
CRFBLogoutCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
