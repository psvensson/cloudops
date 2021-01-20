"
A project is connected to one token. Development, test, acceptance and production usually have different tokens and are different projects
"
Class {
	#name : #CoProject,
	#superclass : #Object,
	#instVars : [
		'connection',
		'imageDefinitions'
	],
	#category : #CloudOps
}

{ #category : #testing }
CoProject >> canConnect [
	^self connection canConnect
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
CoProject >> defineImage: aString [ 
	| imageDefinition |
	imageDefinition := CoImageDefinition new.
	imageDefinition name: aString.
	^self imageDefinitions add: imageDefinition.
]

{ #category : #accessing }
CoProject >> imageDefinitions [
	^imageDefinitions ifNil: [ imageDefinitions := OrderedCollection new ]
]

{ #category : #accessing }
CoProject >> token [
	connection ifNotNil: [ ^connection token ].
	^nil
]
