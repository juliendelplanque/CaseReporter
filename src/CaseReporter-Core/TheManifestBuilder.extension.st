Extension { #name : #TheManifestBuilder }

{ #category : #'*CaseReporter-Core' }
TheManifestBuilder >> bugTrackerTypeSelector [
	^ #bugTrackerType
]

{ #category : #'*CaseReporter-Core' }
TheManifestBuilder >> bugTrackerUrlSelector [
	^ #bugTrackerUrl
]

{ #category : #'*CaseReporter-Core' }
TheManifestBuilder >> setBugTrackerType: aString [
	manifestClass class compile: self bugTrackerTypeSelector , '
	^ ''',aString,''''.
	(manifestClass class >> self bugTrackerTypeSelector)
		protocol: 'case-reporter'
]

{ #category : #'*CaseReporter-Core' }
TheManifestBuilder >> setBugTrackerUrl: aString [
	manifestClass class compile: self bugTrackerUrlSelector , '
	^ ''',aString,''''.
	(manifestClass class >> self bugTrackerUrlSelector)
		protocol: 'case-reporter'
]
