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
	dynamicModel instantiatePresenters: self dropListsInstVarsNamesAndDropListPresenters.
	
	self dropListsInstVarsNames with: self clientDropListPragmas do: [ :instVarName :pragma |
		(instVarName value: dynamicModel)
			items: (pragma methodSelector value: self client) ].
		
	layout := SpecLayout composed
				newColumn: [ :c |
					self dropListsInstVarsNames groupsOf: 3 atATimeDo: [ :instVars |
						c
							newRow: [ :r |
								instVars do: [ :symbol |
									r add: symbol ] ] ] ];
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
CRParametersPresenterBuilder >> clientDropListPragmas [
	^ Pragma
		allNamed: self dropListPragmaSelector
		in: self client class
		sortedByArgument: 1
]

{ #category : #accessing }
CRParametersPresenterBuilder >> dropListPragmaSelector [
	^ #crDropList:named:
]

{ #category : #accessing }
CRParametersPresenterBuilder >> dropListsInstVarsNames [
	^ self clientDropListPragmas collectWithIndex: [ :p :i |
		(#droplist , i asString) asSymbol ]
]

{ #category : #accessing }
CRParametersPresenterBuilder >> dropListsInstVarsNamesAndDropListPresenters [
	
	^ self dropListsInstVarsNames
		inject: OrderedCollection new
		into: [ :collection :symbol |
			collection
				add: symbol;
				add: #DropListPresenter;
				yourself ]
]
