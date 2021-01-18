Class {
	#name : #CoToken,
	#superclass : #Object,
	#category : #CloudOps
}

{ #category : #'instance creation' }
CoToken class >> invalid [
	^CoInvalidToken new
]

{ #category : #'instance creation' }
CoToken class >> valid [
	^CoValidToken new
]
