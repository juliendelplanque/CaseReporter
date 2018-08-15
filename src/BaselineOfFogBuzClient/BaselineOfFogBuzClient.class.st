Class {
	#name : #BaselineOfFogBuzClient,
	#superclass : #BaselineOf,
	#category : #BaselineOfFogBuzClient
}

{ #category : #baselines }
BaselineOfFogBuzClient >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self
				definePackages: spec ]
]

{ #category : #baselines }
BaselineOfFogBuzClient >> definePackages: spec [
	spec
		package: 'FogBugz-Core';
		package: 'FogBugz-Tests-Core' with: [ spec requires: #('FogBugz-Core' ) ];
		package: 'FogBugz-Tools' with: [ spec requires: #('FogBugz-Core' ) ];
		package: 'FogBugz-Calypso' with: [ spec requires: #('FogBugz-Core' 'FogBugz-Tools' ) ]
]
