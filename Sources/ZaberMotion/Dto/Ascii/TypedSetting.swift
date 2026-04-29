// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

fileprivate enum CodingKeys: String, CodingKey {
    case variantValueType
    case doubleValue
    case int64Value
    case boolValue
    case stringValue
}


/**
 * The value of a setting, which can be of various types.
 */
public enum TypedSetting: Serializable {
    /**
     * Holds the value when the variant contains type double.
     */
    case double(Double)

    /**
     * Holds the value when the variant contains type int64.
     */
    case int64(Int64)

    /**
     * Holds the value when the variant contains type bool.
     */
    case bool(Bool)

    /**
     * Holds the value when the variant contains type string.
     */
    case string(String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let tag = try container.decode(String.self, forKey: CodingKeys.variantValueType)
        switch tag {
        case "double":
            let value = try container.decode(Double.self, forKey: CodingKeys.doubleValue)
            self = .double(value)
        case "int64":
            let value = try container.decode(Int64.self, forKey: CodingKeys.int64Value)
            self = .int64(value)
        case "bool":
            let value = try container.decode(Bool.self, forKey: CodingKeys.boolValue)
            self = .bool(value)
        case "string":
            let value = try container.decode(String.self, forKey: CodingKeys.stringValue)
            self = .string(value)
        default:
            throw SerializationError.deserializationFailed(object: "TypedSetting",
                error: SerializationError.invalidBsonKey(message: "Unknown variant tag \(tag)"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .double(let value):
            try container.encode("double", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.doubleValue)
        case .int64(let value):
            try container.encode("int64", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.int64Value)
        case .bool(let value):
            try container.encode("bool", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.boolValue)
        case .string(let value):
            try container.encode("string", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.stringValue)
        }
    }

}
