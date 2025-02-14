/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct AlertEventWrapper: Serializable {
    public var interfaceId: Int
    public var alert: DtoAscii.AlertEvent

    public init(interfaceId: Int = 0, alert: DtoAscii.AlertEvent = AlertEvent()) {
        self.interfaceId = interfaceId
        self.alert = alert
    }

    public static func fromByteArray(_ byteArray: Data) throws -> AlertEventWrapper {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(AlertEventWrapper.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "AlertEventWrapper", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "AlertEventWrapper", error: error)
        }
    }
}
