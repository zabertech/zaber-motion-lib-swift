/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoMicroscopy


public struct MicroscopeInitRequest: Serializable {
    public var interfaceId: Int
    public var config: DtoMicroscopy.MicroscopeConfig
    public var force: Bool

    public init(interfaceId: Int = 0, config: DtoMicroscopy.MicroscopeConfig = MicroscopeConfig(), force: Bool = false) {
        self.interfaceId = interfaceId
        self.config = config
        self.force = force
    }

    public static func fromByteArray(_ byteArray: Data) throws -> MicroscopeInitRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(MicroscopeInitRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "MicroscopeInitRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "MicroscopeInitRequest", error: error)
        }
    }
}
