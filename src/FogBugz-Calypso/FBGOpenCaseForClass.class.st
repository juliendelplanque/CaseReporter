Class {
	#name : #FBGOpenCaseForClass,
	#superclass : #ClyBrowserCommand,
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

{ #category : #accessing }
FBGOpenCaseForClass class >> defaultMenuItemName [
	^ 'Open issue'
]

{ #category : #activation }
FBGOpenCaseForClass class >> fullBrowserMenuActivation [
	<classAnnotation>
	
	^CmdContextMenuActivation byRootGroupItemOrder: 9 for: ClyClassContextOfFullBrowser 
]

{ #category : #execution }
FBGOpenCaseForClass >> execute [
	| credentials client |
	credentials := FGBLoginDialogModel getCredentials.
	client := FogBugzClient loginUser: credentials key password: credentials value.
	[
		FGBCaseCreator new
			contentTemplate: 'The following issue has been found in {1} class:

The following code snippet(s) allows to reproduce the issue:
';
			adaptToClient: client;
			openWithSpec
	] ensure: [ client logout ].
]

{ #category : #execution }
FBGOpenCaseForClass >> prepareFullExecutionInContext: aBrowserContext [
	super prepareFullExecutionInContext: aBrowserContext.
	
	classConcerned := aBrowserContext lastSelectedClass.
]
