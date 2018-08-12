"
List categories available.
"
Class {
	#name : #FGBListCategoriesCommand,
	#superclass : #FGBTokenCommand,
	#category : #'FogBugz-Core-Commands'
}

{ #category : #printing }
FGBListCategoriesCommand >> printOn: aStream [

	aStream
		nextPutAll:
			('{"cmd": "listCategories","token": "<1s>"}' expandMacrosWith: token asString)
]
