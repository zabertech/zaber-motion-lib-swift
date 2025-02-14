/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct SetInterfaceChecksumEnabledRequest: Serializable {
    public var interfaceId: Int
    public var isEnabled: Bool

    public init(interfaceId: Int = 0, isEnabled: Bool = false) {
        self.interfaceId = interfaceId
        self.isEnabled = isEnabled
    }

    public static func fromByteArray(_ byteArray: Data) throws -> SetInterfaceChecksumEnabledRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(SetInterfaceChecksumEnabledRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "SetInterfaceChecksumEnabledRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "SetInterfaceChecksumEnabledRequest", error: error)
        }
    }
}
