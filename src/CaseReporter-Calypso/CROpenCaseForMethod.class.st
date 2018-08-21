Class {
	#name : #CROpenCaseForMethod,
	#superclass : #ClyBrowserCommand,
	#traits : 'CRCalypsoCommand',
	#classTraits : 'CRCalypsoCommand classTrait',
	#instVars : [
		'methodConcerned'
	],
	#category : #'CaseReporter-Calypso'
}

{ #category : #testing }
CROpenCaseForMethod class >> canBeExecutedInContext: aBrowserContext [
	(super canBeExecutedInContext: aBrowserContext) ifFalse: [ ^false ].
	
	^aBrowserContext isMethodSelected
]

{ #category : #activation }
CROpenCaseForMethod class >> fullBrowserMenuActivation [
	<classAnnotation>
	
	^CmdContextMenuActivation byRootGroupItemOrder: self itemOrder for: ClyMethodContextOfFullBrowser 
]

{ #category : #accessing }
CROpenCaseForMethod class >> fullBrowserTabActivation [
	<classAnnotation>
	
	^ClyBrowserTabCommandActivation for: ClyMethodContextOfFullBrowser 
]

{ #category : #accessing }
CROpenCaseForMethod >> issueTemplate [
	^ 'The following issue has been found in {1} method:

The following code snippet(s) allows one to reproduce the issue:
'  format: { methodConcerned printString }
]

{ #category : #execution }
CROpenCaseForMethod >> prepareFullExecutionInContext: aBrowserContext [
	super prepareFullExecutionInContext: aBrowserContext.
	
	methodConcerned := aBrowserContext lastSelectedMethod.
]
