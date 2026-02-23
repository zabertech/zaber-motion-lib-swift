/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii


internal enum CodingKeys: String, CodingKey {
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let tag = try container.decode(String.self, forKey: CodingKeys.variantValueType)
        switch tag {
        case "AxisType":
            let value = try container.decode(AxisType.self, forKey: CodingKeys.axisTypeValue)
            self = .axisType(value)
        case "IoPortLabel":
            let value = try container.decode(IoPortLabel.self, forKey: CodingKeys.ioPortLabelValue)
            self = .ioPortLabel(value)
        case "int32":
            let value = try container.decode(Int.self, forKey: CodingKeys.int32Value)
            self = .int32(value)
        case "optionalDouble":
            let value = try container.decode(Double?.self, forKey: CodingKeys.optionalDoubleValue)
            self = .optionalDouble(value)
        case "stringArray":
            let value = try container.decode([String].self, forKey: CodingKeys.stringArrayValue)
            self = .stringArray(value)
        default:
            throw SerializationError.deserializationFailed(object: "TestVariant",
                error: SerializationError.invalidBsonKey(message: "Unknown variant tag \(tag)"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .axisType(let value):
            try container.encode("AxisType", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.axisTypeValue)
        case .ioPortLabel(let value):
            try container.encode("IoPortLabel", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.ioPortLabelValue)
        case .int32(let value):
            try container.encode("int32", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.int32Value)
        case .optionalDouble(let value):
            try container.encode("optionalDouble", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.optionalDoubleValue)
        case .stringArray(let value):
            try container.encode("stringArray", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.stringArrayValue)
        }
    }

}
