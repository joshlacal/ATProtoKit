//
//  DIDDocHandler.swift
//  ATProtoKit
//
//  Created by Josh LaCalamito on 2/3/24.
//

import Foundation

public struct DIDDocument: ATProtocolCodable, ATProtocolValue {
    let context: [String]
    let id: String
    let alsoKnownAs: [String]
    let verificationMethod: [VerificationMethod]
    let service: [Service]

    enum CodingKeys: String, CodingKey {
        case context = "@context"
        case id, alsoKnownAs, verificationMethod, service
    }

    public func isEqual(to other: any ATProtocolValue) -> Bool {
        guard let otherDIDDoc = other as? DIDDocument else { return false }

        return self.context == otherDIDDoc.context &&
            self.id == otherDIDDoc.id &&
            self.alsoKnownAs == otherDIDDoc.alsoKnownAs &&
            self.verificationMethod == otherDIDDoc.verificationMethod &&
            self.service == otherDIDDoc.service
    }
}

public struct Service: ATProtocolCodable, ATProtocolValue {
    let id, type: String
    let serviceEndpoint: String

    public func isEqual(to other: any ATProtocolValue) -> Bool {
        guard let otherService = other as? Service else { return false }

        return self.id == otherService.id &&
            self.type == otherService.type &&
            self.serviceEndpoint == otherService.serviceEndpoint
    }
}

public struct VerificationMethod: ATProtocolCodable, ATProtocolValue {
    let id, type, controller: String
    let publicKeyMultibase: String

    public func isEqual(to other: any ATProtocolValue) -> Bool {
        guard let otherVerificationMethod = other as? VerificationMethod else { return false }

        return self.id == otherVerificationMethod.id &&
            self.type == otherVerificationMethod.type &&
            self.controller == otherVerificationMethod.controller &&
            self.publicKeyMultibase == otherVerificationMethod.publicKeyMultibase
    }
}

