// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import Dto
import DtoRequests
import DtoAscii
import ZaberMotionExceptions
import Gateway
import ZaberMotionAscii
import Utils

/**
 Use to drive voltage for a process such as a heater, valve, Peltier device, etc.
 Requires at least Firmware 7.35.
 */
public final class Process {

    private let axis: Axis

    public init(controller: ProcessController, processNumber: Int) {
        self.controller = controller
        self.processNumber = processNumber
        self.axis = Axis(device: controller.device, axisNumber: processNumber)
        self.settings = AxisSettings(axis: self.axis)
        self.storage = AxisStorage(axis: self.axis)
        self.warnings = Warnings(device: controller.device, axisNumber: processNumber)
    }

    /**
     Controller for this process.
     */
    public let controller: ProcessController

    /**
     The process number identifies the process on the controller.
     */
    public let processNumber: Int

    /**
     Settings and properties of this process.
     */
    public let settings: AxisSettings

    /**
     Key-value storage of this process.
     */
    public let storage: AxisStorage

    /**
     Warnings and faults of this process.
     */
    public let warnings: Warnings

    /**
     Sets the enabled state of the driver.

     - Parameters:
        - enabled: If true (default) enables drive. If false disables.
     */
    public func enable(enabled: Bool = true) async throws  {
        var request = DtoRequests.ProcessOn()
        request.interfaceId = self.controller.device.connection.interfaceId
        request.device = self.controller.device.deviceAddress
        request.axis = self.processNumber
        request.on = enabled

        try await Gateway.callAsync("process-controller/enable", request)
    }

    /**
     Turns this process on. In manual mode, this supplies voltage; in controlled mode, it starts the control loop.

     - Parameters:
        - duration: How long to leave the process on.
        - unit: Units of time.
     */
    public func on(duration: Double = 0, unit: Units = Units.native) async throws  {
        var request = DtoRequests.ProcessOn()
        request.interfaceId = self.controller.device.connection.interfaceId
        request.device = self.controller.device.deviceAddress
        request.axis = self.processNumber
        request.on = true
        request.duration = duration
        request.unit = unit

        try await Gateway.callAsync("process-controller/on", request)
    }

    /**
     Turns this process off.
     */
    public func off() async throws  {
        var request = DtoRequests.ProcessOn()
        request.interfaceId = self.controller.device.connection.interfaceId
        request.device = self.controller.device.deviceAddress
        request.axis = self.processNumber
        request.on = false

        try await Gateway.callAsync("process-controller/on", request)
    }

    /**
     Sets the control mode of this process.

     - Parameters:
        - mode: Mode to set this process to.
     */
    public func setMode(mode: ProcessControllerMode) async throws  {
        var request = DtoRequests.DeviceSetSettingRequest()
        request.interfaceId = self.controller.device.connection.interfaceId
        request.device = self.controller.device.deviceAddress
        request.axis = self.processNumber
        request.setting = "process.control.mode"
        request.value = Double(mode.rawValue)

        try await Gateway.callAsync("device/set_setting", request)
    }

    /**
     Gets the control mode of this process.

     - Returns: Control mode.
     */
    public func getMode() async throws -> ProcessControllerMode {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = self.controller.device.connection.interfaceId
        request.device = self.controller.device.deviceAddress
        request.axis = self.processNumber
        request.setting = "process.control.mode"

        let response = try await Gateway.callAsync("device/get_setting", request, DtoRequests.DoubleResponse.fromByteArray)
        return ProcessControllerMode(rawValue: Int(response.value))!
    }

    /**
     Gets the source used to control this process.

     - Returns: The source providing feedback for this process.
     */
    public func getSource() async throws -> ProcessControllerSource {
        _assertSendable(ProcessControllerSource.self)

        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.controller.device.connection.interfaceId
        request.device = self.controller.device.deviceAddress
        request.axis = self.processNumber

        return try await Gateway.callAsync("process_controller/get_source", request, ProcessControllerSource.fromByteArray)
    }

    /**
     Sets the source used to control this process.

     - Parameters:
        - source: Sets the source that should provide feedback for this process.
     */
    public func setSource(source: ProcessControllerSource) async throws  {
        var request = DtoRequests.SetProcessControllerSource()
        request.interfaceId = self.controller.device.connection.interfaceId
        request.device = self.controller.device.deviceAddress
        request.axis = self.processNumber
        request.source = source

        try await Gateway.callAsync("process_controller/set_source", request)
    }

    /**
     Gets the current value of the source used to control this process.

     - Returns: The current value of this process's controlling source.
     */
    public func getInput() async throws -> Measurement {
        _assertSendable(Measurement.self)

        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.controller.device.connection.interfaceId
        request.device = self.controller.device.deviceAddress
        request.axis = self.processNumber

        return try await Gateway.callAsync("process_controller/get_input", request, Measurement.fromByteArray)
    }

    /**
     Creates an H-bridge between this process and its neighbor. This method is only callable on axis 1 and 3.
     */
    public func bridge() async throws  {
        var request = DtoRequests.ProcessOn()
        request.interfaceId = self.controller.device.connection.interfaceId
        request.device = self.controller.device.deviceAddress
        request.axis = self.processNumber
        request.on = true

        try await Gateway.callAsync("process_controller/bridge", request)
    }

