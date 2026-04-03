// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

fileprivate enum CodingKeys: String, CodingKey {
    case variantValueType
    case pvtPointValue
    case pvtCallActionValue
    case pvtSetDigitalOutputActionValue
    case pvtSetAllDigitalOutputsActionValue
    case pvtSetAnalogOutputActionValue
    case pvtSetAllAnalogOutputsActionValue
    case pvtCancelOutputScheduleActionValue
    case pvtCancelAllOutputsScheduleActionValue
}


/**
 * Union of all data types that can appear in a PVT sequence.
 */
public enum PvtSequenceItem: Serializable {
    /**
     * Holds the value when the variant contains type PvtPoint.
     */
    case pvtPoint(PvtPoint)

    /**
     * Holds the value when the variant contains type PvtCallAction.
     */
    case pvtCallAction(PvtCallAction)

    /**
     * Holds the value when the variant contains type PvtSetDigitalOutputAction.
     */
    case pvtSetDigitalOutputAction(PvtSetDigitalOutputAction)

    /**
     * Holds the value when the variant contains type PvtSetAllDigitalOutputsAction.
     */
    case pvtSetAllDigitalOutputsAction(PvtSetAllDigitalOutputsAction)

    /**
     * Holds the value when the variant contains type PvtSetAnalogOutputAction.
     */
    case pvtSetAnalogOutputAction(PvtSetAnalogOutputAction)

    /**
     * Holds the value when the variant contains type PvtSetAllAnalogOutputsAction.
     */
    case pvtSetAllAnalogOutputsAction(PvtSetAllAnalogOutputsAction)

    /**
     * Holds the value when the variant contains type PvtCancelOutputScheduleAction.
     */
    case pvtCancelOutputScheduleAction(PvtCancelOutputScheduleAction)

    /**
     * Holds the value when the variant contains type PvtCancelAllOutputsScheduleAction.
     */
    case pvtCancelAllOutputsScheduleAction(PvtCancelAllOutputsScheduleAction)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let tag = try container.decode(String.self, forKey: CodingKeys.variantValueType)
        switch tag {
        case "PvtPoint":
            let value = try container.decode(PvtPoint.self, forKey: CodingKeys.pvtPointValue)
            self = .pvtPoint(value)
        case "PvtCallAction":
            let value = try container.decode(PvtCallAction.self, forKey: CodingKeys.pvtCallActionValue)
            self = .pvtCallAction(value)
        case "PvtSetDigitalOutputAction":
            let value = try container.decode(PvtSetDigitalOutputAction.self, forKey: CodingKeys.pvtSetDigitalOutputActionValue)
            self = .pvtSetDigitalOutputAction(value)
        case "PvtSetAllDigitalOutputsAction":
            let value = try container.decode(PvtSetAllDigitalOutputsAction.self, forKey: CodingKeys.pvtSetAllDigitalOutputsActionValue)
            self = .pvtSetAllDigitalOutputsAction(value)
        case "PvtSetAnalogOutputAction":
            let value = try container.decode(PvtSetAnalogOutputAction.self, forKey: CodingKeys.pvtSetAnalogOutputActionValue)
            self = .pvtSetAnalogOutputAction(value)
        case "PvtSetAllAnalogOutputsAction":
            let value = try container.decode(PvtSetAllAnalogOutputsAction.self, forKey: CodingKeys.pvtSetAllAnalogOutputsActionValue)
            self = .pvtSetAllAnalogOutputsAction(value)
        case "PvtCancelOutputScheduleAction":
            let value = try container.decode(PvtCancelOutputScheduleAction.self, forKey: CodingKeys.pvtCancelOutputScheduleActionValue)
            self = .pvtCancelOutputScheduleAction(value)
        case "PvtCancelAllOutputsScheduleAction":
            let value = try container.decode(PvtCancelAllOutputsScheduleAction.self, forKey: CodingKeys.pvtCancelAllOutputsScheduleActionValue)
            self = .pvtCancelAllOutputsScheduleAction(value)
        default:
            throw SerializationError.deserializationFailed(object: "PvtSequenceItem",
                error: SerializationError.invalidBsonKey(message: "Unknown variant tag \(tag)"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .pvtPoint(let value):
            try container.encode("PvtPoint", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.pvtPointValue)
        case .pvtCallAction(let value):
            try container.encode("PvtCallAction", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.pvtCallActionValue)
        case .pvtSetDigitalOutputAction(let value):
            try container.encode("PvtSetDigitalOutputAction", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.pvtSetDigitalOutputActionValue)
        case .pvtSetAllDigitalOutputsAction(let value):
            try container.encode("PvtSetAllDigitalOutputsAction", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.pvtSetAllDigitalOutputsActionValue)
        case .pvtSetAnalogOutputAction(let value):
            try container.encode("PvtSetAnalogOutputAction", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.pvtSetAnalogOutputActionValue)
        case .pvtSetAllAnalogOutputsAction(let value):
            try container.encode("PvtSetAllAnalogOutputsAction", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.pvtSetAllAnalogOutputsActionValue)
        case .pvtCancelOutputScheduleAction(let value):
            try container.encode("PvtCancelOutputScheduleAction", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.pvtCancelOutputScheduleActionValue)
        case .pvtCancelAllOutputsScheduleAction(let value):
            try container.encode("PvtCancelAllOutputsScheduleAction", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.pvtCancelAllOutputsScheduleActionValue)
        }
    }

}
