// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import DtoRequests
import Gateway
import ZaberMotionAscii
import ZaberMotionExceptions
import Utils

/**
 Represents an offline G-Code translator.
 It allows to translate G-Code blocks to Zaber ASCII protocol stream commands.
 This translator does not need a connected device to perform translation.
 Requires at least Firmware 7.11.
 */
public final class OfflineTranslator: @unchecked Sendable {

    package init(translatorId: Int) {
        self.translatorId = translatorId
    }

    /**
     The ID of the translator that serves to identify native resources.
     */
    public let translatorId: Int

    /**
     Current coordinate system.
     */
    public var coordinateSystem: String {
        get throws { return try getCurrentCoordinateSystem() }
    }

    /**
     Sets up translator from provided device definition and configuration.

     - Parameters:
        - definition: Definition of device and its peripherals.
          The definition must match a device that later performs the commands.
        - config: Configuration of the translator.

     - Returns: New instance of translator.
     */
    public static func setup(definition: DeviceDefinition, config: TranslatorConfig? = nil) async throws -> OfflineTranslator {
        _assertSendable(OfflineTranslator.self)

        var request = DtoRequests.TranslatorCreateRequest()
        request.definition = definition
        request.config = config

        let response = try await Gateway.callAsync("gcode/create", request, DtoRequests.TranslatorCreateResponse.fromByteArray)
        return OfflineTranslator(translatorId: response.translatorId)
    }

    /**
     Sets up an offline translator from provided device, axes, and configuration.

     - Parameters:
        - device: Device that later performs the command streaming.
        - axes: Axis numbers that are later used to setup the stream.
          For a lockstep group specify only the first axis of the group.
        - config: Configuration of the translator.

     - Returns: New instance of translator.
     */
    public static func setupFromDevice(device: Device, axes: [Int], config: TranslatorConfig? = nil) async throws -> OfflineTranslator {
        _assertSendable(OfflineTranslator.self)

        var request = DtoRequests.TranslatorCreateFromDeviceRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.axes = axes
        request.config = config

        let response = try await Gateway.callAsync("gcode/create_from_device", request, DtoRequests.TranslatorCreateResponse.fromByteArray)
        return OfflineTranslator(translatorId: response.translatorId)
    }

    /**
     Translates a single block (line) of G-code.

     - Parameters:
        - block: Block (line) of G-code.

     - Returns: Result of translation containing the stream commands.
     */
    public func translate(block: String) throws -> TranslateResult {
        var request = DtoRequests.TranslatorTranslateRequest()
        request.translatorId = self.translatorId
        request.block = block

        return try Gateway.callSync("gcode/translate", request, TranslateResult.fromByteArray)
    }

    /**
     Flushes the remaining stream commands waiting in optimization buffer.
     The flush is also performed by M2 and M30 codes.

     - Returns: The remaining stream commands.
     */
    public func flush() throws -> [String] {
        var request = DtoRequests.TranslatorEmptyRequest()
        request.translatorId = self.translatorId

        let response = try Gateway.callSync("gcode/flush", request, DtoRequests.TranslatorFlushResponse.fromByteArray)
        return response.commands
    }

    /**
     Sets the speed at which the device moves when traversing (G0).

     - Parameters:
        - traverseRate: The traverse rate.
        - unit: Units of the traverse rate.
     */
    public func setTraverseRate(traverseRate: Double, unit: Units) throws  {
        var request = DtoRequests.TranslatorSetTraverseRateRequest()
        request.translatorId = self.translatorId
        request.traverseRate = traverseRate
        request.unit = unit

        try Gateway.callSync("gcode/set_traverse_rate", request)
    }

    /**
     Sets position of translator's axis.
     Use this method to set position after performing movement outside of the translator.
     This method does not cause any movement.

     - Parameters:
        - axis: Letter of the axis.
        - position: The position.
        - unit: Units of position.
     */
    public func setAxisPosition(axis: String, position: Double, unit: Units) throws  {
        var request = DtoRequests.TranslatorSetAxisPositionRequest()
        request.translatorId = self.translatorId
        request.axis = axis
        request.position = position
        request.unit = unit

        try Gateway.callSync("gcode/set_axis_position", request)
    }

