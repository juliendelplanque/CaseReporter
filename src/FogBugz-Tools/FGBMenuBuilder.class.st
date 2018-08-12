"
A menu builder
"
Class {
	#name : #FGBMenuBuilder,
	#superclass : #Object,
	#instVars : [
		'menu'
	],
	#category : #'FogBugz-Tools-Utilities'
}

{ #category : #'instance creation' }
FGBMenuBuilder class >> forMenu: aMenu [

	^(self new)
		menu: aMenu;
		yourself
]

{ #category : #adding }
FGBMenuBuilder >> addItem: aName action: aBlock [
	self group
		addItem: [ :item | 
			item
				name: aName;
				action: aBlock ]
]

{ #category : #adding }
FGBMenuBuilder >> addItem: aName icon: anIcon action: aBlock [
	self group
		addItem: [ :item | 
			item
				name: aName;
				icon: anIcon;
				action: aBlock ]
]

{ #category : #adding }
FGBMenuBuilder >> addItem: aName icon: anIcon subMenu: aMenu [
	self group
		addItem: [ :item | 
			item
				name: aName;
				icon: anIcon;
				subMenu: aMenu ]
]

{ #category : #adding }
FGBMenuBuilder >> addItem: aName subMenu: aMenu [
	self group
		addItem: [ :item | 
			item
				name: aName;
				subMenu: aMenu ]
]

{ #category : #accessing }
FGBMenuBuilder >> group [
	^ menu menuGroups
		ifEmpty: [ menu addGroup: [ :group |  ] ];
		first
]

{ #category : #initialization }
FGBMenuBuilder >> initialize [
 
	super initialize.	
	menu := MenuModel new
]

{ #category : #accessing }
FGBMenuBuilder >> menu [
	^ menu
]

{ #category : #accessing }
FGBMenuBuilder >> menu: aMenu [
	menu := aMenu
]
