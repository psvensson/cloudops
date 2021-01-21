Class {
	#name : #CoContext,
	#superclass : #Object,
	#category : #CloudOps
}

{ #category : #'as yet unclassified' }
CoContext >> tokenFor: aServiceAccount [
	aServiceAccount isValid 
	ifTrue: [ ^CoToken valid ]
	ifFalse: [ ^CoToken invalid ]
]
