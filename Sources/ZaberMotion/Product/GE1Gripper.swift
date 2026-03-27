// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import DtoRequests
import ZaberMotionExceptions
import Gateway
import Utils

/**
 Module: ZaberMotionProduct

 Class representing a GE1 series gripper.
 */
public final class GE1Gripper: @unchecked Sendable {

    package init(connectionId: Int) {
        self.connectionId = connectionId
    }

    /**
     Module: ZaberMotionProduct

     The default device address for GE1 series grippers.
     */
    public static let defaultDeviceAddress: Int = 1;

    /**
     Module: ZaberMotionProduct

     The identifier for the connection.
     */
    public let connectionId: Int

    /**
     Module: ZaberMotionProduct

     Opens a serial connection to a GE1 series gripper.

     - Parameters:
        - portName: The name of the serial port to connect to.
        - deviceAddress: The address of the gripper to connect to.
        - timeout: The timeout in milliseconds for any request sent using this connection.

     - Returns: A GE1Gripper instance representing the connection to the gripper.
     */
    public static func openConnection(portName: String, deviceAddress: Int = GE1Gripper.defaultDeviceAddress, timeout: Int = 500) async throws -> GE1Gripper {
        _assertSendable(GE1Gripper.self)

        var request = DtoRequests.Ge1GripperOpenConnectionRequest()
        request.portName = portName
        request.deviceAddress = deviceAddress
        request.timeout = timeout

        let response = try await Gateway.callAsync("ge1_gripper/open_connection", request, DtoRequests.IntResponse.fromByteArray)
        return GE1Gripper(connectionId: response.value)
    }

    /**
     Module: ZaberMotionProduct

     Closes the connection to the gripper.
     */
    public func close() async throws  {
        var request = DtoRequests.Ge1GripperEmptyRequest()
        request.connectionId = self.connectionId

        try await Gateway.callAsync("ge1_gripper/close_connection", request)
    }

