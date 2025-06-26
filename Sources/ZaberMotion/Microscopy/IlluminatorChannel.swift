// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Dto
import DtoRequests
import ZaberMotionExceptions
import Gateway
import ZaberMotionAscii
import Utils

/**
 Module: ZaberMotionMicroscopy

 Use to control a channel (LED lamp) on an illuminator.
 Requires at least Firmware 7.09.
 */
public final class IlluminatorChannel: @unchecked Sendable {

    private let axis: Axis

    package init(illuminator: Illuminator, channelNumber: Int) {
        self.illuminator = illuminator
        self.channelNumber = channelNumber
        self.axis = Axis(device: illuminator.device, axisNumber: channelNumber)
        self.settings = AxisSettings(axis: self.axis)
        self.storage = AxisStorage(axis: self.axis)
        self.warnings = Warnings(device: illuminator.device, axisNumber: channelNumber)
    }

    /**
     Module: ZaberMotionMicroscopy

     Illuminator of this channel.
     */
    public let illuminator: Illuminator

    /**
     Module: ZaberMotionMicroscopy

     The channel number identifies the channel on the illuminator.
     */
    public let channelNumber: Int

    /**
     Module: ZaberMotionMicroscopy

     Settings and properties of this channel.
     */
    public let settings: AxisSettings

    /**
     Module: ZaberMotionMicroscopy

     Key-value storage of this channel.
     */
    public let storage: AxisStorage

    /**
     Module: ZaberMotionMicroscopy

     Warnings and faults of this channel.
     */
    public let warnings: Warnings

    /**
     Module: ZaberMotionMicroscopy

     Turns this channel on.
     */
    public func on() async throws  {
        var request = DtoRequests.ChannelOn()
        request.interfaceId = self.illuminator.device.connection.interfaceId
        request.device = self.illuminator.device.deviceAddress
        request.axis = self.channelNumber
        request.on = true

        try await Gateway.callAsync("illuminator/on", request)
    }

    /**
     Module: ZaberMotionMicroscopy

     Turns this channel off.
     */
    public func off() async throws  {
        var request = DtoRequests.ChannelOn()
        request.interfaceId = self.illuminator.device.connection.interfaceId
        request.device = self.illuminator.device.deviceAddress
        request.axis = self.channelNumber
        request.on = false

        try await Gateway.callAsync("illuminator/on", request)
    }

    /**
     Module: ZaberMotionMicroscopy

     Turns this channel on or off.

     - Parameters:
        - on: True to turn channel on, false to turn it off.
     */
    public func setOn(on: Bool) async throws  {
        var request = DtoRequests.ChannelOn()
        request.interfaceId = self.illuminator.device.connection.interfaceId
        request.device = self.illuminator.device.deviceAddress
        request.axis = self.channelNumber
        request.on = on

        try await Gateway.callAsync("illuminator/on", request)
    }

