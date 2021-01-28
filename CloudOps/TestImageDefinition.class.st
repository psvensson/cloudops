Class {
	#name : #TestImageDefinition,
	#superclass : #TestCase,
	#category : #CloudOps
}

{ #category : #tests }
TestImageDefinition >> testImageDefinitionHasDefaultPharoVersion [
	self assert: CoImageDefinition new pharoVersion equals: Smalltalk version
]

{ #category : #tests }
TestImageDefinition >> testImageDefinitionHasPharoVersion [
	|otherVersion imageDefinition |
	otherVersion := 'Pharo7.0.0'.
	imageDefinition := CoImageDefinition new pharoVersion: otherVersion.
	self assert: imageDefinition pharoVersion equals: otherVersion
]

{ #category : #tests }
TestImageDefinition >> testImageDefinitionNeedsMetacelloScriptAndName [
	| imageDefinition |
	imageDefinition := CoImageDefinition new.
	self deny: imageDefinition isValid.
	imageDefinition metacelloDefinition: 'no real test'.
	self deny: imageDefinition isValid.
	imageDefinition name: 'Test ImageDefinition'.
	self assert: imageDefinition isValid.
	
]
