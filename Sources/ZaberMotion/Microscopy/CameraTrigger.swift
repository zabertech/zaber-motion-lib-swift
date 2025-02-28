// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import DtoRequests
import ZaberMotionExceptions
import Gateway
import ZaberMotionAscii

/**
 An abstraction over a device and it's digital output channel.
 */
public final class CameraTrigger: @unchecked Sendable {

    /**
     Creates instance of `CameraTrigger` based on the given device and digital output channel.
     */
    public init(device: Device, channel: Int) {
        self.device = device
        self.channel = channel
    }

    /**
     The device whose digital output triggers the camera.
     */
    public let device: Device

    /**
     The digital output channel that triggers the camera.
     */
    public let channel: Int

    /**
     Triggers the camera.
     Schedules trigger pulse on the digital output channel.
     By default, the method waits until the trigger pulse is finished.

     - Parameters:
        - pulseWidth: The time duration of the trigger pulse.
          Depending on the camera setting, the argument can be use to specify exposure.
        - unit: Units of time.
        - wait: If false, the method does not wait until the trigger pulse is finished.
     */
    public func trigger(pulseWidth: Double, unit: Units = Units.native, wait: Bool = true) async throws  {
        var request = DtoRequests.MicroscopeTriggerCameraRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.channelNumber = self.channel
        request.delay = pulseWidth
        request.unit = unit
        request.wait = wait

        try await Gateway.callAsync("microscope/trigger_camera", request)
    }

    /**
     Returns a string that represents the device.

     - Returns: A string that represents the device.
     */
    public func toString() throws -> String {
        var request = DtoRequests.AxisToStringRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress

        let response = try Gateway.callSync("device/device_to_string", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

}
