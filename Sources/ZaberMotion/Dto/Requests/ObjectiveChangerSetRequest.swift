/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal


public struct ObjectiveChangerSetRequest: Serializable {
    public var interfaceId: Int
    public var turretAddress: Int
    public var focusAddress: Int
    public var focusAxis: Int
    public var value: Double
    public var unit: Units

    public init(interfaceId: Int = 0, turretAddress: Int = 0, focusAddress: Int = 0, focusAxis: Int = 0, value: Double = 0.0, unit: Units = Units.native) {
        self.interfaceId = interfaceId
        self.turretAddress = turretAddress
        self.focusAddress = focusAddress
        self.focusAxis = focusAxis
        self.value = value
        self.unit = unit
    }

    public static func fromByteArray(_ byteArray: Data) throws -> ObjectiveChangerSetRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(ObjectiveChangerSetRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "ObjectiveChangerSetRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "ObjectiveChangerSetRequest", error: error)
        }
    }
}
