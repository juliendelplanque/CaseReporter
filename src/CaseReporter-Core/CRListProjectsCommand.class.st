"
List projects available.
"
Class {
	#name : #CRListProjectsCommand,
	#superclass : #CRTokenCommand,
	#category : #'CaseReporter-Core-Commands'
}

{ #category : #accessing }
CRListProjectsCommand >> commandName [
	^ 'listProjects'
]