    /**
     Module: ZaberMotionProduct

     Reads a single register value from the gripper.

     - Parameters:
        - registerAddress: The address of the register to read.

     - Returns: The data at the specified register address.
     */
    public func readRegister(registerAddress: Int) async throws -> Int {
        var request = DtoRequests.Ge1GripperReadRegisterRequest()
        request.connectionId = self.connectionId
        request.registerAddress = registerAddress

        let response = try await Gateway.callAsync("ge1_gripper/read_register", request, DtoRequests.IntResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionProduct

     Writes a single register value to the gripper.

     - Parameters:
        - registerAddress: The address of the register to write.
        - data: The data to write to the specified register address.
     */
    public func writeRegister(registerAddress: Int, data: Int) async throws  {
        var request = DtoRequests.Ge1GripperWriteRegisterRequest()
        request.connectionId = self.connectionId
        request.registerAddress = registerAddress
        request.data = data

        try await Gateway.callAsync("ge1_gripper/write_register", request)
    }

    /**
     Module: ZaberMotionProduct

     Homes gripper by moving it to its homing position.

     - Parameters:
        - waitUntilIdle: Wait until homing has completed before returning.
     */
    public func home(waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.Ge1GripperWaitUntilIdleRequest()
        request.connectionId = self.connectionId
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("ge1_gripper/home", request)
    }

    /**
     Module: ZaberMotionProduct

     Waits until the gripper has stopped moving.
     */
    public func waitUntilIdle() async throws  {
        var request = DtoRequests.Ge1GripperEmptyRequest()
        request.connectionId = self.connectionId

        try await Gateway.callAsync("ge1_gripper/wait_until_idle", request)
    }

    /**
     Module: ZaberMotionProduct

     Moves the gripper to a specified position.

     - Parameters:
        - position: The target position for the gripper as a percentage, where 0 is closed and 100 is open.
        - waitUntilIdle: Wait until the move has completed before returning.
     */
    public func move(position: Double, waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.Ge1GripperMoveRequest()
        request.connectionId = self.connectionId
        request.position = position
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("ge1_gripper/move", request)
    }

    /**
     Module: ZaberMotionProduct

     Moves the gripper to the open position.

     - Parameters:
        - waitUntilIdle: Wait until the move has completed before returning.
     */
    public func moveOpen(waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.Ge1GripperMoveRequest()
        request.connectionId = self.connectionId
        request.position = 100
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("ge1_gripper/move", request)
    }

    /**
     Module: ZaberMotionProduct

     Moves the gripper to the closed position.

     - Parameters:
        - waitUntilIdle: Wait until the move has completed before returning.
     */
    public func moveClose(waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.Ge1GripperMoveRequest()
        request.connectionId = self.connectionId
        request.position = 0
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("ge1_gripper/move", request)
    }

    /**
     Module: ZaberMotionProduct

     Stops the gripper from moving.

     - Parameters:
        - waitUntilIdle: Wait until the gripper has stopped before returning.
     */
    public func stop(waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.Ge1GripperWaitUntilIdleRequest()
        request.connectionId = self.connectionId
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("ge1_gripper/stop", request)
    }

    /**
     Module: ZaberMotionProduct

     Sets the gripping force of the gripper.

     - Parameters:
        - force: The gripping force as a percentage from 20 to 100.
     */
    public func setForce(force: Int) async throws  {
        var request = DtoRequests.Ge1GripperSetForceRequest()
        request.connectionId = self.connectionId
        request.force = force

        try await Gateway.callAsync("ge1_gripper/set_force", request)
    }

    /**
     Module: ZaberMotionProduct

     Sets the maximum speed of the gripper.

     - Parameters:
        - speed: The maximum speed as a percentage from 1 to 100.
     */
    public func setSpeed(speed: Int) async throws  {
        var request = DtoRequests.Ge1GripperSetSpeedRequest()
        request.connectionId = self.connectionId
        request.speed = speed

        try await Gateway.callAsync("ge1_gripper/set_speed", request)
    }

    /**
     Module: ZaberMotionProduct

     Enables the gripper driver.
     */
    public func driverEnable() async throws  {
        var request = DtoRequests.Ge1GripperEmptyRequest()
        request.connectionId = self.connectionId

        try await Gateway.callAsync("ge1_gripper/driver_enable", request)
    }

    /**
     Module: ZaberMotionProduct

     Disables the gripper driver.
     */
    public func driverDisable() async throws  {
        var request = DtoRequests.Ge1GripperEmptyRequest()
        request.connectionId = self.connectionId

        try await Gateway.callAsync("ge1_gripper/driver_disable", request)
    }

    /**
     Module: ZaberMotionProduct

     Performs a calibration of the travel range by moving to the fully open and fully closed positions.

     - Parameters:
        - saveToFlash: Save the calibration results to flash memory so they are retained on power cycle.
     */
    public func calibrate(saveToFlash: Bool = true) async throws  {
        var request = DtoRequests.Ge1GripperCalibrateRequest()
        request.connectionId = self.connectionId
        request.saveToFlash = saveToFlash

        try await Gateway.callAsync("ge1_gripper/calibrate", request)
    }

    /**
     Module: ZaberMotionProduct

     Gets the current state of the gripper.

     - Returns: The current state of the gripper.
     */
    public func getState() async throws -> Ge1GripperState {
        var request = DtoRequests.Ge1GripperEmptyRequest()
        request.connectionId = self.connectionId

        let response = try await Gateway.callAsync("ge1_gripper/get_state", request, DtoRequests.Ge1GripperGetStateResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionProduct

     Gets the current error of the gripper.

     - Returns: The current error of the gripper.
     */
    public func getError() async throws -> Ge1GripperError {
        var request = DtoRequests.Ge1GripperEmptyRequest()
        request.connectionId = self.connectionId

        let response = try await Gateway.callAsync("ge1_gripper/get_error", request, DtoRequests.Ge1GripperGetErrorResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionProduct

     Clears the current error of the gripper.
     */
    public func clearError() async throws  {
        var request = DtoRequests.Ge1GripperEmptyRequest()
        request.connectionId = self.connectionId

        try await Gateway.callAsync("ge1_gripper/clear_error", request)
    }

    /**
     Module: ZaberMotionProduct

     Checks if the gripper has been homed.

     - Returns: True if the gripper is homed, false otherwise.
     */
    public func isHomed() async throws -> Bool {
        var request = DtoRequests.Ge1GripperEmptyRequest()
        request.connectionId = self.connectionId

        let response = try await Gateway.callAsync("ge1_gripper/is_homed", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionProduct

     Gets the current position of the gripper.

     - Returns: The current position of the gripper as a percentage, where 0 is closed and 100 is open.
     */
    public func getPosition() async throws -> Double {
        var request = DtoRequests.Ge1GripperEmptyRequest()
        request.connectionId = self.connectionId

        let response = try await Gateway.callAsync("ge1_gripper/get_position", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionProduct

     Gets the current current of the gripper.

     - Returns: The current current of the gripper in milliamps.
     */
    public func getCurrent() async throws -> Int {
        var request = DtoRequests.Ge1GripperEmptyRequest()
        request.connectionId = self.connectionId

        let response = try await Gateway.callAsync("ge1_gripper/get_current", request, DtoRequests.IntResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionProduct

     Sets the home direction for the gripper.

     - Parameters:
        - direction: The home direction to set.
        - saveToFlash: Save the home direction setting to flash memory so it is retained on power cycle.
     */
    public func setHomeDirection(direction: Ge1GripperDirection, saveToFlash: Bool = true) async throws  {
        var request = DtoRequests.Ge1GripperSetHomeDirectionRequest()
        request.connectionId = self.connectionId
        request.direction = direction
        request.saveToFlash = saveToFlash

        try await Gateway.callAsync("ge1_gripper/set_home_direction", request)
    }

    /**
     Module: ZaberMotionProduct

     Enables or disables automatic homing on power up.

     - Parameters:
        - enabled: True to enable automatic homing on power up, false to disable.
        - saveToFlash: Save the auto home setting to flash memory so it is retained on power cycle.
     */
    public func setAutoHome(enabled: Bool, saveToFlash: Bool = true) async throws  {
        var request = DtoRequests.Ge1GripperSetAutoHomeRequest()
        request.connectionId = self.connectionId
        request.enabled = enabled
        request.saveToFlash = saveToFlash

        try await Gateway.callAsync("ge1_gripper/set_auto_home", request)
    }

    /**
     Module: ZaberMotionProduct

     Enables or disables IO control for the gripper.

     - Parameters:
        - enabled: True to enable IO control, false to disable.
        - saveToFlash: Save the IO enabled setting to flash memory so it is retained on power cycle.
     */
    public func setIoEnabled(enabled: Bool, saveToFlash: Bool = true) async throws  {
        var request = DtoRequests.Ge1GripperSetIoEnabledRequest()
        request.connectionId = self.connectionId
        request.enabled = enabled
        request.saveToFlash = saveToFlash

        try await Gateway.callAsync("ge1_gripper/set_io_enabled", request)
    }

    /**
     Module: ZaberMotionProduct

     Sets the debounce filter time for the gripper IO input to suppress noise.

     - Parameters:
        - duration: The IO input filter time in milliseconds.
        - saveToFlash: Save the IO input filter setting to flash memory so it is retained on power cycle.
     */
    public func setIoInputFilter(duration: Int, saveToFlash: Bool = true) async throws  {
        var request = DtoRequests.Ge1GripperSetIoInputFilterRequest()
        request.connectionId = self.connectionId
        request.duration = duration
        request.saveToFlash = saveToFlash

        try await Gateway.callAsync("ge1_gripper/set_io_input_filter", request)
    }

    /**
     Module: ZaberMotionProduct

     Saves a position, force, and speed as a preset.

     - Parameters:
        - presetNumber: The preset number to save the preset to, from 1 to 4.
        - position: The target position for the preset as a percentage, where 0 is closed and 100 is open.
        - force: The gripping force for the preset as a percentage from 20 to 100.
        - speed: The maximum speed for the preset as a percentage from 1 to 100.
        - saveToFlash: Save the preset to flash memory so it is retained on power cycle.
     */
    public func setPreset(presetNumber: Int, position: Double, force: Int = 100, speed: Int = 100, saveToFlash: Bool = true) async throws  {
        var request = DtoRequests.Ge1GripperSetPresetRequest()
        request.connectionId = self.connectionId
        request.presetNumber = presetNumber
        request.position = position
        request.force = force
        request.speed = speed
        request.saveToFlash = saveToFlash

        try await Gateway.callAsync("ge1_gripper/set_preset", request)
    }

    /**
     Module: ZaberMotionProduct

     Activates a preset, causing the gripper to move to the preset position using the preset force and speed.

     - Parameters:
        - presetNumber: The preset number to activate, from 1 to 4.
        - waitUntilIdle: Wait until the move has completed before returning.
     */
    public func activatePreset(presetNumber: Int, waitUntilIdle: Bool = true) async throws  {
        var request = DtoRequests.Ge1GripperActivatePresetRequest()
        request.connectionId = self.connectionId
        request.presetNumber = presetNumber
        request.waitUntilIdle = waitUntilIdle

        try await Gateway.callAsync("ge1_gripper/activate_preset", request)
    }

    /**
     Module: ZaberMotionProduct

     Gets the preset number currently activated by the gripper IO input.

     - Returns: The current preset number activated by the gripper IO input.
     */
    public func getIoInputPresetNumber() async throws -> Int {
        var request = DtoRequests.Ge1GripperEmptyRequest()
        request.connectionId = self.connectionId

        let response = try await Gateway.callAsync("ge1_gripper/get_io_input_preset_number", request, DtoRequests.IntResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionProduct

     Frees the connection instance.

     - Parameters:
        - connectionId: Connection ID to be freed.
     */
    static func free(connectionId: Int) throws  {
        var request = DtoRequests.Ge1GripperEmptyRequest()
        request.connectionId = connectionId

        try Gateway.callSync("ge1_gripper/free_connection", request)
    }

    /**
     Module: ZaberMotionProduct

     Close the connection synchronously.
     */
    private func close() throws {
        var request = DtoRequests.Ge1GripperEmptyRequest()
        request.connectionId = self.connectionId

        try Gateway.callSync("ge1_gripper/close_connection", request)
    }

    deinit {
        guard connectionId >= 0 else { return }

        do {
            try close()
        } catch let e as MotionLibException {
            printToStderr("ZML Error: \(e.toString())")
        } catch {
            printToStderr("System Error: \(error)")
        }

        do {
            try GE1Gripper.free(connectionId: self.connectionId)
        } catch let e as MotionLibException {
            printToStderr("ZML Error: \(e.toString())")
        } catch {
            printToStderr("System Error: \(error)")
        }
    }
}
