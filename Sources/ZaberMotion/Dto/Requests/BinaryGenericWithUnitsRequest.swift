/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoBinary
import UnitsInternal


public struct BinaryGenericWithUnitsRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var command: DtoBinary.CommandCode
    public var data: Double
    public var fromUnit: Units
    public var toUnit: Units
    public var timeout: Double

    public init(interfaceId: Int = 0, device: Int = 0, command: DtoBinary.CommandCode = CommandCode(rawValue: 0)!, data: Double = 0.0, fromUnit: Units = Units.native, toUnit: Units = Units.native, timeout: Double = 0.0) {
        self.interfaceId = interfaceId
        self.device = device
        self.command = command
        self.data = data
        self.fromUnit = fromUnit
        self.toUnit = toUnit
        self.timeout = timeout
    }

    public static func fromByteArray(_ byteArray: Data) throws -> BinaryGenericWithUnitsRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(BinaryGenericWithUnitsRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "BinaryGenericWithUnitsRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "BinaryGenericWithUnitsRequest", error: error)
        }
    }
}
