// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoRequests

/**
 Converts errors from the native library to specific exceptions.
 */
public final class ExceptionConverter {

    // Make constructor unavailable for static class
    @available(*, unavailable) private init() {}

    /**
     Converts errors from the native library to specific exceptions.

     - Parameters:
        - error: Error type from the native library.
        - message: Error message from the native library.
        - customData: Raw unparsed custom data for the exception.

     - Returns: Specific exception converted from native library error.
     */
    public static func convert(error: DtoRequests.Errors, message: String, customData: Data? = nil) throws -> MotionLibException {
        switch error {
            case DtoRequests.Errors.badCommand:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(BadCommandException.self) requires custom data.");
                }
                return try BadCommandException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.badData:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(BadDataException.self) requires custom data.");
                }
                return try BadDataException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.binaryCommandFailed:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(BinaryCommandFailedException.self) requires custom data.");
                }
                return try BinaryCommandFailedException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.commandFailed:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(CommandFailedException.self) requires custom data.");
                }
                return try CommandFailedException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.commandPreempted:
                return CommandPreemptedException(message: message)
            case DtoRequests.Errors.commandTooLong:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(CommandTooLongException.self) requires custom data.");
                }
                return try CommandTooLongException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.connectionClosed:
                return ConnectionClosedException(message: message)
            case DtoRequests.Errors.connectionFailed:
                return ConnectionFailedException(message: message)
            case DtoRequests.Errors.conversionFailed:
                return ConversionFailedException(message: message)
            case DtoRequests.Errors.deviceAddressConflict:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(DeviceAddressConflictException.self) requires custom data.");
                }
                return try DeviceAddressConflictException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.deviceBusy:
                return DeviceBusyException(message: message)
            case DtoRequests.Errors.deviceDbFailed:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(DeviceDbFailedException.self) requires custom data.");
                }
                return try DeviceDbFailedException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.deviceDetectionFailed:
                return DeviceDetectionFailedException(message: message)
            case DtoRequests.Errors.deviceFailed:
                return DeviceFailedException(message: message)
            case DtoRequests.Errors.deviceNotIdentified:
                return DeviceNotIdentifiedException(message: message)
            case DtoRequests.Errors.driverDisabled:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(DriverDisabledException.self) requires custom data.");
                }
                return try DriverDisabledException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.gCodeExecution:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(GCodeExecutionException.self) requires custom data.");
                }
                return try GCodeExecutionException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.gCodeSyntax:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(GCodeSyntaxException.self) requires custom data.");
                }
                return try GCodeSyntaxException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.incompatibleSharedLibrary:
                return IncompatibleSharedLibraryException(message: message)
            case DtoRequests.Errors.internalError:
                return InternalErrorException(message: message)
            case DtoRequests.Errors.invalidArgument:
                return InvalidArgumentException(message: message)
            case DtoRequests.Errors.invalidCsvData:
                return InvalidCsvDataException(message: message)
            case DtoRequests.Errors.invalidData:
                return InvalidDataException(message: message)
            case DtoRequests.Errors.invalidOperation:
                return InvalidOperationException(message: message)
            case DtoRequests.Errors.invalidPacket:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(InvalidPacketException.self) requires custom data.");
                }
                return try InvalidPacketException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.invalidParkState:
                return InvalidParkStateException(message: message)
            case DtoRequests.Errors.invalidRequestData:
                return InvalidRequestDataException(message: message)
            case DtoRequests.Errors.invalidResponse:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(InvalidResponseException.self) requires custom data.");
                }
                return try InvalidResponseException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.ioChannelOutOfRange:
                return IoChannelOutOfRangeException(message: message)
            case DtoRequests.Errors.ioFailed:
                return IoFailedException(message: message)
            case DtoRequests.Errors.lockstepEnabled:
                return LockstepEnabledException(message: message)
            case DtoRequests.Errors.lockstepNotEnabled:
                return LockstepNotEnabledException(message: message)
            case DtoRequests.Errors.movementFailed:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(MovementFailedException.self) requires custom data.");
                }
                return try MovementFailedException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.movementInterrupted:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(MovementInterruptedException.self) requires custom data.");
                }
                return try MovementInterruptedException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.noDeviceFound:
                return NoDeviceFoundException(message: message)
            case DtoRequests.Errors.noValueForKey:
                return NoValueForKeyException(message: message)
            case DtoRequests.Errors.notSupported:
                return NotSupportedException(message: message)
            case DtoRequests.Errors.operationFailed:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(OperationFailedException.self) requires custom data.");
                }
                return try OperationFailedException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.osFailed:
                return OsFailedException(message: message)
            case DtoRequests.Errors.outOfRequestIds:
                return OutOfRequestIdsException(message: message)
            case DtoRequests.Errors.pvtDiscontinuity:
                return PvtDiscontinuityException(message: message)
            case DtoRequests.Errors.pvtExecution:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(PvtExecutionException.self) requires custom data.");
                }
                return try PvtExecutionException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.pvtMode:
                return PvtModeException(message: message)
            case DtoRequests.Errors.pvtMovementFailed:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(PvtMovementFailedException.self) requires custom data.");
                }
                return try PvtMovementFailedException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.pvtMovementInterrupted:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(PvtMovementInterruptedException.self) requires custom data.");
                }
                return try PvtMovementInterruptedException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.pvtSetupFailed:
                return PvtSetupFailedException(message: message)
            case DtoRequests.Errors.remoteMode:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(RemoteModeException.self) requires custom data.");
                }
                return try RemoteModeException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.requestTimeout:
                return RequestTimeoutException(message: message)
            case DtoRequests.Errors.serialPortBusy:
                return SerialPortBusyException(message: message)
            case DtoRequests.Errors.setDeviceStateFailed:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(SetDeviceStateFailedException.self) requires custom data.");
                }
                return try SetDeviceStateFailedException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.setPeripheralStateFailed:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(SetPeripheralStateFailedException.self) requires custom data.");
                }
                return try SetPeripheralStateFailedException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.settingNotFound:
                return SettingNotFoundException(message: message)
            case DtoRequests.Errors.streamDiscontinuity:
                return StreamDiscontinuityException(message: message)
            case DtoRequests.Errors.streamExecution:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(StreamExecutionException.self) requires custom data.");
                }
                return try StreamExecutionException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.streamMode:
                return StreamModeException(message: message)
            case DtoRequests.Errors.streamMovementFailed:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(StreamMovementFailedException.self) requires custom data.");
                }
                return try StreamMovementFailedException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.streamMovementInterrupted:
                guard let customDataUnwrapped = customData else {
                    throw InvalidArgumentException(message: "ExceptionConverter: \(StreamMovementInterruptedException.self) requires custom data.");
                }
                return try StreamMovementInterruptedException(message: message, customData: customDataUnwrapped)
            case DtoRequests.Errors.streamSetupFailed:
                return StreamSetupFailedException(message: message)
            case DtoRequests.Errors.timeout:
                return TimeoutException(message: message)
            case DtoRequests.Errors.transportAlreadyUsed:
                return TransportAlreadyUsedException(message: message)
            case DtoRequests.Errors.unknownRequest:
                return UnknownRequestException(message: message)
        }
    }
}
