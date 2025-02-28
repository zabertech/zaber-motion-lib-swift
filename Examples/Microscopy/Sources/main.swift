import ZaberMotion
import ZaberMotionAscii
import ZaberMotionMicroscopy
import ZaberMotionExceptions

do {
    try Library.setLogOutput(mode: LogOutputMode.stdout)
    let conn = try await Connection.openSerialPort(portName: "COM1")
    _ = try await conn.detectDevices()

    let changer = try await ObjectiveChanger.find(connection: conn)

    for n in 1...5 {
        try await changer.change(objective: n % 4)
    }

    try await conn.close()

} catch let e as MotionLibException {
    print("ZML \(e.self): \(e.message)")
} catch {
    print("Error: \(error)")
}
