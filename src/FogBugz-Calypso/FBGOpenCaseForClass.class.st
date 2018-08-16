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
	client := [ FogBugzClient getWorkingClientByAskingUserOrNil ] on: FGBUserCancelledLogin do: [ 
		UIManager default inform: 'Log-in cancelled.' ].
	FGBCaseCreator new
		contentTemplate:
			('The following issue has been found in {1} class:

The following code snippet(s) allows to reproduce the issue:
' format: {classConcerned name});
		adaptToClient: client;
		openWithSpec
]

{ #category : #execution }
FBGOpenCaseForClass >> prepareFullExecutionInContext: aBrowserContext [
	super prepareFullExecutionInContext: aBrowserContext.
	
	classConcerned := aBrowserContext lastSelectedClass.
]
