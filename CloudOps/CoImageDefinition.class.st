Class {
	#name : #CoImageDefinition,
	#superclass : #Object,
	#instVars : [
		'name',
		'pharoVersion',
		'metacelloDefinition'
	],
	#category : #CloudOps
}

{ #category : #testing }
CoImageDefinition >> isValid [
	^(metacelloDefinition notNil) & (name notNil)
]

{ #category : #accessing }
CoImageDefinition >> metacelloDefinition: aString [ 
	metacelloDefinition := aString
]

{ #category : #accessing }
CoImageDefinition >> name [
	^ name
]

{ #category : #accessing }
CoImageDefinition >> name: aString [ 
	name := aString
]

{ #category : #accessing }
CoImageDefinition >> pharoVersion [
	^pharoVersion ifNil: [ Smalltalk version ]
]

{ #category : #accessing }
CoImageDefinition >> pharoVersion: aString [ 
	pharoVersion := aString
]
