import ZaberMotion
import ZaberMotionAscii
import ZaberMotionGcode
import ZaberMotionExceptions


do {
    try Library.setLogOutput(mode: LogOutputMode.stdout)
    try Library.setDeviceDbSource(sourceType: DeviceDbSourceType.webService, urlOrFilePath: "https://api.zaber.io/device-db/master")

    let conn = try await Connection.openTcp(hostName: "localhost", port: 11321)
    let detected = try await conn.detectDevices()
    let device = detected[0]

    let allAxes = device.allAxes
    try await allAxes.home()

    let stream = try device.streams.getStream(streamId: 1)
    try await stream.setupLive(1, 2)

    var config = TranslatorConfig()
    config.axisMappings = [ AxisMapping(axisLetter: "Y", axisIndex: 0), AxisMapping(axisLetter: "X", axisIndex: 1) ]

    let translator = try await Translator.setup(stream: stream, config: config)
    _ = try await translator.translate(block: "G28 Y10")
    _ = try await translator.translate(block: "G0 X10 Y20")
    _ = try await translator.flush()

    let y = try translator.getAxisPosition(axis: "Y", unit: Units.lengthMillimetres)
    try translator.setAxisPosition(axis: "Y", position: y * 2, unit: Units.lengthMillimetres)
    try translator.setTraverseRate(traverseRate: 3, unit: Units.velocityMillimetresPerSecond)

    _ = try await translator.translate(block: "G0 X10 Y20")
    _ = try await translator.flush()
    try await stream.disable()

    try await conn.close()

} catch let e as MotionLibException {
    print("ZML \(e.self): \(e.message)")
} catch {
    print("Error: \(error)")
}
