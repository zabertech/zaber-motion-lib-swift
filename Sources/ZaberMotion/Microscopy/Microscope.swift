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

 Represent a microscope.
 Parts of the microscope may or may not be instantiated depending on the configuration.
 Requires at least Firmware 7.34.
 */
public final class Microscope: @unchecked Sendable {

    private let config: MicroscopeConfig

    /**
     Module: ZaberMotionMicroscopy

     Creates instance of `Microscope` from the given config.
     Parts are instantiated depending on device addresses in the config.
     */
    public init(connection: Connection, config: MicroscopeConfig) throws {
        self.connection = connection
        self.config = config
        self.illuminator = config.illuminator != nil && config.illuminator! > 0 ?
            try Illuminator(device: Device(connection: connection, deviceAddress: config.illuminator!)) : nil
        self.focusAxis = config.focusAxis != nil && config.focusAxis!.device > 0 ?
            Axis(device: Device(connection: connection, deviceAddress: config.focusAxis!.device), axisNumber: config.focusAxis!.axis) : nil
        self.xAxis = config.xAxis != nil && config.xAxis!.device > 0 ?
            Axis(device: Device(connection: connection, deviceAddress: config.xAxis!.device), axisNumber: config.xAxis!.axis) : nil
        self.yAxis = config.yAxis != nil && config.yAxis!.device > 0 ?
            Axis(device: Device(connection: connection, deviceAddress: config.yAxis!.device), axisNumber: config.yAxis!.axis) : nil
        self.plate = xAxis != nil && yAxis != nil ? AxisGroup(axes: [xAxis!, yAxis!]) : nil
        self.objectiveChanger = config.objectiveChanger != nil && config.objectiveChanger! > 0 && focusAxis != nil ?
            try ObjectiveChanger(turret: Device(connection: connection, deviceAddress: config.objectiveChanger!), focusAxis: focusAxis!) : nil
        self.filterChanger = config.filterChanger ?? 0 > 0 ? FilterChanger(device: Device(connection: connection, deviceAddress: config.filterChanger!)) : nil
        self.autofocus = config.autofocus != nil && config.autofocus! > 0 && focusAxis != nil ?
            Autofocus(providerId: config.autofocus!, focusAxis: focusAxis!, objectiveTurret: objectiveChanger?.turret ?? nil) : nil
        self.cameraTrigger = config.cameraTrigger != nil && config.cameraTrigger!.device > 0 ?
            CameraTrigger(device: Device(connection: connection, deviceAddress: config.cameraTrigger!.device), channel: config.cameraTrigger!.channel) : nil
    }

    /**
     Module: ZaberMotionMicroscopy

     Connection of the microscope.
     */
    public let connection: Connection

    /**
     Module: ZaberMotionMicroscopy

     The illuminator.
     */
    public let illuminator: Illuminator?

    /**
     Module: ZaberMotionMicroscopy

     The focus axis.
     */
    public let focusAxis: Axis?

    /**
     Module: ZaberMotionMicroscopy

     The X axis.
     */
    public let xAxis: Axis?

    /**
     Module: ZaberMotionMicroscopy

     The Y axis.
     */
    public let yAxis: Axis?

    /**
     Module: ZaberMotionMicroscopy

     Axis group consisting of X and Y axes representing the plate of the microscope.
     */
    public let plate: AxisGroup?

    /**
     Module: ZaberMotionMicroscopy

     The objective changer.
     */
    public let objectiveChanger: ObjectiveChanger?

    /**
     Module: ZaberMotionMicroscopy

     The filter changer.
     */
    public let filterChanger: FilterChanger?

    /**
     Module: ZaberMotionMicroscopy

     The autofocus feature.
     */
    public let autofocus: Autofocus?

    /**
     Module: ZaberMotionMicroscopy

     The camera trigger.
     */
    public let cameraTrigger: CameraTrigger?

    /**
     Module: ZaberMotionMicroscopy

     Finds a microscope on a connection.

     - Parameters:
        - connection: Connection on which to detect the microscope.
        - thirdPartyComponents: Third party components of the microscope that cannot be found on the connection.

     - Returns: New instance of microscope.
     */
    public static func find(connection: Connection, thirdPartyComponents: ThirdPartyComponents? = nil) async throws -> Microscope {
        _assertSendable(Microscope.self)

        var request = DtoRequests.MicroscopeFindRequest()
        request.interfaceId = connection.interfaceId
        request.thirdParty = thirdPartyComponents

        let response = try await Gateway.callAsync("microscope/detect", request, DtoRequests.MicroscopeConfigResponse.fromByteArray)
        return try Microscope(connection: connection, config: response.config)
    }

    /**
     Module: ZaberMotionMicroscopy

     Initializes the microscope.
     Homes all axes, filter changer, and objective changer if they require it.

     - Parameters:
        - force: Forces all devices to home even when not required.
     */
    public func initialize(force: Bool = false) async throws  {
        var request = DtoRequests.MicroscopeInitRequest()
        request.interfaceId = self.connection.interfaceId
        request.config = config
        request.force = force

        try await Gateway.callAsync("microscope/initialize", request)
    }

    /**
     Module: ZaberMotionMicroscopy

     Checks whether the microscope is initialized.

     - Returns: True, when the microscope is initialized. False, otherwise.
     */
    public func isInitialized() async throws -> Bool {
        var request = DtoRequests.MicroscopeEmptyRequest()
        request.interfaceId = self.connection.interfaceId
        request.config = config

        let response = try await Gateway.callAsync("microscope/is_initialized", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionMicroscopy

     Returns a string that represents the microscope.

     - Returns: A string that represents the microscope.
     */
    public func toString() throws -> String {
        var request = DtoRequests.MicroscopeEmptyRequest()
        request.interfaceId = self.connection.interfaceId
        request.config = config

        let response = try Gateway.callSync("microscope/to_string", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

}
