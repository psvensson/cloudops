Class {
	#name : #TestProject,
	#superclass : #TestCase,
	#instVars : [
		'project'
	],
	#category : #CloudOps
}

{ #category : #tests }
TestProject >> setUp [ 
	project := CoProject new
]

{ #category : #tests }
TestProject >> testProjectDefinesImage [
	|image| 
	image := project defineImage: 'New Image definition'.
	self assert: project imageDefinitions size equals: 1.
	
]

{ #category : #tests }
TestProject >> testProjectKnowsImageDefinitions [
	self assert: project imageDefinitions size equals: 0
]
