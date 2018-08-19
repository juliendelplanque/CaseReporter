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
	#name : #CRCachedClient,
	#superclass : #CRClient,
	#instVars : [
		'cachedAreas',
		'cachedCategories',
		'cachedMilestones',
		'cachedPeople',
		'cachedPriorities',
		'cachedProjects',
		'cachedStatuses'
	],
	#category : #'CaseReporter-Core-Client'
}

{ #category : #accessing }
CRCachedClient >> cachedAreas [
	^ cachedAreas
]

{ #category : #accessing }
CRCachedClient >> cachedAreas: anObject [
	cachedAreas := anObject
]

{ #category : #accessing }
CRCachedClient >> cachedCategories [
	^ cachedCategories
]

{ #category : #accessing }
CRCachedClient >> cachedCategories: anObject [
	cachedCategories := anObject
]

{ #category : #accessing }
CRCachedClient >> cachedMilestones [
	^ cachedMilestones
]

{ #category : #accessing }
CRCachedClient >> cachedMilestones: anObject [
	cachedMilestones := anObject
]

{ #category : #accessing }
CRCachedClient >> cachedPeople [
	^ cachedPeople
]

{ #category : #accessing }
CRCachedClient >> cachedPeople: anObject [
	cachedPeople := anObject
]

{ #category : #accessing }
CRCachedClient >> cachedPriorities [
	^ cachedPriorities
]

{ #category : #accessing }
CRCachedClient >> cachedPriorities: anObject [
	cachedPriorities := anObject
]

{ #category : #accessing }
CRCachedClient >> cachedProjects [
	^ cachedProjects
]

{ #category : #accessing }
CRCachedClient >> cachedProjects: anObject [
	cachedProjects := anObject
]

{ #category : #accessing }
CRCachedClient >> cachedStatuses [
	^ cachedStatuses
]

{ #category : #accessing }
CRCachedClient >> cachedStatuses: anObject [
	cachedStatuses := anObject
]

{ #category : #interacting }
CRCachedClient >> listAreas [
	^ self cachedAreas
		ifNil: [ cachedAreas := super listAreas ]
]

{ #category : #interacting }
CRCachedClient >> listCategories [
	^ self cachedCategories
		ifNil: [ cachedCategories := super listCategories ]
]

{ #category : #interacting }
CRCachedClient >> listMilestones [
	^ self cachedMilestones
		ifNil: [ cachedMilestones := super listMilestones ]
]

{ #category : #interacting }
CRCachedClient >> listPeople [
	^ self cachedPeople
		ifNil: [ cachedPeople := super listPeople ]
]

{ #category : #interacting }
CRCachedClient >> listPriorities [
	^ self cachedPriorities
		ifNil: [ cachedPriorities := super listPriorities ]
]

{ #category : #interacting }
CRCachedClient >> listProjects [
	^ self cachedProjects
		ifNil: [ cachedProjects := super listProjects ]
]

{ #category : #interacting }
CRCachedClient >> listStatuses [
	^ self cachedStatuses
		ifNil: [ cachedStatuses := super listStatuses ]
]
