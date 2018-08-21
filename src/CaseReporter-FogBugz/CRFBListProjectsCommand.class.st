"
List projects available.
"
Class {
	#name : #CRFBListProjectsCommand,
	#superclass : #CRFBTokenCommand,
	#category : #'CaseReporter-FogBugz-Commands'
}

{ #category : #accessing }
CRFBListProjectsCommand >> commandName [
	^ 'listProjects'
]
