// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

fileprivate enum CodingKeys: String, CodingKey {
    case variantValueType
    case doubleValue
    case measurementValue
}


/**
 * A numerical value, or a Measurement.
 */
public enum MeasurementOrValue: Serializable {
    /**
     * Holds the value when the variant contains type double.
     */
    case double(Double)

    /**
     * Holds the value when the variant contains type Measurement.
     */
    case measurement(Measurement)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let tag = try container.decode(String.self, forKey: CodingKeys.variantValueType)
        switch tag {
        case "double":
            let value = try container.decode(Double.self, forKey: CodingKeys.doubleValue)
            self = .double(value)
        case "Measurement":
            let value = try container.decode(Measurement.self, forKey: CodingKeys.measurementValue)
            self = .measurement(value)
        default:
            throw SerializationError.deserializationFailed(object: "MeasurementOrValue",
                error: SerializationError.invalidBsonKey(message: "Unknown variant tag \(tag)"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .double(let value):
            try container.encode("double", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.doubleValue)
        case .measurement(let value):
            try container.encode("Measurement", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.measurementValue)
        }
    }

}
