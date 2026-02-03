/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


internal enum BsonKeys: String, CodingKey {
    case variantValueType
    case axisTypeValue
    case ioPortLabelValue
    case int32Value
    case optionalDoubleValue
    case stringArrayValue
}


/**
 * Test case for variant support. Not part of the public API. Do not use.
 */
public enum TestVariant: Serializable {
    /**
     * Holds the value when the variant contains type AxisType.
     */
    case axisType(AxisType)

    /**
     * Holds the value when the variant contains type IoPortLabel.
     */
    case ioPortLabel(IoPortLabel)

    /**
     * Holds the value when the variant contains type int32.
     */
    case int32(Int)

    /**
     * Holds the value when the variant contains type optionalDouble.
     */
    case optionalDouble(Double?)

    /**
     * Holds the value when the variant contains type stringArray.
     */
    case stringArray([String])

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BsonKeys.self)
        let tag = try container.decode(String.self, forKey: BsonKeys.variantValueType)
        switch tag {
        case "AxisType":
            let value = try container.decode(AxisType.self, forKey: BsonKeys.axisTypeValue)
            self = .axisType(value)
        case "IoPortLabel":
            let value = try container.decode(IoPortLabel.self, forKey: BsonKeys.ioPortLabelValue)
            self = .ioPortLabel(value)
        case "int32":
            let value = try container.decode(Int.self, forKey: BsonKeys.int32Value)
            self = .int32(value)
        case "optionalDouble":
            let value = try container.decode(Double?.self, forKey: BsonKeys.optionalDoubleValue)
            self = .optionalDouble(value)
        case "stringArray":
            let value = try container.decode([String].self, forKey: BsonKeys.stringArrayValue)
            self = .stringArray(value)
        default:
            throw SerializationError.deserializationFailed(object: "TestVariant",
                error: SerializationError.invalidBsonKey(message: "Unknown variant tag \(tag)"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: BsonKeys.self)
        switch self {
        case .axisType(let value):
            try container.encode("AxisType", forKey: BsonKeys.variantValueType)
            try container.encode(value, forKey: BsonKeys.axisTypeValue)
        case .ioPortLabel(let value):
            try container.encode("IoPortLabel", forKey: BsonKeys.variantValueType)
            try container.encode(value, forKey: BsonKeys.ioPortLabelValue)
        case .int32(let value):
            try container.encode("int32", forKey: BsonKeys.variantValueType)
            try container.encode(value, forKey: BsonKeys.int32Value)
        case .optionalDouble(let value):
            try container.encode("optionalDouble", forKey: BsonKeys.variantValueType)
            try container.encode(value, forKey: BsonKeys.optionalDoubleValue)
        case .stringArray(let value):
            try container.encode("stringArray", forKey: BsonKeys.variantValueType)
            try container.encode(value, forKey: BsonKeys.stringArrayValue)
        }
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TestVariant {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TestVariant.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TestVariant", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TestVariant", error: error)
        }
    }
}
