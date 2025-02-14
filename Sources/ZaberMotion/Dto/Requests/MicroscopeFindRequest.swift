/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoMicroscopy


public struct MicroscopeFindRequest: Serializable {
    public var interfaceId: Int
    public var thirdParty: DtoMicroscopy.ThirdPartyComponents?

    public init(interfaceId: Int = 0, thirdParty: DtoMicroscopy.ThirdPartyComponents? = nil) {
        self.interfaceId = interfaceId
        self.thirdParty = thirdParty
    }

    public static func fromByteArray(_ byteArray: Data) throws -> MicroscopeFindRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(MicroscopeFindRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "MicroscopeFindRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "MicroscopeFindRequest", error: error)
        }
    }
}
