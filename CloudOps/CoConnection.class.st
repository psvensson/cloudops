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
	 ^ token isNotNil
]

{ #category : #accessing }
CoConnection >> token [
	^ token
]

{ #category : #accessing }
CoConnection >> token: aString [ 
	token := aString
]
