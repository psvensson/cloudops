Class {
	#name : #TestGoogleServiceAccount,
	#superclass : #TestCase,
	#category : #CloudOps
}

{ #category : #tests }
TestGoogleServiceAccount >> fakeKeyData [
	^'{ 	"type": "service_account", 
	"project_id": "foobar-11111", 
	"private_key_id": "7585858585914fef32111222284", 
	"private_key": "-----BEGIN PRIVATE KEY-----\nMIIE8585858rjrjfjfrViLrCpXFNDcI4XCAnr\n59qIBsbfZBBPP/pia817NiE=\n-----END PRIVATE KEY-----\n",
	"client_email": "98888888350-compute@developer.gserviceaccount.com", 
	"client_id": "19900119920024227", 
	"auth_uri": "https://accounts.google.com/o/oauth2/auth", 
	"token_uri": "https://oauth2.googleapis.com/token", 
	"auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs", 
	"client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/101010101050-compute%40developer.gserviceaccount.com" }'
]

{ #category : #tests }
TestGoogleServiceAccount >> fakeWrongKeyData [
	^'{ 	"type": "service_account", 
	"project_id": "foobar-11111", 
	"private_key_id": "7585858585914fef32111222284", 
	"client_email": "98888888350-compute@developer.gserviceaccount.com", 
	"client_id": "19900119920024227", 
	"auth_uri": "https://accounts.google.com/o/oauth2/auth", 
	"token_uri": "https://oauth2.googleapis.com/token", 
	"auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs", 
	"client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/101010101050-compute%40developer.gserviceaccount.com" }'
]

{ #category : #tests }
TestGoogleServiceAccount >> testFakeGoogleContextCreatesMockingToken [
	|serviceAccount|
	serviceAccount := CoServiceAccount new context: CoGoogleContext new.
	self assert: serviceAccount connectionToken class equals: CoInvalidToken
]

{ #category : #tests }
TestGoogleServiceAccount >> testKeyStructure [
	|results key|
	results := (STONJSON fromString: self fakeKeyData).
	self assert: results size equals: 10.
	self assert: (results includesKey: #private_key).
	key := (results at: #private_key).
	self assert: (key beginsWith: '-----BEGIN PRIVATE KEY-----').
	self assert: (key trimRight endsWith: '-----END PRIVATE KEY-----').
	self deny: (STONJSON fromString: self fakeWrongKeyData) size equals: 10.
	
]

{ #category : #tests }
TestGoogleServiceAccount >> testMockingContextCreatesMockingToken [
	|serviceAccount|
	serviceAccount := CoServiceAccount new context: CoContext new.
	self assert: serviceAccount connectionToken class equals: CoInvalidToken
]

{ #category : #tests }
TestGoogleServiceAccount >> testServiceAccountCanCreateConnectionToken [
	|serviceAccount|
	serviceAccount := CoServiceAccount fromGoogle: self fakeKeyData.
	self assert: serviceAccount connectionToken isValid.
	serviceAccount := CoServiceAccount fromGoogle: self fakeWrongKeyData.
	self deny: serviceAccount connectionToken isValid.
]
