Class {
	#name : #CRListCategoriesCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'CaseReporter-Tests-Core-Commands'
}

{ #category : #running }
CRListCategoriesCommandTest >> setUp [

	super setUp.
	command := CRListCategoriesCommand new
						token: 'foo42';
						yourself

]

{ #category : #tests }
CRListCategoriesCommandTest >> testAsPostContentDictionary [
	self assert: command asPostContentDictionary equals: {'cmd' -> 'listCategories' . 'token' -> 'foo42' } asDictionary
]

{ #category : #tests }
CRListCategoriesCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
