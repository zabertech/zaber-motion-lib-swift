// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import DtoRequests
import Gateway
import ZaberMotionExceptions

/**
 Module: ZaberMotionAscii

 Represents all axes of motion associated with a device.
 */
public final class AllAxes: @unchecked Sendable {

    package init(device: Device) {
        self.device = device
    }

    /**
     Module: ZaberMotionAscii

     Device that controls this axis.
     */
    public let device: Device

    /**
     Module: ZaberMotionAscii

     Homes all axes. Axes return to their homing positions.

     - Parameters:
        - waitUntilIdle: Determines whether function should return after the movement is finished or just started.
     */
    public func home(waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.DeviceHomeRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = 0
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("device/home", request)
    }

    /**
     Module: ZaberMotionAscii

     Stops ongoing axes movement. Decelerates until zero speed.

     - Parameters:
        - waitUntilIdle: Determines whether function should return after the movement is finished or just started.
     */
    public func stop(waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.DeviceStopRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = 0
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("device/stop", request)
    }

    /**
     Module: ZaberMotionAscii

     Waits until all axes of device stop moving.

     - Parameters:
        - throwErrorOnFault: Determines whether to throw error when fault is observed.
     */
    public func waitUntilIdle(throwErrorOnFault: Bool = true) async throws  {
        var request = DtoRequests.DeviceWaitUntilIdleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = 0
        request.throwErrorOnFault = throwErrorOnFault

        try await Gateway.callAsync("device/wait_until_idle", request)
    }

    /**
     Module: ZaberMotionAscii

     Parks the device in anticipation of turning the power off.
     It can later be powered on, unparked, and moved without first having to home it.
     */
    public func park() async throws  {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = 0

        try await Gateway.callAsync("device/park", request)
    }

    /**
     Module: ZaberMotionAscii

     Unparks the device. The device will now be able to move.
     */
    public func unpark() async throws  {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = 0

        try await Gateway.callAsync("device/unpark", request)
    }

    /**
     Module: ZaberMotionAscii

     Returns bool indicating whether any axis is executing a motion command.

     - Returns: True if any axis is currently executing a motion command.
     */
    public func isBusy() async throws -> Bool {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = 0

        let response = try await Gateway.callAsync("device/is_busy", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Returns bool indicating whether all axes have position reference and were homed.

     - Returns: True if all axes have position reference and were homed.
     */
    public func isHomed() async throws -> Bool {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = 0

        let response = try await Gateway.callAsync("device/is_homed", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Disables all axes drivers, which prevents current from being sent to the motor or load.
     */
    public func driverDisable() async throws  {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = 0

        try await Gateway.callAsync("device/driver_disable", request)
    }

    /**
     Module: ZaberMotionAscii

     Attempts to enable all axes drivers (where applicable) repeatedly for the specified timeout.
     If the driver is already enabled, the driver remains enabled.

     - Parameters:
        - timeout: Timeout in seconds. Specify 0 to attempt to enable the driver once.
     */
    public func driverEnable(timeout: Double = 10) async throws  {
        var request = DtoRequests.DriverEnableRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = 0
        request.timeout = timeout

        try await Gateway.callAsync("device/driver_enable", request)
    }

    /**
     Module: ZaberMotionAscii

     Returns a string that represents the axes.

     - Returns: A string that represents the axes.
     */
    public func toString() throws -> String {
        var request = DtoRequests.AxisEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = 0

        let response = try Gateway.callSync("device/all_axes_to_string", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

}
