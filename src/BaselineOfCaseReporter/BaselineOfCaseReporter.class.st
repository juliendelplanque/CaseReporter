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
		package: 'CaseReporter-FogBugz';
		package: 'CaseReporter-Tests-FogBugz' with: [ spec requires: #('CaseReporter-Core' ) ];
		package: 'CaseReporter-Tools' with: [ spec requires: #('CaseReporter-Core' ) ];
		package: 'CaseReporter-Calypso' with: [ spec requires: #('CaseReporter-Core' 'CaseReporter-Tools' ) ]
]
