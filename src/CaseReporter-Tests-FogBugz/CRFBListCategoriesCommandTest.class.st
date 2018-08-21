Class {
	#name : #CRFBListCategoriesCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-FogBugz-Commands'
}

{ #category : #running }
CRFBListCategoriesCommandTest >> setUp [

	super setUp.
	command := CRFBListCategoriesCommand new
						token: 'foo42';
						yourself

]

{ #category : #tests }
CRFBListCategoriesCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: {'cmd' -> 'listCategories' . 'token' -> 'foo42' } asDictionary
]

{ #category : #tests }
CRFBListCategoriesCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
