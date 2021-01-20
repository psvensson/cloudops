Class {
	#name : #CoConnection,
	#superclass : #Object,
	#instVars : [
		'token'
	],
	#category : #CloudOps
}

{ #category : #'mocking instance creation' }
CoConnection class >> withValidToken [
	^self new 
		token: CoToken valid;
		yourself
]

{ #category : #testing }
CoConnection >> canConnect [
	token ifNil: [ ^false ].
	^token isValid
]

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
