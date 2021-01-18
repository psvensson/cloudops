Class {
	#name : #TestConnections,
	#superclass : #TestCase,
	#instVars : [
		'context'
	],
	#category : #CloudOps
}

{ #category : #running }
TestConnections >> setUp [ 
	context := self
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
	^ #foo
]
