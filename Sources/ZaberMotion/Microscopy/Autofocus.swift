﻿// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
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

 A generic autofocus device.
 */
public final class Autofocus: @unchecked Sendable {

    /**
     Module: ZaberMotionMicroscopy

     Creates instance of `Autofocus` based on the given provider id.
     */
    public init(providerId: Int, focusAxis: Axis, objectiveTurret: Device?) {
        self.providerId = providerId
        self.focusAxis = focusAxis
        self.objectiveTurret = objectiveTurret
    }

    /**
     Module: ZaberMotionMicroscopy

     The identification of external device providing the capability.
     */
    public let providerId: Int

    /**
     Module: ZaberMotionMicroscopy

     The focus axis.
     */
    public let focusAxis: Axis

    /**
     Module: ZaberMotionMicroscopy

     The objective turret device if the microscope has one.
     */
    public let objectiveTurret: Device?

    /**
     Module: ZaberMotionMicroscopy

     Sets the current focus to be target for the autofocus control loop.
     */
    public func setFocusZero() async throws  {
        var request = DtoRequests.EmptyAutofocusRequest()
        request.providerId = self.providerId
        request.interfaceId = self.focusAxis.device.connection.interfaceId
        request.focusAddress = self.focusAxis.device.deviceAddress
        request.focusAxis = self.focusAxis.axisNumber
        request.turretAddress = objectiveTurret?.deviceAddress ?? 0

        try await Gateway.callAsync("autofocus/set_zero", request)
    }

    /**
     Module: ZaberMotionMicroscopy

     Returns the status of the autofocus.

     - Returns: The status of the autofocus.
     */
    public func getStatus() async throws -> AutofocusStatus {
        _assertSendable(AutofocusStatus.self)

        var request = DtoRequests.EmptyAutofocusRequest()
        request.providerId = self.providerId
        request.interfaceId = self.focusAxis.device.connection.interfaceId
        request.focusAddress = self.focusAxis.device.deviceAddress
        request.focusAxis = self.focusAxis.axisNumber
        request.turretAddress = objectiveTurret?.deviceAddress ?? 0

        let response = try await Gateway.callAsync("autofocus/get_status", request, DtoRequests.AutofocusGetStatusResponse.fromByteArray)
        return response.status
    }

    /**
     Module: ZaberMotionMicroscopy

     Moves the device until it's in focus.

     - Parameters:
        - scan: If true, the autofocus will approach from the limit moving until it's in range.
        - timeout: Sets autofocus timeout duration in milliseconds.
     */
    public func focusOnce(scan: Bool = false, timeout: Int = -1) async throws  {
        var request = DtoRequests.AutofocusFocusRequest()
        request.providerId = self.providerId
        request.interfaceId = self.focusAxis.device.connection.interfaceId
        request.focusAddress = self.focusAxis.device.deviceAddress
        request.focusAxis = self.focusAxis.axisNumber
        request.turretAddress = objectiveTurret?.deviceAddress ?? 0
        request.once = true
        request.scan = scan
        request.timeout = timeout

        try await Gateway.callAsync("autofocus/focus_once", request)
    }

    /**
     Module: ZaberMotionMicroscopy

     Moves the focus axis continuously maintaining focus.
     Starts the autofocus control loop.
     Note that the control loop may stop if the autofocus comes out of range or a movement error occurs.
     Use WaitUntilIdle of the focus axis to wait for the loop to stop and handle potential errors.
     */
    public func startFocusLoop() async throws  {
        var request = DtoRequests.AutofocusFocusRequest()
        request.providerId = self.providerId
        request.interfaceId = self.focusAxis.device.connection.interfaceId
        request.focusAddress = self.focusAxis.device.deviceAddress
        request.focusAxis = self.focusAxis.axisNumber
        request.turretAddress = objectiveTurret?.deviceAddress ?? 0

        try await Gateway.callAsync("autofocus/start_focus_loop", request)
    }

    /**
     Module: ZaberMotionMicroscopy

     Stops autofocus control loop.
     If the focus axis already stopped moving because of an error, an exception will be thrown.
     */
    public func stopFocusLoop() async throws  {
        var request = DtoRequests.EmptyAutofocusRequest()
        request.providerId = self.providerId
        request.interfaceId = self.focusAxis.device.connection.interfaceId
        request.focusAddress = self.focusAxis.device.deviceAddress
        request.focusAxis = self.focusAxis.axisNumber
        request.turretAddress = objectiveTurret?.deviceAddress ?? 0

        try await Gateway.callAsync("autofocus/stop_focus_loop", request)
    }

