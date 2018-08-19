"
I am a client that cache some informations:
- areas
- categories
- milestones
- people
- priorities
- projects
- statuses
"
Class {
	#name : #FGBCachedClient,
	#superclass : #FGBClient,
	#instVars : [
		'cachedAreas',
		'cachedCategories',
		'cachedMilestones',
		'cachedPeople',
		'cachedPriorities',
		'cachedProjects',
		'cachedStatuses'
	],
	#category : #'FogBugz-Core-Client'
}

{ #category : #accessing }
FGBCachedClient >> cachedAreas [
	^ cachedAreas
]

{ #category : #accessing }
FGBCachedClient >> cachedAreas: anObject [
	cachedAreas := anObject
]

{ #category : #accessing }
FGBCachedClient >> cachedCategories [
	^ cachedCategories
]

{ #category : #accessing }
FGBCachedClient >> cachedCategories: anObject [
	cachedCategories := anObject
]

{ #category : #accessing }
FGBCachedClient >> cachedMilestones [
	^ cachedMilestones
]

{ #category : #accessing }
FGBCachedClient >> cachedMilestones: anObject [
	cachedMilestones := anObject
]

{ #category : #accessing }
FGBCachedClient >> cachedPeople [
	^ cachedPeople
]

{ #category : #accessing }
FGBCachedClient >> cachedPeople: anObject [
	cachedPeople := anObject
]

{ #category : #accessing }
FGBCachedClient >> cachedPriorities [
	^ cachedPriorities
]

{ #category : #accessing }
FGBCachedClient >> cachedPriorities: anObject [
	cachedPriorities := anObject
]

{ #category : #accessing }
FGBCachedClient >> cachedProjects [
	^ cachedProjects
]

{ #category : #accessing }
FGBCachedClient >> cachedProjects: anObject [
	cachedProjects := anObject
]

{ #category : #accessing }
FGBCachedClient >> cachedStatuses [
	^ cachedStatuses
]

{ #category : #accessing }
FGBCachedClient >> cachedStatuses: anObject [
	cachedStatuses := anObject
]

{ #category : #interacting }
FGBCachedClient >> listAreas [
	^ self cachedAreas
		ifNil: [ cachedAreas := super listAreas ]
]

{ #category : #interacting }
FGBCachedClient >> listCategories [
	^ self cachedCategories
		ifNil: [ cachedCategories := super listCategories ]
]

{ #category : #interacting }
FGBCachedClient >> listMilestones [
	^ self cachedMilestones
		ifNil: [ cachedMilestones := super listMilestones ]
]

{ #category : #interacting }
FGBCachedClient >> listPeople [
	^ self cachedPeople
		ifNil: [ cachedPeople := super listPeople ]
]

{ #category : #interacting }
FGBCachedClient >> listPriorities [
	^ self cachedPriorities
		ifNil: [ cachedPriorities := super listPriorities ]
]

{ #category : #interacting }
FGBCachedClient >> listProjects [
	^ self cachedProjects
		ifNil: [ cachedProjects := super listProjects ]
]

{ #category : #interacting }
FGBCachedClient >> listStatuses [
	^ self cachedStatuses
		ifNil: [ cachedStatuses := super listStatuses ]
]
