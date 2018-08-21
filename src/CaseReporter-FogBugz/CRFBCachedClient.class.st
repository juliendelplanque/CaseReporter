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
	#name : #CRFBCachedClient,
	#superclass : #CRFBClient,
	#instVars : [
		'cachedAreas',
		'cachedCategories',
		'cachedMilestones',
		'cachedPeople',
		'cachedPriorities',
		'cachedProjects',
		'cachedStatuses'
	],
	#category : #'CaseReporter-FogBugz-Client'
}

{ #category : #accessing }
CRFBCachedClient >> cachedAreas [
	^ cachedAreas
]

{ #category : #accessing }
CRFBCachedClient >> cachedAreas: anObject [
	cachedAreas := anObject
]

{ #category : #accessing }
CRFBCachedClient >> cachedCategories [
	^ cachedCategories
]

{ #category : #accessing }
CRFBCachedClient >> cachedCategories: anObject [
	cachedCategories := anObject
]

{ #category : #accessing }
CRFBCachedClient >> cachedMilestones [
	^ cachedMilestones
]

{ #category : #accessing }
CRFBCachedClient >> cachedMilestones: anObject [
	cachedMilestones := anObject
]

{ #category : #accessing }
CRFBCachedClient >> cachedPeople [
	^ cachedPeople
]

{ #category : #accessing }
CRFBCachedClient >> cachedPeople: anObject [
	cachedPeople := anObject
]

{ #category : #accessing }
CRFBCachedClient >> cachedPriorities [
	^ cachedPriorities
]

{ #category : #accessing }
CRFBCachedClient >> cachedPriorities: anObject [
	cachedPriorities := anObject
]

{ #category : #accessing }
CRFBCachedClient >> cachedProjects [
	^ cachedProjects
]

{ #category : #accessing }
CRFBCachedClient >> cachedProjects: anObject [
	cachedProjects := anObject
]

{ #category : #accessing }
CRFBCachedClient >> cachedStatuses [
	^ cachedStatuses
]

{ #category : #accessing }
CRFBCachedClient >> cachedStatuses: anObject [
	cachedStatuses := anObject
]

{ #category : #interacting }
CRFBCachedClient >> listAreas [
	^ self cachedAreas
		ifNil: [ cachedAreas := super listAreas ]
]

{ #category : #interacting }
CRFBCachedClient >> listCategories [
	^ self cachedCategories
		ifNil: [ cachedCategories := super listCategories ]
]

{ #category : #interacting }
CRFBCachedClient >> listMilestones [
	^ self cachedMilestones
		ifNil: [ cachedMilestones := super listMilestones ]
]

{ #category : #interacting }
CRFBCachedClient >> listPeople [
	^ self cachedPeople
		ifNil: [ cachedPeople := super listPeople ]
]

{ #category : #interacting }
CRFBCachedClient >> listPriorities [
	^ self cachedPriorities
		ifNil: [ cachedPriorities := super listPriorities ]
]

{ #category : #interacting }
CRFBCachedClient >> listProjects [
	^ self cachedProjects
		ifNil: [ cachedProjects := super listProjects ]
]

{ #category : #interacting }
CRFBCachedClient >> listStatuses [
	^ self cachedStatuses
		ifNil: [ cachedStatuses := super listStatuses ]
]