    /**
     Module: ZaberMotionMicroscopy

     Returns bool indicating whether the focus axis is busy.
     Can be used to determine if the focus loop is running.

     - Returns: True if the axis is currently executing a motion command.
     */
    public func isBusy() async throws -> Bool {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.focusAxis.device.connection.interfaceId
        request.device = self.focusAxis.device.deviceAddress
        request.axis = self.focusAxis.axisNumber

        let response = try await Gateway.callAsync("device/is_busy", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMicroscopy

     Gets the lower motion limit for the autofocus control loop.
     Gets motion.tracking.limit.min setting of the focus axis.

     - Parameters:
        - unit: The units of the limit.

     - Returns: Limit value.
     */
    public func getLimitMin(unit: Units = Units.native) async throws -> Double {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = self.focusAxis.device.connection.interfaceId
        request.device = self.focusAxis.device.deviceAddress
        request.axis = self.focusAxis.axisNumber
        request.setting = "motion.tracking.limit.min"
        request.unit = unit

        let response = try await Gateway.callAsync("device/get_setting", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMicroscopy

     Gets the upper motion limit for the autofocus control loop.
     Gets motion.tracking.limit.max setting of the focus axis.

     - Parameters:
        - unit: The units of the limit.

     - Returns: Limit value.
     */
    public func getLimitMax(unit: Units = Units.native) async throws -> Double {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = self.focusAxis.device.connection.interfaceId
        request.device = self.focusAxis.device.deviceAddress
        request.axis = self.focusAxis.axisNumber
        request.setting = "motion.tracking.limit.max"
        request.unit = unit

        let response = try await Gateway.callAsync("device/get_setting", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMicroscopy

     Sets the lower motion limit for the autofocus control loop.
     Use the limits to prevent the focus axis from crashing into the sample.
     Changes motion.tracking.limit.min setting of the focus axis.

     - Parameters:
        - limit: The lower limit of the focus axis.
        - unit: The units of the limit.
     */
    public func setLimitMin(limit: Double, unit: Units = Units.native) async throws  {
        var request = DtoRequests.DeviceSetSettingRequest()
        request.interfaceId = self.focusAxis.device.connection.interfaceId
        request.device = self.focusAxis.device.deviceAddress
        request.axis = self.focusAxis.axisNumber
        request.setting = "motion.tracking.limit.min"
        request.value = limit
        request.unit = unit

        try await Gateway.callAsync("device/set_setting", request)
    }

    /**
     Module: ZaberMotionMicroscopy

     Sets the upper motion limit for the autofocus control loop.
     Use the limits to prevent the focus axis from crashing into the sample.
     Changes motion.tracking.limit.max setting of the focus axis.

     - Parameters:
        - limit: The upper limit of the focus axis.
        - unit: The units of the limit.
     */
    public func setLimitMax(limit: Double, unit: Units = Units.native) async throws  {
        var request = DtoRequests.DeviceSetSettingRequest()
        request.interfaceId = self.focusAxis.device.connection.interfaceId
        request.device = self.focusAxis.device.deviceAddress
        request.axis = self.focusAxis.axisNumber
        request.setting = "motion.tracking.limit.max"
        request.value = limit
        request.unit = unit

        try await Gateway.callAsync("device/set_setting", request)
    }

    /**
     Module: ZaberMotionMicroscopy

     Typically, the control loop parameters and objective are kept synchronized by the library.
     If the parameters or current objective changes outside of the library, call this method to synchronize them.
     */
    public func synchronizeParameters() async throws  {
        var request = DtoRequests.EmptyAutofocusRequest()
        request.providerId = self.providerId
        request.interfaceId = self.focusAxis.device.connection.interfaceId
        request.focusAddress = self.focusAxis.device.deviceAddress
        request.focusAxis = self.focusAxis.axisNumber
        request.turretAddress = objectiveTurret?.deviceAddress ?? 0

        try await Gateway.callAsync("autofocus/sync_params", request)
    }

    /**
     Module: ZaberMotionMicroscopy

     Sets the parameters for the autofocus objective.
     Note that the method temporarily switches current objective to set the parameters.

     - Parameters:
        - objective: The objective (numbered from 1) to set the parameters for.
          If your microscope has only one objective, use value of 1.
        - parameters: The parameters for the autofocus objective.
     */
    public func setObjectiveParameters(objective: Int, parameters: [NamedParameter]) async throws  {
        var request = DtoRequests.AutofocusSetObjectiveParamsRequest()
        request.providerId = self.providerId
        request.interfaceId = self.focusAxis.device.connection.interfaceId
        request.focusAddress = self.focusAxis.device.deviceAddress
        request.focusAxis = self.focusAxis.axisNumber
        request.turretAddress = objectiveTurret?.deviceAddress ?? 0
        request.objective = objective
        request.parameters = parameters

        try await Gateway.callAsync("autofocus/set_objective_params", request)
    }

    /**
     Module: ZaberMotionMicroscopy

     Returns the parameters for the autofocus objective.

     - Parameters:
        - objective: The objective (numbered from 1) to get the parameters for.
          If your microscope has only one objective, use value of 1.
          Note that the method temporarily switches current objective to get the parameters.

     - Returns: The parameters for the autofocus objective.
     */
    public func getObjectiveParameters(objective: Int) async throws -> [NamedParameter] {
        _assertSendable(NamedParameter.self)

        var request = DtoRequests.AutofocusGetObjectiveParamsRequest()
        request.providerId = self.providerId
        request.interfaceId = self.focusAxis.device.connection.interfaceId
        request.focusAddress = self.focusAxis.device.deviceAddress
        request.focusAxis = self.focusAxis.axisNumber
        request.turretAddress = objectiveTurret?.deviceAddress ?? 0
        request.objective = objective

        let response = try await Gateway.callAsync("autofocus/get_objective_params", request, DtoRequests.AutofocusGetObjectiveParamsResponse.fromByteArray)
        return response.parameters
    }

    /**
     Module: ZaberMotionMicroscopy

     Returns a string that represents the autofocus.

     - Returns: A string that represents the autofocus.
     */
    public func toString() throws -> String {
        var request = DtoRequests.EmptyAutofocusRequest()
        request.providerId = self.providerId
        request.interfaceId = self.focusAxis.device.connection.interfaceId
        request.focusAddress = self.focusAxis.device.deviceAddress
        request.focusAxis = self.focusAxis.axisNumber
        request.turretAddress = objectiveTurret?.deviceAddress ?? 0

        let response = try Gateway.callSync("autofocus/to_string", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

}
