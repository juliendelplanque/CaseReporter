"
List categories available.
"
Class {
	#name : #CRListCategoriesCommand,
	#superclass : #CRTokenCommand,
	#category : #'CaseReporter-FogBugz-Commands'
}

{ #category : #accessing }
CRListCategoriesCommand >> commandName [
	^ 'listCategories'
]
