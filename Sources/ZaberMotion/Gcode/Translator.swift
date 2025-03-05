// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Darwin
import UnitsInternal
import DtoRequests
import Gateway
import ZaberMotionAscii
import ZaberMotionExceptions
import Utils

/**
 Represents a live G-Code translator.
 It allows to stream G-Code blocks to a connected device.
 It requires a stream to be setup on the device.
 Requires at least Firmware 7.11.
 */
public final class Translator: @unchecked Sendable {

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
     Sets up the translator on top of a provided stream.

     - Parameters:
        - stream: The stream to setup the translator on.
          The stream must be already setup in a live or a store mode.
        - config: Configuration of the translator.

     - Returns: New instance of translator.
     */
    public static func setup(stream: Stream, config: TranslatorConfig? = nil) async throws -> Translator {
        _assertSendable(Translator.self)

        var request = DtoRequests.TranslatorCreateLiveRequest()
        request.device = stream.device.deviceAddress
        request.interfaceId = stream.device.connection.interfaceId
        request.streamId = stream.streamId
        request.config = config

        let response = try await Gateway.callAsync("gcode/create_live", request, DtoRequests.TranslatorCreateResponse.fromByteArray)
        return Translator(translatorId: response.translatorId)
    }

    /**
     Translates a single block (line) of G-code.
     The commands are queued in the underlying stream to ensure smooth continues movement.
     Returning of this method indicates that the commands are queued (not necessarily executed).

     - Parameters:
        - block: Block (line) of G-code.

     - Returns: Result of translation containing the commands sent to the device.
     */
    public func translate(block: String) async throws -> TranslateResult {
        _assertSendable(TranslateResult.self)

        var request = DtoRequests.TranslatorTranslateRequest()
        request.translatorId = self.translatorId
        request.block = block

        return try await Gateway.callAsync("gcode/translate_live", request, TranslateResult.fromByteArray)
    }

    /**
     Flushes the remaining stream commands waiting in optimization buffer into the underlying stream.
     The flush is also performed by M2 and M30 codes.

     - Parameters:
        - waitUntilIdle: Determines whether to wait for the stream to finish all the movements.

     - Returns: The remaining stream commands.
     */
    public func flush(waitUntilIdle: Bool = true) async throws -> [String] {
        var request = DtoRequests.TranslatorFlushLiveRequest()
        request.translatorId = self.translatorId
        request.waitUntilIdle = waitUntilIdle

        let response = try await Gateway.callAsync("gcode/flush_live", request, DtoRequests.TranslatorFlushResponse.fromByteArray)
        return response.commands
    }

    /**
     Resets position of the translator from the underlying stream.
     Call this method after performing a movement outside of translator.
     */
    public func resetPosition() async throws  {
        var request = DtoRequests.TranslatorEmptyRequest()
        request.translatorId = self.translatorId

        try await Gateway.callAsync("gcode/reset_position_from_stream", request)
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
            try Translator.free(translatorId: self.translatorId)
        } catch let e as MotionLibException {
            fputs("ZML Error: \(e.toString())", stderr)
        } catch {
            fputs("System Error: \(error)", stderr)
        }
    }
}
