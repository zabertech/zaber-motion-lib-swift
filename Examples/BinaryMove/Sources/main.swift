import ZaberMotion
import ZaberMotionBinary
import ZaberMotionExceptions

let moveTime: Double = 2
let movePos: Double = 2
let moveSpeed: Double = 1

do {
    let connection = try await Connection.openSerialPort(portName: "/dev/ttyUSB0")
    let device = try await connection.detectDevices()[0]

    var pos = try await device.home(unit: Units.lengthCentimetres);
    print("Position after home: \(pos) cm")

    pos = try await device.moveAbsolute(position: movePos, unit: Units.lengthCentimetres)
    print("Position after move absolute: \(pos) cm")

    pos = try await device.moveRelative(position: movePos, unit: Units.lengthMillimetres)
    print("Position after move relative: \(pos) mm")

    let velocity = try await device.moveVelocity(velocity: moveSpeed, unit: Units.velocityMillimetresPerSecond)
    print("Starting move velocity with speed: \(velocity) mm/s")

    try await Task.sleep(nanoseconds: UInt64(moveTime * 1_000_000))
    pos = try await device.stop(unit: Units.lengthCentimetres)
    print("Position after stop: \(pos) cm")

    print("Final position in microsteps: \(try await device.getPosition())")
    try await connection.close();
} catch let e as MotionLibException {
    print("ZML \(e.self): \(e.message)")
} catch {
    print("Error: \(error)")
}