    /**
     Gets position of translator's axis.
     This method does not query device but returns value from translator's state.

     - Parameters:
        - axis: Letter of the axis.
        - unit: Units of position.

     - Returns: Position of translator's axis.
     */
    public func getAxisPosition(axis: String, unit: Units) throws -> Double {
        var request = DtoRequests.TranslatorGetAxisPositionRequest()
        request.translatorId = self.translatorId
        request.axis = axis
        request.unit = unit

        let response = try Gateway.callSync("gcode/get_axis_position", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Sets the home position of translator's axis.
     This position is used by G28.

     - Parameters:
        - axis: Letter of the axis.
        - position: The home position.
        - unit: Units of position.
     */
    public func setAxisHomePosition(axis: String, position: Double, unit: Units) throws  {
        var request = DtoRequests.TranslatorSetAxisPositionRequest()
        request.translatorId = self.translatorId
        request.axis = axis
        request.position = position
        request.unit = unit

        try Gateway.callSync("gcode/set_axis_home", request)
    }

    /**
     Sets the secondary home position of translator's axis.
     This position is used by G30.

     - Parameters:
        - axis: Letter of the axis.
        - position: The home position.
        - unit: Units of position.
     */
    public func setAxisSecondaryHomePosition(axis: String, position: Double, unit: Units) throws  {
        var request = DtoRequests.TranslatorSetAxisPositionRequest()
        request.translatorId = self.translatorId
        request.axis = axis
        request.position = position
        request.unit = unit

        try Gateway.callSync("gcode/set_axis_secondary_home", request)
    }

    /**
     Gets offset of an axis in a given coordinate system.

     - Parameters:
        - coordinateSystem: Coordinate system (e.g. G54).
        - axis: Letter of the axis.
        - unit: Units of position.

     - Returns: Offset in translator units of the axis.
     */
    public func getAxisCoordinateSystemOffset(coordinateSystem: String, axis: String, unit: Units) throws -> Double {
        var request = DtoRequests.TranslatorGetAxisOffsetRequest()
        request.translatorId = self.translatorId
        request.coordinateSystem = coordinateSystem
        request.axis = axis
        request.unit = unit

        let response = try Gateway.callSync("gcode/get_axis_offset", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Resets internal state after device rejected generated command.
     Axis positions become uninitialized.
     */
    public func resetAfterStreamError() throws  {
        var request = DtoRequests.TranslatorEmptyRequest()
        request.translatorId = self.translatorId

        try Gateway.callSync("gcode/reset_after_stream_error", request)
    }

    /**
     Allows to scale feed rate of the translated code by a coefficient.

     - Parameters:
        - coefficient: Coefficient of the original feed rate.
     */
    public func setFeedRateOverride(coefficient: Double) throws  {
        var request = DtoRequests.TranslatorSetFeedRateOverrideRequest()
        request.translatorId = self.translatorId
        request.coefficient = coefficient

        try Gateway.callSync("gcode/set_feed_rate_override", request)
    }

    /**
     Releases native resources of a translator.

     - Parameters:
        - translatorId: The ID of the translator.
     */
    static func free(translatorId: Int) throws  {
        var request = DtoRequests.TranslatorEmptyRequest()
        request.translatorId = translatorId

        try Gateway.callSync("gcode/free", request)
    }

    /**
     Gets current coordinate system (e.g. G54).

     - Returns: Current coordinate system.
     */
    func getCurrentCoordinateSystem() throws -> String {
        var request = DtoRequests.TranslatorEmptyRequest()
        request.translatorId = self.translatorId

        let response = try Gateway.callSync("gcode/get_current_coordinate_system", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    deinit {
        guard self.translatorId >= 0 else { return }

        do {
            try OfflineTranslator.free(translatorId: self.translatorId)
        } catch let e as MotionLibException {
            print("ZML Error: \(e.toString())")
        } catch {
            print("System Error: \(error)")
        }
    }
}
