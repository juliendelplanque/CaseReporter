"
List projects available.
"
Class {
	#name : #CRListProjectsCommand,
	#superclass : #CRTokenCommand,
	#category : #'CaseReporter-FogBugz-Commands'
}

{ #category : #accessing }
CRListProjectsCommand >> commandName [
	^ 'listProjects'
]
