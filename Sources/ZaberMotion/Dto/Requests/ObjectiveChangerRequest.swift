/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct ObjectiveChangerRequest: Serializable {
    public var interfaceId: Int
    public var turretAddress: Int
    public var focusAddress: Int
    public var focusAxis: Int

    public init(interfaceId: Int = 0, turretAddress: Int = 0, focusAddress: Int = 0, focusAxis: Int = 0) {
        self.interfaceId = interfaceId
        self.turretAddress = turretAddress
        self.focusAddress = focusAddress
        self.focusAxis = focusAxis
    }

    public static func fromByteArray(_ byteArray: Data) throws -> ObjectiveChangerRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(ObjectiveChangerRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "ObjectiveChangerRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "ObjectiveChangerRequest", error: error)
        }
    }
}
