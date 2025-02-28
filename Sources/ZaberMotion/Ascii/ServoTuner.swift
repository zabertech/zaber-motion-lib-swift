﻿// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import DtoRequests
import Gateway
import ZaberMotionExceptions
import Utils

/**
 Exposes the capabilities to inspect and edit an axis' servo tuning.
 Requires at least Firmware 6.25 or 7.00.
 */
public final class ServoTuner: @unchecked Sendable {

    /**
     Creates instance of ServoTuner for the given axis.
     */
    public init(axis: Axis) {
        self.axis = axis
    }

    /**
     The axis that will be tuned.
     */
    public let axis: Axis

    /**
     Get the paramset that this device uses by default when it starts up.

     - Returns: The paramset used when the device restarts.
     */
    public func getStartupParamset() async throws -> ServoTuningParamset {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber

        let response = try await Gateway.callAsync("servotuning/get_startup_set", request, DtoRequests.ServoTuningParamsetResponse.fromByteArray)
        return response.paramset
    }

    /**
     Set the paramset that this device uses by default when it starts up.

     - Parameters:
        - paramset: The paramset to use at startup.
     */
    public func setStartupParamset(paramset: ServoTuningParamset) async throws  {
        var request = DtoRequests.ServoTuningRequest()
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
        request.paramset = paramset

        try await Gateway.callAsync("servotuning/set_startup_set", request)
    }

    /**
     Load the values from one paramset into another.

     - Parameters:
        - toParamset: The paramset to load into.
        - fromParamset: The paramset to load from.
     */
    public func loadParamset(toParamset: ServoTuningParamset, fromParamset: ServoTuningParamset) async throws  {
        var request = DtoRequests.LoadParamset()
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
        request.toParamset = toParamset
        request.fromParamset = fromParamset

        try await Gateway.callAsync("servotuning/load_paramset", request)
    }

    /**
     Get the full set of tuning parameters used by the firmware driving this axis.

     - Parameters:
        - paramset: The paramset to get tuning for.

     - Returns: The raw representation of the current tuning.
     */
    public func getTuning(paramset: ServoTuningParamset) async throws -> ParamsetInfo {
        _assertSendable(ParamsetInfo.self)

        var request = DtoRequests.ServoTuningRequest()
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
        request.paramset = paramset

        return try await Gateway.callAsync("servotuning/get_raw", request, ParamsetInfo.fromByteArray)
    }

    /**
     Set individual tuning parameters.
     Only use this method if you have a strong understanding of Zaber specific tuning parameters.

     - Parameters:
        - paramset: The paramset to set tuning of.
        - tuningParams: The params to set.
        - setUnspecifiedToDefault: If true, any tuning parameters not included in TuningParams
          are reset to their default values.
     */
    public func setTuning(paramset: ServoTuningParamset, tuningParams: [ServoTuningParam], setUnspecifiedToDefault: Bool = false) async throws  {
        var request = DtoRequests.SetServoTuningRequest()
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
        request.paramset = paramset
        request.tuningParams = tuningParams
        request.setUnspecifiedToDefault = setUnspecifiedToDefault

        try await Gateway.callAsync("servotuning/set_raw", request)
    }

    /**
     Sets the tuning of a paramset using the PID method.

     - Parameters:
        - paramset: The paramset to get tuning for.
        - p: The proportional gain. Must be in units of N/m.
        - i: The integral gain. Must be in units of N/m⋅s.
        - d: The derivative gain. Must be in units of N⋅s/m.
        - fc: The cutoff frequency. Must be in units of Hz.

     - Returns: The PID representation of the current tuning after your changes have been applied.
     */
    public func setPidTuning(paramset: ServoTuningParamset, p: Double, i: Double, d: Double, fc: Double) async throws -> PidTuning {
        _assertSendable(PidTuning.self)

        var request = DtoRequests.SetServoTuningPIDRequest()
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
        request.paramset = paramset
        request.p = p
        request.i = i
        request.d = d
        request.fc = fc

        return try await Gateway.callAsync("servotuning/set_pid", request, PidTuning.fromByteArray)
    }

    /**
     Gets the PID representation of this paramset's servo tuning.

     - Parameters:
        - paramset: The paramset to get tuning for.

     - Returns: The PID representation of the current tuning.
     */
    public func getPidTuning(paramset: ServoTuningParamset) async throws -> PidTuning {
        _assertSendable(PidTuning.self)

        var request = DtoRequests.ServoTuningRequest()
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
        request.paramset = paramset

        return try await Gateway.callAsync("servotuning/get_pid", request, PidTuning.fromByteArray)
    }

    /**
     Gets the parameters that are required to tune this device.

     - Returns: The tuning parameters.
     */
    public func getSimpleTuningParamDefinitions() async throws -> [SimpleTuningParamDefinition] {
        _assertSendable(SimpleTuningParamDefinition.self)

        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber

        let response = try await Gateway.callAsync("servotuning/get_simple_params_definition", request, DtoRequests.GetSimpleTuningParamDefinitionResponse.fromByteArray)
        return response.params
    }

    /**
     Set the tuning of this device using the simple input method.

     - Parameters:
        - paramset: The paramset to set tuning for.
        - tuningParams: The params used to tune this device.
          To get what parameters are expected, call GetSimpleTuningParamList.
          All values must be between 0 and 1.
        - loadMass: The mass loaded on the stage (excluding the mass of the carriage itself) in kg.
        - carriageMass: The mass of the carriage in kg. If this value is not set the default carriage mass is used.
     */
    public func setSimpleTuning(paramset: ServoTuningParamset, tuningParams: [ServoTuningParam], loadMass: Double, carriageMass: Double? = nil) async throws  {
        var request = DtoRequests.SetSimpleTuning()
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
        request.paramset = paramset
        request.tuningParams = tuningParams
        request.loadMass = loadMass
        request.carriageMass = carriageMass

        try await Gateway.callAsync("servotuning/set_simple_tuning", request)
    }

    /**
     Get the simple tuning parameters for this device.

     - Parameters:
        - paramset: The paramset to get tuning for.

     - Returns: The simple tuning parameters.
     */
    public func getSimpleTuning(paramset: ServoTuningParamset) async throws -> SimpleTuning {
        _assertSendable(SimpleTuning.self)

        var request = DtoRequests.ServoTuningRequest()
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
        request.paramset = paramset

        return try await Gateway.callAsync("servotuning/get_simple_tuning", request, SimpleTuning.fromByteArray)
    }

    /**
     Checks if the provided simple tuning is being stored by this paramset.

     - Parameters:
        - paramset: The paramset to set tuning for.
        - tuningParams: The params used to tune this device.
          To get what parameters are expected, call GetSimpleTuningParamList.
          All values must be between 0 and 1.
        - loadMass: The mass loaded on the stage (excluding the mass of the carriage itself) in kg.
        - carriageMass: The mass of the carriage in kg. If this value is not set the default carriage mass is used.

     - Returns: True if the provided simple tuning is currently stored in this paramset.
     */
    @available(*, deprecated, message: "Use GetSimpleTuning instead.")
    public func isUsingSimpleTuning(paramset: ServoTuningParamset, tuningParams: [ServoTuningParam], loadMass: Double, carriageMass: Double? = nil) async throws -> Bool {
        var request = DtoRequests.SetSimpleTuning()
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
        request.paramset = paramset
        request.tuningParams = tuningParams
        request.loadMass = loadMass
        request.carriageMass = carriageMass

        let response = try await Gateway.callAsync("servotuning/is_using_simple_tuning", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

}
