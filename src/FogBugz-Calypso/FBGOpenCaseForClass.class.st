Class {
	#name : #FBGOpenCaseForClass,
	#superclass : #ClyBrowserCommand,
	#traits : 'FBGCalypsoCommand',
	#classTraits : 'FBGCalypsoCommand classTrait',
	#instVars : [
		'classConcerned'
	],
	#category : #'FogBugz-Calypso'
}

{ #category : #testing }
FBGOpenCaseForClass class >> canBeExecutedInContext: aBrowserContext [
	(super canBeExecutedInContext: aBrowserContext) ifFalse: [ ^false ].
	
	^aBrowserContext isClassSelected 
]

{ #category : #activation }
FBGOpenCaseForClass class >> fullBrowserMenuActivation [
	<classAnnotation>
	
	^CmdContextMenuActivation byRootGroupItemOrder: self itemOrder for: ClyClassContextOfFullBrowser 
]

{ #category : #accessing }
FBGOpenCaseForClass class >> fullBrowserTabActivation [
	<classAnnotation>
	
	^ClyBrowserTabCommandActivation for: ClyClassContextOfFullBrowser 
]

{ #category : #execution }
FBGOpenCaseForClass >> execute [
	| client |
	client := [ FogBugzClient getWorkingClientByAskingUser ] on: FGBUserCancelledLogin do: [ 
		UIManager default inform: 'Log-in cancelled.'.
		^ self ].
	FGBCaseCreator openForClient: client withTemplate: 
			('The following issue has been found in {1} class:

The following code snippet(s) allows one to reproduce the issue:
' format: {classConcerned name})
]

{ #category : #execution }
FBGOpenCaseForClass >> prepareFullExecutionInContext: aBrowserContext [
	super prepareFullExecutionInContext: aBrowserContext.
	
	classConcerned := aBrowserContext lastSelectedClass.
]
