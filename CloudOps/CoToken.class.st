Class {
	#name : #CoToken,
	#superclass : #Object,
	#category : #CloudOps
}

{ #category : #'mocking instance creation' }
CoToken class >> invalid [
	^CoInvalidToken new
]

{ #category : #'mocking instance creation' }
CoToken class >> valid [
	^CoValidToken new
]
