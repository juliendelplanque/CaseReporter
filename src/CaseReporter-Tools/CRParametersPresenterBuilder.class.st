Class {
	#name : #CRParametersPresenterBuilder,
	#superclass : #Object,
	#instVars : [
		'client'
	],
	#category : #'CaseReporter-Tools-Utilities'
}

{ #category : #building }
CRParametersPresenterBuilder >> build [
	| dynamicModel layout |
	dynamicModel := DynamicComposablePresenter new.
	dynamicModel instantiatePresenters: self widgetsInstVarsNamesAndPresenters.
	
	self widgetsInstVarsNames with: self widgetsPragmas do: [ :instVarName :pragma |
		(instVarName value: dynamicModel)
			items: (pragma methodSelector value: self client);
			label: (pragma argumentAt: 3);
			displayBlock: [ :item |
				item crString ] ].
		
	layout := SpecLayout composed
				newColumn: [ :c |
					self widgetsInstVarsNames groupsOf: 3 atATimeDo: [ :instVars |
						c
							newRow: [ :r |
								instVars do: [ :symbol |
									r add: symbol ] ] height: ComposablePresenter buttonHeight ] ];
				yourself.
	dynamicModel layout: layout.
	^ dynamicModel
]

{ #category : #accessing }
CRParametersPresenterBuilder >> client [
	^ client
]

{ #category : #accessing }
CRParametersPresenterBuilder >> client: anObject [
	client := anObject
]

{ #category : #accessing }
CRParametersPresenterBuilder >> widgetPragmaSelector [
	^ #crWidget:position:named:
]

{ #category : #accessing }
CRParametersPresenterBuilder >> widgetsInstVarsNames [
	^ self widgetsPragmas collectWithIndex: [ :p :i |
		(#widget , i asString) asSymbol ]
]

{ #category : #accessing }
CRParametersPresenterBuilder >> widgetsInstVarsNamesAndPresenters [
	
	^ (self widgetsInstVarsNames with: self widgetsPragmas collect: [ :instVarName :pragma |
		{ instVarName . (pragma argumentAt: 1) asCaseReporterWidgetName } ]) flattened
]

{ #category : #accessing }
CRParametersPresenterBuilder >> widgetsPragmas [
	^ Pragma
		allNamed: self widgetPragmaSelector
		from: self client class
		to: CRClient
		sortedByArgument: 2
]
