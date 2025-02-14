/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct ToggleDeviceDbStoreRequest: Serializable {
    public var toggleOn: Bool
    public var storeLocation: String?

    public init(toggleOn: Bool = false, storeLocation: String? = nil) {
        self.toggleOn = toggleOn
        self.storeLocation = storeLocation
    }

    public static func fromByteArray(_ byteArray: Data) throws -> ToggleDeviceDbStoreRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(ToggleDeviceDbStoreRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "ToggleDeviceDbStoreRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "ToggleDeviceDbStoreRequest", error: error)
        }
    }
}
