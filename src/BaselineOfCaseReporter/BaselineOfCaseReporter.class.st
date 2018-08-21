Class {
	#name : #BaselineOfCaseReporter,
	#superclass : #BaselineOf,
	#category : #BaselineOfCaseReporter
}

{ #category : #baselines }
BaselineOfCaseReporter >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self
				definePackages: spec ]
]

{ #category : #baselines }
BaselineOfCaseReporter >> definePackages: spec [
	spec
		package: 'CaseReporter-Core';
		package: 'CaseReporter-UI' with: [ spec requires: #('CaseReporter-Core' ) ];
		package: 'CaseReporter-FogBugz' with: [ spec requires: #('CaseReporter-Core' 'CaseReporter-UI') ];
		package: 'CaseReporter-Tests-FogBugz' with: [ spec requires: #('CaseReporter-FogBugz' ) ];
		package: 'CaseReporter-Calypso' with: [ spec requires: #('CaseReporter-FogBugz') ]
]
