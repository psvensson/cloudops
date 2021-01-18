Class {
	#name : #TestConnections,
	#superclass : #TestCase,
	#instVars : [
		'context'
	],
	#category : #CloudOps
}

{ #category : #tests }
TestConnections >> invalidToken [
	^ CoToken invalid
]

{ #category : #running }
TestConnections >> setUp [ 
	context := self
]

{ #category : #tests }
TestConnections >> testConnectionWithInvalidToken [
	self deny: (CoConnection new token: (context invalidToken)) isConnected. 

]

{ #category : #tests }
TestConnections >> testConnectionWithToken [
	self assert: (CoConnection new token: (context validToken)) isConnected. 

]

{ #category : #tests }
TestConnections >> testNotConnected [
	self deny: CoConnection new isConnected. 

]

{ #category : #tests }
TestConnections >> validToken [
	^ CoToken valid
]
