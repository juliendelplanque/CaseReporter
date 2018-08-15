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
	| credentials client |
	client := nil.
	credentials := FogBugzClient credentials.
	[ client isNil ] whileTrue: [
		credentials ifNil: [ credentials := FGBLoginDialogModel getCredentials ].
		credentials ifNil: [ ^ self ].
		[ client := FogBugzClient loginUser: credentials key password: credentials value.
		  FogBugzClient credentials: credentials ]
			on: Error
			do: [ :err |
				credentials := nil.
				UIManager default alert: err messageText title: 'Could not log into Fogbugz.' ] ].
	[
		FGBCaseCreator new
			contentTemplate: ('The following issue has been found in {1} class:

The following code snippet(s) allows to reproduce the issue:
' format: { classConcerned name });
			adaptToClient: client;
			openWithSpec
	] ensure: [ client logout ].
]

{ #category : #execution }
FBGOpenCaseForClass >> prepareFullExecutionInContext: aBrowserContext [
	super prepareFullExecutionInContext: aBrowserContext.
	
	classConcerned := aBrowserContext lastSelectedClass.
]
