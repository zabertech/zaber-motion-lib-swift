/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct OscilloscopeStartRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var captureLength: Int

    public init(interfaceId: Int = 0, device: Int = 0, captureLength: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.captureLength = captureLength
    }

    public static func fromByteArray(_ byteArray: Data) throws -> OscilloscopeStartRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(OscilloscopeStartRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "OscilloscopeStartRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "OscilloscopeStartRequest", error: error)
        }
    }
}
