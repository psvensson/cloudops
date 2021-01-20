Class {
	#name : #CoConnection,
	#superclass : #Object,
	#instVars : [
		'token'
	],
	#category : #CloudOps
}

{ #category : #connectivity }
CoConnection >> isConnected [
	token ifNil: [ ^false ].
	^token isValid
]

{ #category : #accessing }
CoConnection >> token [
	^ token
]

{ #category : #accessing }
CoConnection >> token: aString [ 
	token := aString
]
