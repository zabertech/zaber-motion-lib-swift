import ZaberMotion
import ZaberMotionAscii
import ZaberMotionExceptions

do {
    try ZaberMotion.Library.setLogOutput(mode: LogOutputMode.stdout)
    let connection = try await Connection.openSerialPort(portName: "/dev/ttyUSB0")
    let device = try await connection.detectDevices()[0]
    try await device.allAxes.home()

    let axis = try device.getAxis(axisNumber: 1)
    let cmd = try axis.prepareCommand(
        commandTemplate: "move sin ? ? ?",
        Measurement(value: 10, unit: Units.lengthMillimetres),
        Measurement(value: 1, unit: Units.timeSeconds),
        Measurement(value: 3)
    )
    _ = try await axis.genericCommand(command: cmd)
    try await axis.waitUntilIdle()

    print("Test begins!")
    try await axis.moveAbsolute(position:  1, unit: Units.lengthCentimetres)
    try await axis.moveRelative(position: -1, unit: Units.lengthMillimetres)

    try await axis.moveVelocity(velocity: 3.0, unit: Units.velocityMillimetresPerSecond)
    try await Task.sleep(nanoseconds: 1_000_000)
    try await axis.stop()

    let position = try await axis.getPosition(unit: Units.lengthMillimetres)
    print("Axis is at \(position)mm")
    print("Test Ends")
    try await connection.close()
} catch let e as MotionLibException {
    print("ZML \(e.self): \(e.message)")
} catch {
    print("Error: \(error)")
}
