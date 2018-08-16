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
	| client |
	client := [ FogBugzClient getWorkingClientByAskingUser ] on: FGBUserCancelledLogin do: [ 
		UIManager default inform: 'Log-in cancelled.'.
		^ self ].
	FGBCaseCreator openForClient: client withTemplate: 
			('The following issue has been found in {1} method:

The following code snippet(s) allows one to reproduce the issue:
' format: {methodConcerned printString})
]

{ #category : #execution }
FBGOpenCaseForMethod >> prepareFullExecutionInContext: aBrowserContext [
	super prepareFullExecutionInContext: aBrowserContext.
	
	methodConcerned := aBrowserContext lastSelectedMethod.
]
