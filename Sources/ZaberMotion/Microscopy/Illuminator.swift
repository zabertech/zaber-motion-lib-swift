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

 Use to manage an LED controller.
 Requires at least Firmware 7.09.
 */
public final class Illuminator: @unchecked Sendable {

    /**
     Module: ZaberMotionMicroscopy

     Creates instance of `Illuminator` based on the given device.
     If the device is identified, this constructor will ensure it is an illuminator.
     */
    public init(device: Device) throws {
        self.device = device
        self.io = DeviceIO(device: device)
        try verifyIsIlluminator()
    }

    /**
     Module: ZaberMotionMicroscopy

     The base device of this illuminator.
     */
    public let device: Device

    /**
     Module: ZaberMotionMicroscopy

     I/O channels of this device.
     */
    public let io: DeviceIO

    /**
     Module: ZaberMotionMicroscopy

     Finds an illuminator on a connection.
     In case of conflict, specify the optional device address.

     - Parameters:
        - connection: Connection on which to detect the illuminator.
        - deviceAddress: Optional device address of the illuminator.

     - Returns: New instance of illuminator.
     */
    public static func find(connection: Connection, deviceAddress: Int = 0) async throws -> Illuminator {
        _assertSendable(Illuminator.self)

        var request = DtoRequests.FindDeviceRequest()
        request.interfaceId = connection.interfaceId
        request.deviceAddress = deviceAddress

        let response = try await Gateway.callAsync("illuminator/detect", request, DtoRequests.FindDeviceResponse.fromByteArray)
        return try Illuminator(device: Device(connection: connection, deviceAddress: response.address))
    }

    /**
     Module: ZaberMotionMicroscopy

     Gets an IlluminatorChannel class instance that allows control of a particular channel.
     Channels are numbered from 1.

     - Parameters:
        - channelNumber: Number of channel to control.

     - Returns: Illuminator channel instance.
     */
    public func getChannel(channelNumber: Int) throws -> IlluminatorChannel {
        guard channelNumber > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Invalid value; channels are numbered from 1.")
        }

        return IlluminatorChannel(illuminator: self, channelNumber: channelNumber)
    }

    /**
     Module: ZaberMotionMicroscopy

     Turns all channels off.
     */
    public func turnOff() async throws  {
        var request = DtoRequests.DeviceEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress

        try await Gateway.callAsync("illuminator/all_off", request)
    }

    /**
     Module: ZaberMotionMicroscopy

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

    /**
     Module: ZaberMotionMicroscopy

     Checks if this is an illuminator or some other type of device and throws an error if it is not.
     */
    func verifyIsIlluminator() throws  {
        var request = DtoRequests.DeviceEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress

        try Gateway.callSync("illuminator/verify", request)
    }

}
