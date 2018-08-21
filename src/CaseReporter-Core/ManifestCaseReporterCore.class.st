"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCaseReporterCore,
	#superclass : #PackageManifest,
	#category : #'CaseReporter-Core-Manifest'
}

{ #category : #'case-reporter' }
ManifestCaseReporterCore class >> bugTrackerType [
	^ 'Github'
]

{ #category : #'case-reporter' }
ManifestCaseReporterCore class >> bugTrackerUrl [
	^ 'https://github.com/juliendelplanque/CaseReporter'
]
