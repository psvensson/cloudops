Class {
	#name : #CoGoogleContext,
	#superclass : #CoContext,
	#category : #CloudOps
}

{ #category : #testing }
CoGoogleContext >> isGoogle [
	^true
]

{ #category : #'as yet unclassified' }
CoGoogleContext >> tokenFor: aServiceAccount [
	^super tokenFor: aServiceAccount 
 "   | jws cert iat exp |
    cert := aServiceAccount certificate.
    iat := (DateAndTime now) asUnixTime.
    exp := iat + (59 * 60).
    jws := JsonWebSignature new
        algorithmName: 'RS256';
        payload:
            (JWTClaimsSet new
                at: 'iss' put: (cert at: 'client_email');
                at: 'scope'
                    put: 'https://www.googleapis.com/auth/cloud-platform';
                at: 'aud' put: 'https://oauth2.googleapis.com/token';
                at: 'exp' put: exp;
                at: 'iat' put: iat).
    jws key: ( CCConnection getNakedPrivateKey: (cert at: 'private_key')).
    ^ jws compactSerialized"
]
