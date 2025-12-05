// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import Dto
import DtoRequests
import ZaberMotionExceptions
import Gateway
import ZaberMotionAscii
import Utils

/**
 Module: ZaberMotionMicroscopy

 Represents an objective changer of a microscope.
 Unstable. Expect breaking changes in future releases.
 Requires at least Firmware 7.32.
 */
public final class ObjectiveChanger: @unchecked Sendable {

    /**
     Module: ZaberMotionMicroscopy

     Creates instance of `ObjectiveChanger` based on the given device.
     If the device is identified, this constructor will ensure it is an objective changer.
     */
    public init(turret: Device, focusAxis: Axis) throws {
        self.turret = turret
        self.focusAxis = focusAxis
        try verifyIsChanger()
    }

    /**
     Module: ZaberMotionMicroscopy

     Device address of the turret.
     */
    public let turret: Device

    /**
     Module: ZaberMotionMicroscopy

     The focus axis.
     */
    public let focusAxis: Axis

    /**
     Module: ZaberMotionMicroscopy

     Changes the objective.
     Runs a sequence of movements switching from the current objective to the new one.
     The focus stage moves to the focus datum after the objective change.

     - Parameters:
        - objective: Objective number starting from 1.
        - focusOffset: Optional offset from the focus datum.
     */
    public func change(objective: Int, focusOffset: Measurement? = nil) async throws  {
        var request = DtoRequests.ObjectiveChangerChangeRequest()
        request.interfaceId = self.turret.connection.interfaceId
        request.turretAddress = self.turret.deviceAddress
        request.focusAddress = self.focusAxis.device.deviceAddress
        request.focusAxis = self.focusAxis.axisNumber
        request.objective = objective
        request.focusOffset = focusOffset

        try await Gateway.callAsync("objective_changer/change", request)
    }

    /**
     Module: ZaberMotionMicroscopy

     Moves the focus stage out of the turret releasing the current objective.
     */
    public func release() async throws  {
        var request = DtoRequests.ObjectiveChangerRequest()
        request.interfaceId = self.turret.connection.interfaceId
        request.turretAddress = self.turret.deviceAddress
        request.focusAddress = self.focusAxis.device.deviceAddress
        request.focusAxis = self.focusAxis.axisNumber

        try await Gateway.callAsync("objective_changer/release", request)
    }

    /**
     Module: ZaberMotionMicroscopy

     Returns current objective number starting from 1.
     The value of 0 indicates that the position is either unknown or between two objectives.

     - Returns: Current objective number starting from 1 or 0 if not applicable.
     */
    public func getCurrentObjective() async throws -> Int {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.turret.connection.interfaceId
        request.device = self.turret.deviceAddress
        request.axis = 1

        let response = try await Gateway.callAsync("device/get_index_position", request, DtoRequests.IntResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMicroscopy

     Gets number of objectives that the turret can accommodate.

     - Returns: Number of positions.
     */
    public func getNumberOfObjectives() async throws -> Int {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.turret.connection.interfaceId
        request.device = self.turret.deviceAddress
        request.axis = 1

        let response = try await Gateway.callAsync("device/get_index_count", request, DtoRequests.IntResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMicroscopy

     Gets the focus datum.
     The focus datum is the position that the focus stage moves to after an objective change.
     It is backed by the limit.home.offset setting.

     - Parameters:
        - unit: Units of datum.

     - Returns: The datum.
     */
    public func getFocusDatum(unit: Units = Units.native) async throws -> Double {
        var request = DtoRequests.ObjectiveChangerSetRequest()
        request.interfaceId = self.turret.connection.interfaceId
        request.turretAddress = self.turret.deviceAddress
        request.focusAddress = self.focusAxis.device.deviceAddress
        request.focusAxis = self.focusAxis.axisNumber
        request.unit = unit

        let response = try await Gateway.callAsync("objective_changer/get_datum", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMicroscopy

     Sets the focus datum.
     The focus datum is the position that the focus stage moves to after an objective change.
     It is backed by the limit.home.offset setting.

     - Parameters:
        - datum: Value of datum.
        - unit: Units of datum.
     */
    public func setFocusDatum(datum: Double, unit: Units = Units.native) async throws  {
        var request = DtoRequests.ObjectiveChangerSetRequest()
        request.interfaceId = self.turret.connection.interfaceId
        request.turretAddress = self.turret.deviceAddress
        request.focusAddress = self.focusAxis.device.deviceAddress
        request.focusAxis = self.focusAxis.axisNumber
        request.value = datum
        request.unit = unit

        try await Gateway.callAsync("objective_changer/set_datum", request)
    }

    /**
     Module: ZaberMotionMicroscopy

     Returns a string that represents the device.

     - Returns: A string that represents the device.
     */
    public func toString() throws -> String {
        var request = DtoRequests.AxisToStringRequest()
        request.interfaceId = self.turret.connection.interfaceId
        request.device = self.turret.deviceAddress

        let response = try Gateway.callSync("device/device_to_string", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMicroscopy

     Checks if this is a objective changer and throws an error if it is not.
     */
    func verifyIsChanger() throws  {
        var request = DtoRequests.ObjectiveChangerRequest()
        request.interfaceId = self.turret.connection.interfaceId
        request.turretAddress = self.turret.deviceAddress
        request.focusAddress = self.focusAxis.device.deviceAddress
        request.focusAxis = self.focusAxis.axisNumber

        try Gateway.callSync("objective_changer/verify", request)
    }

}
