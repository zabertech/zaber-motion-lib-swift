// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

fileprivate enum CodingKeys: String, CodingKey {
    case variantValueType
    case binaryCommandFailedExceptionDataValue
    case commandFailedExceptionDataValue
    case commandTooLongExceptionDataValue
    case deviceAddressConflictExceptionDataValue
    case deviceDbFailedExceptionDataValue
    case gCodeExecutionExceptionDataValue
    case gCodeSyntaxExceptionDataValue
    case invalidPacketExceptionDataValue
    case invalidResponseExceptionDataValue
    case movementFailedExceptionDataValue
    case movementInterruptedExceptionDataValue
    case operationFailedExceptionDataValue
    case pvtExecutionExceptionDataValue
    case pvtMovementFailedExceptionDataValue
    case pvtMovementInterruptedExceptionDataValue
    case setDeviceStateExceptionDataValue
    case setPeripheralStateExceptionDataValue
    case streamExecutionExceptionDataValue
    case streamMovementFailedExceptionDataValue
    case streamMovementInterruptedExceptionDataValue
}


/**
 * Union of all exception custom data types. Identifies and carries the structured data for an exception.
 */
public enum ExceptionData: Serializable {
    /**
     * Holds the value when the variant contains type BinaryCommandFailedExceptionData.
     */
    case binaryCommandFailedExceptionData(BinaryCommandFailedExceptionData)

    /**
     * Holds the value when the variant contains type CommandFailedExceptionData.
     */
    case commandFailedExceptionData(CommandFailedExceptionData)

    /**
     * Holds the value when the variant contains type CommandTooLongExceptionData.
     */
    case commandTooLongExceptionData(CommandTooLongExceptionData)

    /**
     * Holds the value when the variant contains type DeviceAddressConflictExceptionData.
     */
    case deviceAddressConflictExceptionData(DeviceAddressConflictExceptionData)

    /**
     * Holds the value when the variant contains type DeviceDbFailedExceptionData.
     */
    case deviceDbFailedExceptionData(DeviceDbFailedExceptionData)

    /**
     * Holds the value when the variant contains type GCodeExecutionExceptionData.
     */
    case gCodeExecutionExceptionData(GCodeExecutionExceptionData)

    /**
     * Holds the value when the variant contains type GCodeSyntaxExceptionData.
     */
    case gCodeSyntaxExceptionData(GCodeSyntaxExceptionData)

    /**
     * Holds the value when the variant contains type InvalidPacketExceptionData.
     */
    case invalidPacketExceptionData(InvalidPacketExceptionData)

    /**
     * Holds the value when the variant contains type InvalidResponseExceptionData.
     */
    case invalidResponseExceptionData(InvalidResponseExceptionData)

    /**
     * Holds the value when the variant contains type MovementFailedExceptionData.
     */
    case movementFailedExceptionData(MovementFailedExceptionData)

    /**
     * Holds the value when the variant contains type MovementInterruptedExceptionData.
     */
    case movementInterruptedExceptionData(MovementInterruptedExceptionData)

    /**
     * Holds the value when the variant contains type OperationFailedExceptionData.
     */
    case operationFailedExceptionData(OperationFailedExceptionData)

    /**
     * Holds the value when the variant contains type PvtExecutionExceptionData.
     */
    case pvtExecutionExceptionData(PvtExecutionExceptionData)

    /**
     * Holds the value when the variant contains type PvtMovementFailedExceptionData.
     */
    case pvtMovementFailedExceptionData(PvtMovementFailedExceptionData)

    /**
     * Holds the value when the variant contains type PvtMovementInterruptedExceptionData.
     */
    case pvtMovementInterruptedExceptionData(PvtMovementInterruptedExceptionData)

    /**
     * Holds the value when the variant contains type SetDeviceStateExceptionData.
     */
    case setDeviceStateExceptionData(SetDeviceStateExceptionData)

    /**
     * Holds the value when the variant contains type SetPeripheralStateExceptionData.
     */
    case setPeripheralStateExceptionData(SetPeripheralStateExceptionData)

    /**
     * Holds the value when the variant contains type StreamExecutionExceptionData.
     */
    case streamExecutionExceptionData(StreamExecutionExceptionData)

