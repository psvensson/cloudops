"
A project is connected to one token. Development, test, acceptance and production usually have different tokens and are different projects
"
Class {
	#name : #CoProject,
	#superclass : #Object,
	#instVars : [
		'connection',
		'imageDefinitions',
		'serviceAccount',
		'builds'
	],
	#category : #CloudOps
}

{ #category : #accessing }
CoProject >> builds [
	^builds ifNil: [ builds := OrderedCollection new ]
]

{ #category : #testing }
CoProject >> canConnect [
	^self connection canConnect
]

{ #category : #actions }
CoProject >> connect [
	connection token: serviceAccount connectionToken
]

{ #category : #accessing }
CoProject >> connection [
	^ connection
]

{ #category : #accessing }
CoProject >> connection: aCoConnection [ 
	connection := aCoConnection
]

{ #category : #creation }
CoProject >> createImageDefinition: aString [ 
	| imageDefinition |
	imageDefinition := CoImageDefinition new.
	imageDefinition name: aString.
	^self imageDefinitions add: imageDefinition.
]

{ #category : #'as yet unclassified' }
CoProject >> currentBuilds [
	^builds
]

{ #category : #creation }
CoProject >> imageDefinitionNamed: aName [
	^ (imageDefinitions select: [ :definition | definition name = aName ]) first
]

{ #category : #accessing }
CoProject >> imageDefinitions [
	^imageDefinitions ifNil: [ imageDefinitions := OrderedCollection new ]
]

{ #category : #testing }
CoProject >> isValid [
	^(serviceAccount notNil) and: [  serviceAccount isValid ]
]

{ #category : #accessing }
CoProject >> serviceAccount: aCoServiceAccount [ 
	serviceAccount := aCoServiceAccount.
	connection := CoConnection new
]

{ #category : #accessing }
CoProject >> token [
	connection ifNotNil: [ ^connection token ].
	^nil
]
