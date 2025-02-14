/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct AxisToStringRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var typeOverride: String

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, typeOverride: String = "") {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.typeOverride = typeOverride
    }

    public static func fromByteArray(_ byteArray: Data) throws -> AxisToStringRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(AxisToStringRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "AxisToStringRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "AxisToStringRequest", error: error)
        }
    }
}