    /**
     * Holds the value when the variant contains type StreamMovementFailedExceptionData.
     */
    case streamMovementFailedExceptionData(StreamMovementFailedExceptionData)

    /**
     * Holds the value when the variant contains type StreamMovementInterruptedExceptionData.
     */
    case streamMovementInterruptedExceptionData(StreamMovementInterruptedExceptionData)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let tag = try container.decode(String.self, forKey: CodingKeys.variantValueType)
        switch tag {
        case "BinaryCommandFailedExceptionData":
            let value = try container.decode(BinaryCommandFailedExceptionData.self, forKey: CodingKeys.binaryCommandFailedExceptionDataValue)
            self = .binaryCommandFailedExceptionData(value)
        case "CommandFailedExceptionData":
            let value = try container.decode(CommandFailedExceptionData.self, forKey: CodingKeys.commandFailedExceptionDataValue)
            self = .commandFailedExceptionData(value)
        case "CommandTooLongExceptionData":
            let value = try container.decode(CommandTooLongExceptionData.self, forKey: CodingKeys.commandTooLongExceptionDataValue)
            self = .commandTooLongExceptionData(value)
        case "DeviceAddressConflictExceptionData":
            let value = try container.decode(DeviceAddressConflictExceptionData.self, forKey: CodingKeys.deviceAddressConflictExceptionDataValue)
            self = .deviceAddressConflictExceptionData(value)
        case "DeviceDbFailedExceptionData":
            let value = try container.decode(DeviceDbFailedExceptionData.self, forKey: CodingKeys.deviceDbFailedExceptionDataValue)
            self = .deviceDbFailedExceptionData(value)
        case "GCodeExecutionExceptionData":
            let value = try container.decode(GCodeExecutionExceptionData.self, forKey: CodingKeys.gCodeExecutionExceptionDataValue)
            self = .gCodeExecutionExceptionData(value)
        case "GCodeSyntaxExceptionData":
            let value = try container.decode(GCodeSyntaxExceptionData.self, forKey: CodingKeys.gCodeSyntaxExceptionDataValue)
            self = .gCodeSyntaxExceptionData(value)
        case "InvalidPacketExceptionData":
            let value = try container.decode(InvalidPacketExceptionData.self, forKey: CodingKeys.invalidPacketExceptionDataValue)
            self = .invalidPacketExceptionData(value)
        case "InvalidResponseExceptionData":
            let value = try container.decode(InvalidResponseExceptionData.self, forKey: CodingKeys.invalidResponseExceptionDataValue)
            self = .invalidResponseExceptionData(value)
        case "MovementFailedExceptionData":
            let value = try container.decode(MovementFailedExceptionData.self, forKey: CodingKeys.movementFailedExceptionDataValue)
            self = .movementFailedExceptionData(value)
        case "MovementInterruptedExceptionData":
            let value = try container.decode(MovementInterruptedExceptionData.self, forKey: CodingKeys.movementInterruptedExceptionDataValue)
            self = .movementInterruptedExceptionData(value)
        case "OperationFailedExceptionData":
            let value = try container.decode(OperationFailedExceptionData.self, forKey: CodingKeys.operationFailedExceptionDataValue)
            self = .operationFailedExceptionData(value)
        case "PvtExecutionExceptionData":
            let value = try container.decode(PvtExecutionExceptionData.self, forKey: CodingKeys.pvtExecutionExceptionDataValue)
            self = .pvtExecutionExceptionData(value)
        case "PvtMovementFailedExceptionData":
            let value = try container.decode(PvtMovementFailedExceptionData.self, forKey: CodingKeys.pvtMovementFailedExceptionDataValue)
            self = .pvtMovementFailedExceptionData(value)
        case "PvtMovementInterruptedExceptionData":
            let value = try container.decode(PvtMovementInterruptedExceptionData.self, forKey: CodingKeys.pvtMovementInterruptedExceptionDataValue)
            self = .pvtMovementInterruptedExceptionData(value)
        case "SetDeviceStateExceptionData":
            let value = try container.decode(SetDeviceStateExceptionData.self, forKey: CodingKeys.setDeviceStateExceptionDataValue)
            self = .setDeviceStateExceptionData(value)
        case "SetPeripheralStateExceptionData":
            let value = try container.decode(SetPeripheralStateExceptionData.self, forKey: CodingKeys.setPeripheralStateExceptionDataValue)
            self = .setPeripheralStateExceptionData(value)
        case "StreamExecutionExceptionData":
            let value = try container.decode(StreamExecutionExceptionData.self, forKey: CodingKeys.streamExecutionExceptionDataValue)
            self = .streamExecutionExceptionData(value)
        case "StreamMovementFailedExceptionData":
            let value = try container.decode(StreamMovementFailedExceptionData.self, forKey: CodingKeys.streamMovementFailedExceptionDataValue)
            self = .streamMovementFailedExceptionData(value)
        case "StreamMovementInterruptedExceptionData":
            let value = try container.decode(StreamMovementInterruptedExceptionData.self, forKey: CodingKeys.streamMovementInterruptedExceptionDataValue)
            self = .streamMovementInterruptedExceptionData(value)
        default:
            throw SerializationError.deserializationFailed(object: "ExceptionData",
                error: SerializationError.invalidBsonKey(message: "Unknown variant tag \(tag)"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .binaryCommandFailedExceptionData(let value):
            try container.encode("BinaryCommandFailedExceptionData", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.binaryCommandFailedExceptionDataValue)
        case .commandFailedExceptionData(let value):
            try container.encode("CommandFailedExceptionData", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.commandFailedExceptionDataValue)
        case .commandTooLongExceptionData(let value):
            try container.encode("CommandTooLongExceptionData", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.commandTooLongExceptionDataValue)
        case .deviceAddressConflictExceptionData(let value):
            try container.encode("DeviceAddressConflictExceptionData", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.deviceAddressConflictExceptionDataValue)
        case .deviceDbFailedExceptionData(let value):
            try container.encode("DeviceDbFailedExceptionData", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.deviceDbFailedExceptionDataValue)
        case .gCodeExecutionExceptionData(let value):
            try container.encode("GCodeExecutionExceptionData", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.gCodeExecutionExceptionDataValue)
        case .gCodeSyntaxExceptionData(let value):
            try container.encode("GCodeSyntaxExceptionData", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.gCodeSyntaxExceptionDataValue)
        case .invalidPacketExceptionData(let value):
            try container.encode("InvalidPacketExceptionData", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.invalidPacketExceptionDataValue)
        case .invalidResponseExceptionData(let value):
            try container.encode("InvalidResponseExceptionData", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.invalidResponseExceptionDataValue)
        case .movementFailedExceptionData(let value):
            try container.encode("MovementFailedExceptionData", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.movementFailedExceptionDataValue)
        case .movementInterruptedExceptionData(let value):
            try container.encode("MovementInterruptedExceptionData", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.movementInterruptedExceptionDataValue)
        case .operationFailedExceptionData(let value):
            try container.encode("OperationFailedExceptionData", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.operationFailedExceptionDataValue)
        case .pvtExecutionExceptionData(let value):
            try container.encode("PvtExecutionExceptionData", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.pvtExecutionExceptionDataValue)
        case .pvtMovementFailedExceptionData(let value):
            try container.encode("PvtMovementFailedExceptionData", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.pvtMovementFailedExceptionDataValue)
        case .pvtMovementInterruptedExceptionData(let value):
            try container.encode("PvtMovementInterruptedExceptionData", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.pvtMovementInterruptedExceptionDataValue)
        case .setDeviceStateExceptionData(let value):
            try container.encode("SetDeviceStateExceptionData", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.setDeviceStateExceptionDataValue)
        case .setPeripheralStateExceptionData(let value):
            try container.encode("SetPeripheralStateExceptionData", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.setPeripheralStateExceptionDataValue)
        case .streamExecutionExceptionData(let value):
            try container.encode("StreamExecutionExceptionData", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.streamExecutionExceptionDataValue)
        case .streamMovementFailedExceptionData(let value):
            try container.encode("StreamMovementFailedExceptionData", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.streamMovementFailedExceptionDataValue)
        case .streamMovementInterruptedExceptionData(let value):
            try container.encode("StreamMovementInterruptedExceptionData", forKey: CodingKeys.variantValueType)
            try container.encode(value, forKey: CodingKeys.streamMovementInterruptedExceptionDataValue)
        }
    }

}
