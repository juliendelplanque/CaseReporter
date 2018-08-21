Class {
	#name : #CRFBCaseTest,
	#superclass : #TestCase,
	#category : #'CaseReporter-Tests-FogBugz-Model'
}

{ #category : #tests }
CRFBCaseTest >> testAsURL [

	|c|
	c := CRFBCase new.
	c id: 666.
	self assert: c asURL equals: 'https://pharo.fogbugz.com/f/cases/666'
]
