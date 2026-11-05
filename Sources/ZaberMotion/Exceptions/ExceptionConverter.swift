// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoRequests
import DtoExceptions

/**
 Converts errors from the native library to specific exceptions.
 */
public final class ExceptionConverter {

    // Make constructor unavailable for static class
    @available(*, unavailable) private init() {}

    /**
     Reconstructs a specific exception from a serialized exception.
     The error type says what the custom data is, so it is simply taken as that.

     - Parameters:
        - serialized: The serialized exception from the native library.

     - Returns: Specific exception converted from the serialized exception.
     */
    public static func deserialize(_ serialized: ExceptionWireFormat) throws -> MotionLibException {
        guard let error = DtoRequests.Errors(rawValue: serialized.type) else {
            let context = DecodingError.Context(codingPath: [], debugDescription: "Unknown error type: \(serialized.type).")
            throw DecodingError.dataCorrupted(context)
        }
        switch error {
            case DtoRequests.Errors.badCommand:
                guard case .commandFailedExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(BadCommandException.self, CommandFailedExceptionData.self)
                }
                return BadCommandException(message: serialized.message, customData: value)
            case DtoRequests.Errors.badData:
                guard case .commandFailedExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(BadDataException.self, CommandFailedExceptionData.self)
                }
                return BadDataException(message: serialized.message, customData: value)
            case DtoRequests.Errors.binaryCommandFailed:
                guard case .binaryCommandFailedExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(BinaryCommandFailedException.self, BinaryCommandFailedExceptionData.self)
                }
                return BinaryCommandFailedException(message: serialized.message, customData: value)
            case DtoRequests.Errors.commandFailed:
                guard case .commandFailedExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(CommandFailedException.self, CommandFailedExceptionData.self)
                }
                return CommandFailedException(message: serialized.message, customData: value)
            case DtoRequests.Errors.commandPreempted:
                return CommandPreemptedException(message: serialized.message)
            case DtoRequests.Errors.commandTooLong:
                guard case .commandTooLongExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(CommandTooLongException.self, CommandTooLongExceptionData.self)
                }
                return CommandTooLongException(message: serialized.message, customData: value)
            case DtoRequests.Errors.connectionClosed:
                return ConnectionClosedException(message: serialized.message)
            case DtoRequests.Errors.connectionFailed:
                return ConnectionFailedException(message: serialized.message)
            case DtoRequests.Errors.conversionFailed:
                return ConversionFailedException(message: serialized.message)
            case DtoRequests.Errors.deviceAddressConflict:
                guard case .deviceAddressConflictExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(DeviceAddressConflictException.self, DeviceAddressConflictExceptionData.self)
                }
                return DeviceAddressConflictException(message: serialized.message, customData: value)
            case DtoRequests.Errors.deviceBusy:
                return DeviceBusyException(message: serialized.message)
            case DtoRequests.Errors.deviceDbFailed:
                guard case .deviceDbFailedExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(DeviceDbFailedException.self, DeviceDbFailedExceptionData.self)
                }
                return DeviceDbFailedException(message: serialized.message, customData: value)
            case DtoRequests.Errors.deviceDetectionFailed:
                return DeviceDetectionFailedException(message: serialized.message)
            case DtoRequests.Errors.deviceFailed:
                return DeviceFailedException(message: serialized.message)
            case DtoRequests.Errors.deviceNotIdentified:
                return DeviceNotIdentifiedException(message: serialized.message)
            case DtoRequests.Errors.driverDisabled:
                guard case .commandFailedExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(DriverDisabledException.self, CommandFailedExceptionData.self)
                }
                return DriverDisabledException(message: serialized.message, customData: value)
            case DtoRequests.Errors.gCodeExecution:
                guard case .gCodeExecutionExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(GCodeExecutionException.self, GCodeExecutionExceptionData.self)
                }
                return GCodeExecutionException(message: serialized.message, customData: value)
            case DtoRequests.Errors.gCodeSyntax:
                guard case .gCodeSyntaxExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(GCodeSyntaxException.self, GCodeSyntaxExceptionData.self)
                }
                return GCodeSyntaxException(message: serialized.message, customData: value)
            case DtoRequests.Errors.ge1xGripperMovementFailed:
                return Ge1xGripperMovementFailedException(message: serialized.message)
            case DtoRequests.Errors.incompatibleSharedLibrary:
                return IncompatibleSharedLibraryException(message: serialized.message)
            case DtoRequests.Errors.internalError:
                return InternalErrorException(message: serialized.message)
            case DtoRequests.Errors.invalidArgument:
                return InvalidArgumentException(message: serialized.message)
            case DtoRequests.Errors.invalidCsvData:
                return InvalidCsvDataException(message: serialized.message)
            case DtoRequests.Errors.invalidData:
                return InvalidDataException(message: serialized.message)
            case DtoRequests.Errors.invalidOperation:
                return InvalidOperationException(message: serialized.message)
            case DtoRequests.Errors.invalidPacket:
                guard case .invalidPacketExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(InvalidPacketException.self, InvalidPacketExceptionData.self)
                }
                return InvalidPacketException(message: serialized.message, customData: value)
            case DtoRequests.Errors.invalidParkState:
                return InvalidParkStateException(message: serialized.message)
            case DtoRequests.Errors.invalidRequestData:
                return InvalidRequestDataException(message: serialized.message)
            case DtoRequests.Errors.invalidResponse:
                guard case .invalidResponseExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(InvalidResponseException.self, InvalidResponseExceptionData.self)
                }
                return InvalidResponseException(message: serialized.message, customData: value)
            case DtoRequests.Errors.ioChannelOutOfRange:
                return IoChannelOutOfRangeException(message: serialized.message)
            case DtoRequests.Errors.ioFailed:
                return IoFailedException(message: serialized.message)
            case DtoRequests.Errors.lockstepEnabled:
                return LockstepEnabledException(message: serialized.message)
            case DtoRequests.Errors.lockstepNotEnabled:
                return LockstepNotEnabledException(message: serialized.message)
            case DtoRequests.Errors.motionLibAggregate:
                let innerExceptions: [MotionLibException] = try serialized.innerExceptions.map { try deserialize($0) }
                return MotionLibAggregateException(message: serialized.message, exceptions: innerExceptions)
            case DtoRequests.Errors.movementFailed:
                guard case .movementFailedExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(MovementFailedException.self, MovementFailedExceptionData.self)
                }
                return MovementFailedException(message: serialized.message, customData: value)
            case DtoRequests.Errors.movementInterrupted:
                guard case .movementInterruptedExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(MovementInterruptedException.self, MovementInterruptedExceptionData.self)
                }
                return MovementInterruptedException(message: serialized.message, customData: value)
            case DtoRequests.Errors.noDeviceFound:
                return NoDeviceFoundException(message: serialized.message)
            case DtoRequests.Errors.noValueForKey:
                return NoValueForKeyException(message: serialized.message)
            case DtoRequests.Errors.notSupported:
                return NotSupportedException(message: serialized.message)
            case DtoRequests.Errors.operationFailed:
                guard case .operationFailedExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(OperationFailedException.self, OperationFailedExceptionData.self)
                }
                return OperationFailedException(message: serialized.message, customData: value)
            case DtoRequests.Errors.osFailed:
                return OsFailedException(message: serialized.message)
            case DtoRequests.Errors.outOfRequestIds:
                return OutOfRequestIdsException(message: serialized.message)
            case DtoRequests.Errors.pvtDiscontinuity:
                return PvtDiscontinuityException(message: serialized.message)
            case DtoRequests.Errors.pvtExecution:
                guard case .pvtExecutionExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(PvtExecutionException.self, PvtExecutionExceptionData.self)
                }
                return PvtExecutionException(message: serialized.message, customData: value)
            case DtoRequests.Errors.pvtMode:
                return PvtModeException(message: serialized.message)
            case DtoRequests.Errors.pvtMovementFailed:
                guard case .pvtMovementFailedExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(PvtMovementFailedException.self, PvtMovementFailedExceptionData.self)
                }
                return PvtMovementFailedException(message: serialized.message, customData: value)
            case DtoRequests.Errors.pvtMovementInterrupted:
                guard case .pvtMovementInterruptedExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(PvtMovementInterruptedException.self, PvtMovementInterruptedExceptionData.self)
                }
                return PvtMovementInterruptedException(message: serialized.message, customData: value)
            case DtoRequests.Errors.pvtSequenceGenerationFailed:
                return PvtSequenceGenerationFailedException(message: serialized.message)
            case DtoRequests.Errors.pvtSetupFailed:
                return PvtSetupFailedException(message: serialized.message)
            case DtoRequests.Errors.remoteMode:
                guard case .commandFailedExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(RemoteModeException.self, CommandFailedExceptionData.self)
                }
                return RemoteModeException(message: serialized.message, customData: value)
            case DtoRequests.Errors.requestTimeout:
                return RequestTimeoutException(message: serialized.message)
            case DtoRequests.Errors.serialPortBusy:
                return SerialPortBusyException(message: serialized.message)
            case DtoRequests.Errors.setDeviceStateFailed:
                guard case .setDeviceStateExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(SetDeviceStateFailedException.self, SetDeviceStateExceptionData.self)
                }
                return SetDeviceStateFailedException(message: serialized.message, customData: value)
            case DtoRequests.Errors.setPeripheralStateFailed:
                guard case .setPeripheralStateExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(SetPeripheralStateFailedException.self, SetPeripheralStateExceptionData.self)
                }
                return SetPeripheralStateFailedException(message: serialized.message, customData: value)
            case DtoRequests.Errors.streamDiscontinuity:
                return StreamDiscontinuityException(message: serialized.message)
            case DtoRequests.Errors.streamExecution:
                guard case .streamExecutionExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(StreamExecutionException.self, StreamExecutionExceptionData.self)
                }
                return StreamExecutionException(message: serialized.message, customData: value)
            case DtoRequests.Errors.streamMode:
                return StreamModeException(message: serialized.message)
            case DtoRequests.Errors.streamMovementFailed:
                guard case .streamMovementFailedExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(StreamMovementFailedException.self, StreamMovementFailedExceptionData.self)
                }
                return StreamMovementFailedException(message: serialized.message, customData: value)
            case DtoRequests.Errors.streamMovementInterrupted:
                guard case .streamMovementInterruptedExceptionData(let value)? = serialized.customData else {
                    throw missingCustomData(StreamMovementInterruptedException.self, StreamMovementInterruptedExceptionData.self)
                }
                return StreamMovementInterruptedException(message: serialized.message, customData: value)
            case DtoRequests.Errors.streamSetupFailed:
                return StreamSetupFailedException(message: serialized.message)
            case DtoRequests.Errors.timeout:
                return TimeoutException(message: serialized.message)
            case DtoRequests.Errors.transportAlreadyUsed:
                return TransportAlreadyUsedException(message: serialized.message)
            case DtoRequests.Errors.unknownRequest:
                return UnknownRequestException(message: serialized.message)
        }
    }

    private static func missingCustomData(_ exceptionType: MotionLibException.Type, _ customDataType: Any.Type) -> DecodingError {
        let context = DecodingError.Context(codingPath: [], debugDescription: "\(exceptionType) requires custom data.")
        return DecodingError.valueNotFound(customDataType, context)
    }
}
