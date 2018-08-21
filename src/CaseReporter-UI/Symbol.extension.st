Extension { #name : #Symbol }

{ #category : #'*CaseReporter-UI' }
Symbol >> asCaseReporterWidgetName [
	^ ('CR' , self , 'Presenter') asSymbol
]
