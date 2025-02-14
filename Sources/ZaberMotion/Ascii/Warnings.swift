// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import DtoRequests
import Gateway
import ZaberMotionExceptions

/**
 Class used to check and reset warnings and faults on device or axis.
 */
public final class Warnings {

    private let device: Device

    private let axisNumber: Int

    public init(device: Device, axisNumber: Int) {
        self.device = device
        self.axisNumber = axisNumber
    }

    /**
     Returns current warnings and faults on axis or device.

     - Returns: Retrieved warnings and faults. Refer to WarningFlags to check a particular flag.
     */
    public func getFlags() async throws -> Set<String> {
        var request = DtoRequests.DeviceGetWarningsRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.axis = axisNumber
        request.clear = false

        let response = try await Gateway.callAsync("device/get_warnings", request, DtoRequests.DeviceGetWarningsResponse.fromByteArray)
        return Set(response.flags)
    }

    /**
     Clears (acknowledges) current warnings and faults on axis or device and returns them.

     - Returns: Warnings and faults before clearing. Refer to WarningFlags to check a particular flag.
     */
    public func clearFlags() async throws -> Set<String> {
        var request = DtoRequests.DeviceGetWarningsRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.axis = axisNumber
        request.clear = true

        let response = try await Gateway.callAsync("device/get_warnings", request, DtoRequests.DeviceGetWarningsResponse.fromByteArray)
        return Set(response.flags)
    }

    /**
     Waits for the specified flags to clear.
     Use for warnings flags that clear on their own.
     Does not clear clearable warnings flags.
     Throws TimeoutException if the flags don't clear in the specified time.

     - Parameters:
        - timeout: For how long to wait in milliseconds for the flags to clear.
        - warningFlags: The specific warning flags for which to wait to clear.
     */
    public func waitToClear(timeout: Double, _ warningFlags: String...) async throws  {
        var request = DtoRequests.WaitToClearWarningsRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.axis = axisNumber
        request.timeout = timeout
        request.warningFlags = warningFlags

        try await Gateway.callAsync("device/wait_to_clear_warnings", request)
    }

}
