/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import UnitsInternal
import Dto


public struct UnitConvertNativeRequest: Serializable {
    public var value: Double
    public var values: [Double]
    public var unit: Units
    public var conversion: Dto.UnitConversionDescriptor

    public init(value: Double = 0.0, values: [Double] = [], unit: Units = Units.native, conversion: Dto.UnitConversionDescriptor = UnitConversionDescriptor()) {
        self.value = value
        self.values = values
        self.unit = unit
        self.conversion = conversion
    }

    public static func fromByteArray(_ byteArray: Data) throws -> UnitConvertNativeRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(UnitConvertNativeRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "UnitConvertNativeRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "UnitConvertNativeRequest", error: error)
        }
    }
}
