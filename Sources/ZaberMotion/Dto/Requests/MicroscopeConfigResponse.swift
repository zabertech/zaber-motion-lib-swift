/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoMicroscopy


public struct MicroscopeConfigResponse: Serializable {
    public var config: DtoMicroscopy.MicroscopeConfig

    public init(config: DtoMicroscopy.MicroscopeConfig = MicroscopeConfig()) {
        self.config = config
    }

    public static func fromByteArray(_ byteArray: Data) throws -> MicroscopeConfigResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(MicroscopeConfigResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "MicroscopeConfigResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "MicroscopeConfigResponse", error: error)
        }
    }
}
