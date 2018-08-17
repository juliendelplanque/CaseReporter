Class {
	#name : #FogBugzCaseTest,
	#superclass : #TestCase,
	#category : #'FogBugz-Tests-Core-Model'
}

{ #category : #tests }
FogBugzCaseTest >> testAsURL [

	|c|
	c := FGBCase new.
	c id: 666.
	self assert: c asURL equals: 'https://pharo.fogbugz.com/f/cases/666'
]
