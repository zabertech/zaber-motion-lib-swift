/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoMicroscopy


public struct MicroscopeEmptyRequest: Serializable {
    public var interfaceId: Int
    public var config: DtoMicroscopy.MicroscopeConfig

    public init(interfaceId: Int = 0, config: DtoMicroscopy.MicroscopeConfig = MicroscopeConfig()) {
        self.interfaceId = interfaceId
        self.config = config
    }

    public static func fromByteArray(_ byteArray: Data) throws -> MicroscopeEmptyRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(MicroscopeEmptyRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "MicroscopeEmptyRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "MicroscopeEmptyRequest", error: error)
        }
    }
}
