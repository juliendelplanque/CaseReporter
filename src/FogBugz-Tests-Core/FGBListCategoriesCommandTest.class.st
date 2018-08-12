Class {
	#name : #FGBListCategoriesCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'FogBugz-Tests-Core-Commands'
}

{ #category : #running }
FGBListCategoriesCommandTest >> setUp [

	super setUp.
	command := FGBListCategoriesCommand new
						token: 'foo42';
						yourself

]

{ #category : #tests }
FGBListCategoriesCommandTest >> testInstanceCreation [
	self assert: command printString equals: '{"cmd": "listCategories","token": "foo42"}'
]

{ #category : #tests }
FGBListCategoriesCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
