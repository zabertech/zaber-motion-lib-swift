/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import Dto


public struct ObjectiveChangerChangeRequest: Serializable {
    public var interfaceId: Int
    public var turretAddress: Int
    public var focusAddress: Int
    public var focusAxis: Int
    public var objective: Int
    public var focusOffset: Dto.Measurement?

    public init(interfaceId: Int = 0, turretAddress: Int = 0, focusAddress: Int = 0, focusAxis: Int = 0, objective: Int = 0, focusOffset: Dto.Measurement? = nil) {
        self.interfaceId = interfaceId
        self.turretAddress = turretAddress
        self.focusAddress = focusAddress
        self.focusAxis = focusAxis
        self.objective = objective
        self.focusOffset = focusOffset
    }

    public static func fromByteArray(_ byteArray: Data) throws -> ObjectiveChangerChangeRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(ObjectiveChangerChangeRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "ObjectiveChangerChangeRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "ObjectiveChangerChangeRequest", error: error)
        }
    }
}
