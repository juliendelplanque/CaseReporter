Class {
	#name : #FGBLogoutCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'FogBugz-Tests-Core-Commands'
}

{ #category : #running }
FGBLogoutCommandTest >> setUp [

	super setUp.
	command := FGBLogoutCommand new token: 'pljl6316cjgv5h3cnmntbck295gf47'
]

{ #category : #tests }
FGBLogoutCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: { 'cmd' -> 'logoff' . 'token' -> 'pljl6316cjgv5h3cnmntbck295gf47' } asDictionary
]

{ #category : #tests }
FGBLogoutCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
