// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import DtoRequests
import DtoAscii
import ZaberMotionExceptions
import Gateway
import ZaberMotionAscii
import Utils

/**
 Module: ZaberMotionProduct

 Represents the controller part of one device - may be either a standalone controller or an integrated controller.
 */
public final class ProcessController: @unchecked Sendable {

    /**
     Module: ZaberMotionProduct

     Creates instance of `ProcessController` of the given device.
     If the device is identified, this constructor will ensure it is a process controller.
     */
    public init(device: Device) throws {
        self.device = device
        try verifyIsProcessController()
    }

    /**
     Module: ZaberMotionProduct

     The base device of this process controller.
     */
    public let device: Device

    /**
     Module: ZaberMotionProduct

     Detects the process controllers on the connection.

     - Parameters:
        - connection: The connection to detect process controllers on.
        - identify: If the Process Controllers should be identified upon detection.

     - Returns: A list of all `ProcessController`s on the connection.
     */
    public static func detect(connection: Connection, identify: Bool = true) async throws -> [ProcessController] {
        _assertSendable(ProcessController.self)

        var request = DtoRequests.DeviceDetectRequest()
        request.type = DeviceType.processController
        request.interfaceId = connection.interfaceId
        request.identifyDevices = identify

        let response = try await Gateway.callAsync("device/detect", request, DtoRequests.DeviceDetectResponse.fromByteArray)
        return try response.devices.map { try ProcessController(device: Device(connection: connection, deviceAddress: $0)) }
    }

    /**
     Module: ZaberMotionProduct

     Gets an Process class instance which allows you to control a particular voltage source.
     Axes are numbered from 1.

     - Parameters:
        - processNumber: Number of process to control.

     - Returns: Process instance.
     */
    public func getProcess(processNumber: Int) throws -> Process {
        guard processNumber > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Invalid value; processes are numbered from 1.")
        }

        return Process(controller: self, processNumber: processNumber)
    }

    /**
     Module: ZaberMotionProduct

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
     Module: ZaberMotionProduct

     Checks if this is a process controller or some other type of device and throws an error if it is not.
     */
    func verifyIsProcessController() throws  {
        var request = DtoRequests.DeviceEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress

        try Gateway.callSync("process_controller/verify", request)
    }

}
