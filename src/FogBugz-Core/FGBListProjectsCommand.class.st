"
List projects available.
"
Class {
	#name : #FGBListProjectsCommand,
	#superclass : #FGBTokenCommand,
	#category : #'FogBugz-Core-Commands'
}

{ #category : #accessing }
FGBListProjectsCommand >> commandName [
	^ 'listProjects'
]