    /**
     Module: ZaberMotionMicroscopy

     Checks if this channel is on.

     - Returns: True if channel is on, false otherwise.
     */
    public func isOn() async throws -> Bool {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.illuminator.device.connection.interfaceId
        request.device = self.illuminator.device.deviceAddress
        request.axis = self.channelNumber

        let response = try await Gateway.callAsync("illuminator/is_on", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMicroscopy

     Sets channel intensity as a fraction of the maximum flux.

     - Parameters:
        - intensity: Fraction of intensity to set (between 0 and 1).
     */
    public func setIntensity(intensity: Double) async throws  {
        var request = DtoRequests.ChannelSetIntensity()
        request.interfaceId = self.illuminator.device.connection.interfaceId
        request.device = self.illuminator.device.deviceAddress
        request.axis = self.channelNumber
        request.intensity = intensity

        try await Gateway.callAsync("illuminator/set_intensity", request)
    }

    /**
     Module: ZaberMotionMicroscopy

     Gets the current intensity of this channel.

     - Returns: Current intensity as fraction of maximum flux.
     */
    public func getIntensity() async throws -> Double {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.illuminator.device.connection.interfaceId
        request.device = self.illuminator.device.deviceAddress
        request.axis = self.channelNumber

        let response = try await Gateway.callAsync("illuminator/get_intensity", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMicroscopy

     Sends a generic ASCII command to this channel.
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
        request.interfaceId = self.illuminator.device.connection.interfaceId
        request.device = self.illuminator.device.deviceAddress
        request.axis = self.channelNumber
        request.command = command
        request.checkErrors = checkErrors
        request.timeout = timeout

        let response = try await Gateway.callAsync("interface/generic_command", request, Response.fromByteArray)
        return response
    }

    /**
     Module: ZaberMotionMicroscopy

     Sends a generic ASCII command to this channel and expects multiple responses.
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
        request.interfaceId = self.illuminator.device.connection.interfaceId
        request.device = self.illuminator.device.deviceAddress
        request.axis = self.channelNumber
        request.command = command
        request.checkErrors = checkErrors
        request.timeout = timeout

        let response = try await Gateway.callAsync("interface/generic_command_multi_response", request, DtoRequests.GenericCommandResponseCollection.fromByteArray)
        return response.responses
    }

    /**
     Module: ZaberMotionMicroscopy

     Sends a generic ASCII command to this channel without expecting a response and without adding a message ID
     For more information refer to: [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_commands).

     - Parameters:
        - command: Command and its parameters.
     */
    public func genericCommandNoResponse(command: String) async throws  {
        var request = DtoRequests.GenericCommandRequest()
        request.interfaceId = self.illuminator.device.connection.interfaceId
        request.device = self.illuminator.device.deviceAddress
        request.axis = self.channelNumber
        request.command = command

        try await Gateway.callAsync("interface/generic_command_no_response", request)
    }

    /**
     Module: ZaberMotionMicroscopy

     Returns a serialization of the current channel state that can be saved and reapplied.

     - Returns: A serialization of the current state of the channel.
     */
    public func getState() async throws -> String {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.illuminator.device.connection.interfaceId
        request.device = self.illuminator.device.deviceAddress
        request.axis = self.channelNumber

        let response = try await Gateway.callAsync("device/get_state", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMicroscopy

     Applies a saved state to this channel.

     - Parameters:
        - state: The state object to apply to this channel.

     - Returns: Reports of any issues that were handled, but caused the state to not be exactly restored.
     */
    public func setState(state: String) async throws -> SetStateAxisResponse {
        _assertSendable(SetStateAxisResponse.self)

        var request = DtoRequests.SetStateRequest()
        request.interfaceId = self.illuminator.device.connection.interfaceId
        request.device = self.illuminator.device.deviceAddress
        request.axis = self.channelNumber
        request.state = state

        let response = try await Gateway.callAsync("device/set_axis_state", request, SetStateAxisResponse.fromByteArray)
        return response
    }

    /**
     Module: ZaberMotionMicroscopy

     Checks if a state can be applied to this channel.
     This only covers exceptions that can be determined statically such as mismatches of ID or version,
     the process of applying the state can still fail when running.

     - Parameters:
        - state: The state object to check against.
        - firmwareVersion: The firmware version of the device to apply the state to.
          Use this to ensure the state will still be compatible after an update.

     - Returns: An explanation of why this state cannot be set to this channel.
     */
    public func canSetState(state: String, firmwareVersion: FirmwareVersion? = nil) async throws -> String? {
        var request = DtoRequests.CanSetStateRequest()
        request.interfaceId = self.illuminator.device.connection.interfaceId
        request.device = self.illuminator.device.deviceAddress
        request.axis = self.channelNumber
        request.state = state
        request.firmwareVersion = firmwareVersion

        let response = try await Gateway.callAsync("device/can_set_axis_state", request, DtoRequests.CanSetStateAxisResponse.fromByteArray)
        return response.error
    }

    /**
     Module: ZaberMotionMicroscopy

     Returns a string that represents the channel.

     - Returns: A string that represents the channel.
     */
    public func toString() throws -> String {
        var request = DtoRequests.AxisToStringRequest()
        request.interfaceId = self.illuminator.device.connection.interfaceId
        request.device = self.illuminator.device.deviceAddress
        request.axis = self.channelNumber
        request.typeOverride = "Channel"

        let response = try Gateway.callSync("device/axis_to_string", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

}
