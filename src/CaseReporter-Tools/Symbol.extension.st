Extension { #name : #Symbol }

{ #category : #'*CaseReporter-Tools' }
Symbol >> asCaseReporterWidgetName [
	^ ('CR' , self , 'Presenter') asSymbol
]
