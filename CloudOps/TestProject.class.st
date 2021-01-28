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
	|imageDefinition imageName| 
	imageName := 'New Image definition'.
	imageDefinition := project defineImage:imageName .
	self assert: project imageDefinitions size equals: 1.
	self assert: (project imageDefinitionNamed: imageName) equals: imageDefinition
	
]

{ #category : #tests }
TestProject >> testProjectKnowsImageDefinitions [
	self assert: project imageDefinitions size equals: 0
]

{ #category : #tests }
TestProject >> testProjectNeedsServiceAccount [
	self deny: project isValid.
	project serviceAccount: CoServiceAccount validOne.
	self assert: project isValid
]

{ #category : #tests }
TestProject >> testProjectNeedsServiceAccountWithValidGoogleData [
	self deny: project isValid.
	project serviceAccount: (CoServiceAccount fromGoogle: '{}').
	self deny: project isValid.
	project serviceAccount: (CoServiceAccount fromGoogle: '{"private_key":"1"}').
	self assert: project isValid

]
