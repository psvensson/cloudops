Class {
	#name : #CoServiceAccount,
	#superclass : #Object,
	#instVars : [
		'data',
		'context'
	],
	#category : #CloudOps
}

{ #category : #'instance creation' }
CoServiceAccount class >> fromGoogle: aString [ 
	^self new 
		data: (STONJSON fromString: aString);
		context: CoGoogleContext new;
		yourself
]

{ #category : #'mocking instance' }
CoServiceAccount class >> validOne [
	|anInstance|
	anInstance := self new .
	anInstance data at: #private_key put: 1.
	^anInstance

]

{ #category : #accessing }
CoServiceAccount >> connectionToken [
	^context tokenFor: self
]

{ #category : #accessing }
CoServiceAccount >> context [
	^ context
]

{ #category : #accessing }
CoServiceAccount >> context: aCoContext [ 
	context := aCoContext
]

{ #category : #accessing }
CoServiceAccount >> data [
	^ data
]

{ #category : #accessing }
CoServiceAccount >> data: aDictionary [
	data := aDictionary
	
]

{ #category : #initialization }
CoServiceAccount >> initialize [ 	
	data := Dictionary new.
	context := CoContext new
	
]

{ #category : #testing }
CoServiceAccount >> isValid [
	^ data includesKey: #private_key
]
