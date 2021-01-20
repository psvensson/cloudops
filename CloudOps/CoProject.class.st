Class {
	#name : #CoProject,
	#superclass : #Object,
	#instVars : [
		'connection'
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

{ #category : #accessing }
CoProject >> token [
	connection ifNotNil: [ ^connection token ].
	^nil
]