    /**
     Breaks the H-bridge between this process and its neighbor, allowing them to be independently controlled.
     This method is only callable on axis 1 and 3.
     */
    public func unbridge() async throws  {
        var request = DtoRequests.ProcessOn()
        request.interfaceId = self.controller.device.connection.interfaceId
        request.device = self.controller.device.deviceAddress
        request.axis = self.processNumber
        request.on = false

        try await Gateway.callAsync("process_controller/bridge", request)
    }

    /**
     Detects if the given process is in bridging mode.

     - Returns: Whether this process is bridged with its neighbor.
     */
    public func isBridge() async throws -> Bool {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.controller.device.connection.interfaceId
        request.device = self.controller.device.deviceAddress
        request.axis = self.processNumber

        let response = try await Gateway.callAsync("process_controller/is_bridge", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Sends a generic ASCII command to this process' underlying axis.
     For more information refer to: [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_commands).

     - Parameters:
        - command: Command and its parameters.
        - checkErrors: Controls whether to throw an exception when the device rejects the command.
        - timeout: The timeout, in milliseconds, for a device to respond to the command.
          Overrides the connection default request timeout.

     - Returns: A response to the command.
     */
    public func genericCommand(command: String, checkErrors: Bool = true, timeout: Int = 0) async throws -> Response {
        _assertSendable(Response.self)

        var request = DtoRequests.GenericCommandRequest()
        request.interfaceId = self.controller.device.connection.interfaceId
        request.device = self.controller.device.deviceAddress
        request.axis = self.processNumber
        request.command = command
        request.checkErrors = checkErrors
        request.timeout = timeout

        return try await Gateway.callAsync("interface/generic_command", request, Response.fromByteArray)
    }

    /**
     Sends a generic ASCII command to this process and expect multiple responses.
     Responses are returned in order of arrival.
     For more information refer to: [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_commands).

     - Parameters:
        - command: Command and its parameters.
        - checkErrors: Controls whether to throw an exception when a device rejects the command.
        - timeout: The timeout, in milliseconds, for a device to respond to the command.
          Overrides the connection default request timeout.

     - Returns: All responses to the command.
     */
    public func genericCommandMultiResponse(command: String, checkErrors: Bool = true, timeout: Int = 0) async throws -> [Response] {
        _assertSendable(Response.self)

        var request = DtoRequests.GenericCommandRequest()
        request.interfaceId = self.controller.device.connection.interfaceId
        request.device = self.controller.device.deviceAddress
        request.axis = self.processNumber
        request.command = command
        request.checkErrors = checkErrors
        request.timeout = timeout

        let response = try await Gateway.callAsync("interface/generic_command_multi_response", request, DtoRequests.GenericCommandResponseCollection.fromByteArray)
        return response.responses
    }

    /**
     Sends a generic ASCII command to this process without expecting a response and without adding a message ID
     For more information refer to: [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_commands).

     - Parameters:
        - command: Command and its parameters.
     */
    public func genericCommandNoResponse(command: String) async throws  {
        var request = DtoRequests.GenericCommandRequest()
        request.interfaceId = self.controller.device.connection.interfaceId
        request.device = self.controller.device.deviceAddress
        request.axis = self.processNumber
        request.command = command

        try await Gateway.callAsync("interface/generic_command_no_response", request)
    }

    /**
     Returns a serialization of the current process state that can be saved and reapplied.

     - Returns: A serialization of the current state of the process.
     */
    public func getState() async throws -> String {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.controller.device.connection.interfaceId
        request.device = self.controller.device.deviceAddress
        request.axis = self.processNumber

        let response = try await Gateway.callAsync("device/get_state", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Applies a saved state to this process.

     - Parameters:
        - state: The state object to apply to this process.

     - Returns: Reports of any issues that were handled, but caused the state to not be exactly restored.
     */
    public func setState(state: String) async throws -> SetStateAxisResponse {
        _assertSendable(SetStateAxisResponse.self)

        var request = DtoRequests.SetStateRequest()
        request.interfaceId = self.controller.device.connection.interfaceId
        request.device = self.controller.device.deviceAddress
        request.axis = self.processNumber
        request.state = state

        return try await Gateway.callAsync("device/set_axis_state", request, SetStateAxisResponse.fromByteArray)
    }

    /**
     Checks if a state can be applied to this process.
     This only covers exceptions that can be determined statically such as mismatches of ID or version,
     the process of applying the state can still fail when running.

     - Parameters:
        - state: The state object to check against.

     - Returns: An explanation of why this state cannot be set to this process.
     */
    public func canSetState(state: String) async throws -> String? {
        var request = DtoRequests.CanSetStateRequest()
        request.interfaceId = self.controller.device.connection.interfaceId
        request.device = self.controller.device.deviceAddress
        request.axis = self.processNumber
        request.state = state

        let response = try await Gateway.callAsync("device/can_set_axis_state", request, DtoRequests.CanSetStateAxisResponse.fromByteArray)
        return response.error
    }

    /**
     Returns a string that represents the process.

     - Returns: A string that represents the process.
     */
    public func toString() throws -> String {
        var request = DtoRequests.AxisToStringRequest()
        request.interfaceId = self.controller.device.connection.interfaceId
        request.device = self.controller.device.deviceAddress
        request.axis = self.processNumber
        request.typeOverride = "Process"

        let response = try Gateway.callSync("device/axis_to_string", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

}
