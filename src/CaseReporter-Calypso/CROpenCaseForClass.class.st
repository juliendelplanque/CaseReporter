"
Calypso command to open the UI for reporting a case related to a class/trait on a bugtracker.
"
Class {
	#name : #CROpenCaseForClass,
	#superclass : #ClyBrowserCommand,
	#traits : 'CRCalypsoCommand',
	#classTraits : 'CRCalypsoCommand classTrait',
	#instVars : [
		'classConcerned'
	],
	#category : #'CaseReporter-Calypso'
}

{ #category : #testing }
CROpenCaseForClass class >> canBeExecutedInContext: aBrowserContext [
	(super canBeExecutedInContext: aBrowserContext) ifFalse: [ ^false ].
	
	^aBrowserContext isClassSelected 
]

{ #category : #activation }
CROpenCaseForClass class >> fullBrowserMenuActivation [
	<classAnnotation>
	
	^CmdContextMenuActivation byRootGroupItemOrder: self itemOrder for: ClyClassContextOfFullBrowser 
]

{ #category : #accessing }
CROpenCaseForClass class >> fullBrowserTabActivation [
	<classAnnotation>
	
	^ClyBrowserTabCommandActivation for: ClyClassContextOfFullBrowser 
]

{ #category : #accessing }
CROpenCaseForClass >> issueTemplate [
	^ 'The following issue has been found in {1} class:

The following code snippet(s) allows one to reproduce the issue:
' format: { classConcerned name }
]

{ #category : #execution }
CROpenCaseForClass >> prepareFullExecutionInContext: aBrowserContext [
	super prepareFullExecutionInContext: aBrowserContext.
	
	classConcerned := aBrowserContext lastSelectedClass.
]
