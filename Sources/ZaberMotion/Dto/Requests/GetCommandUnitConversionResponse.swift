/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import Dto


public struct GetCommandUnitConversionResponse: Serializable {
    public var value: [Dto.UnitConversionDescriptor?]

    public init(value: [Dto.UnitConversionDescriptor?] = []) {
        self.value = value
    }

    public static func fromByteArray(_ byteArray: Data) throws -> GetCommandUnitConversionResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(GetCommandUnitConversionResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "GetCommandUnitConversionResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "GetCommandUnitConversionResponse", error: error)
        }
    }
}
