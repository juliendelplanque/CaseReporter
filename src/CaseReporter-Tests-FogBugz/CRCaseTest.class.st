Class {
	#name : #CRCaseTest,
	#superclass : #TestCase,
	#category : #'CaseReporter-Tests-FogBugz-Model'
}

{ #category : #tests }
CRCaseTest >> testAsURL [

	|c|
	c := CRCase new.
	c id: 666.
	self assert: c asURL equals: 'https://pharo.fogbugz.com/f/cases/666'
]
