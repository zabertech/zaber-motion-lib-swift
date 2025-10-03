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
        try self.initializeComponents()
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
    public private(set) var illuminator: Illuminator?

    /**
     Module: ZaberMotionMicroscopy

     The focus axis.
     */
    public private(set) var focusAxis: Axis?

    /**
     Module: ZaberMotionMicroscopy

     The X axis.
     */
    public private(set) var xAxis: Axis?

    /**
     Module: ZaberMotionMicroscopy

     The Y axis.
     */
    public private(set) var yAxis: Axis?

    /**
     Module: ZaberMotionMicroscopy

     Axis group consisting of X and Y axes representing the plate of the microscope.
     */
    public private(set) var plate: AxisGroup?

    /**
     Module: ZaberMotionMicroscopy

     The objective changer.
     */
    public private(set) var objectiveChanger: ObjectiveChanger?

    /**
     Module: ZaberMotionMicroscopy

     The filter changer.
     */
    public private(set) var filterChanger: FilterChanger?

    /**
     Module: ZaberMotionMicroscopy

     The autofocus feature.
     */
    public private(set) var autofocus: Autofocus?

    /**
     Module: ZaberMotionMicroscopy

     The camera trigger.
     */
    public private(set) var cameraTrigger: CameraTrigger?

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

    /**
     Module: ZaberMotionMicroscopy

     Initializes the components of the microscope based on the configuration.
     */
    private func initializeComponents() throws {
        if let illum = self.config.illuminator, illum > 0 {
            self.illuminator = try Illuminator(device: Device(connection: self.connection, deviceAddress: illum))
        }

        if let focus = self.config.focusAxis, focus.device > 0 {
            self.focusAxis = Axis(device: Device(connection: self.connection, deviceAddress: focus.device), axisNumber: focus.axis)
        }

        if let x = self.config.xAxis, x.device > 0 {
            self.xAxis = Axis(device: Device(connection: self.connection, deviceAddress: x.device), axisNumber: x.axis)
        }

        if let y = self.config.yAxis, y.device > 0 {
            self.yAxis = Axis(device: Device(connection: self.connection, deviceAddress: y.device), axisNumber: y.axis)
        }

        if self.xAxis != nil && self.yAxis != nil {
            self.plate = AxisGroup(axes: [self.xAxis!, self.yAxis!])
        }

        if let changer = self.config.objectiveChanger, changer > 0, let focus = self.focusAxis {
            self.objectiveChanger = try ObjectiveChanger(turret: Device(connection: self.connection, deviceAddress: changer), focusAxis: focus)
        }

        if let filter = self.config.filterChanger, filter > 0 {
            self.filterChanger = FilterChanger(device: Device(connection: self.connection, deviceAddress: filter))
        }

        if let autofocus = self.config.autofocus, autofocus > 0, let focus = self.focusAxis {
            self.autofocus = Autofocus(providerId: autofocus, focusAxis: focus, objectiveTurret: self.objectiveChanger?.turret)
        }

        if let trigger = self.config.cameraTrigger, trigger.device > 0 {
            self.cameraTrigger = CameraTrigger(device: Device(connection: self.connection, deviceAddress: trigger.device), channel: trigger.channel)
        }
    }
}
