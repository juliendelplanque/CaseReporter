Class {
	#name : #FBGOpenCaseForMethod,
	#superclass : #ClyBrowserCommand,
	#traits : 'FBGCalypsoCommand',
	#classTraits : 'FBGCalypsoCommand classTrait',
	#instVars : [
		'methodConcerned'
	],
	#category : #'FogBugz-Calypso'
}

{ #category : #testing }
FBGOpenCaseForMethod class >> canBeExecutedInContext: aBrowserContext [
	(super canBeExecutedInContext: aBrowserContext) ifFalse: [ ^false ].
	
	^aBrowserContext isMethodSelected
]

{ #category : #activation }
FBGOpenCaseForMethod class >> fullBrowserMenuActivation [
	<classAnnotation>
	
	^CmdContextMenuActivation byRootGroupItemOrder: self itemOrder for: ClyMethodContextOfFullBrowser 
]

{ #category : #accessing }
FBGOpenCaseForMethod class >> fullBrowserTabActivation [
	<classAnnotation>
	
	^ClyBrowserTabCommandActivation for: ClyMethodContextOfFullBrowser 
]

{ #category : #execution }
FBGOpenCaseForMethod >> execute [
	methodConcerned inspect
]

{ #category : #execution }
FBGOpenCaseForMethod >> prepareFullExecutionInContext: aBrowserContext [
	super prepareFullExecutionInContext: aBrowserContext.
	
	methodConcerned := aBrowserContext lastSelectedMethod.
]
