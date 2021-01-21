Class {
	#name : #CoServiceAccount,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #CloudOps
}

{ #category : #'instance creation' }
CoServiceAccount class >> fromGoogle: aString [ 
	^self new 
		data: (STONJSON fromString: aString);
		yourself
]

{ #category : #accessing }
CoServiceAccount >> connectionToken [
	^self isValid ifTrue: [CoToken valid]
		ifFalse: [ CoToken invalid]
]

{ #category : #accessing }
CoServiceAccount >> data: aDictionary [
	data := aDictionary
	
]

{ #category : #testing }
CoServiceAccount >> isValid [
	^ data includesKey: #private_key
]
