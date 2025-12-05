import ZaberMotion
import ZaberMotionAscii
import ZaberMotionExceptions

do {
    try Library.setLogOutput(mode: LogOutputMode.stdout)
	try Library.setDeviceDbSource(sourceType: DeviceDbSourceType.webService, urlOrFilePath: "https://api.zaber.io/device-db/master")

    print("Starting connection to device")
    let conn = try await Connection.openTcp(hostName: "localhost", port: Connection.tcpPortDeviceOnly)

    print("Detecting devices")
	let detected = try await conn.detectDevices()
    let device = detected[0]

	let allAxes = device.allAxes
	try await allAxes.home()

	let numStreams = try await device.settings.get(setting: "stream.numstreams")
	print("Number of streams possible: ", numStreams)

	let stream = try device.streams.getStream(streamId: 1)
	let streamBuffer = try device.streams.getBuffer(streamBufferId: 1)
	try await streamBuffer.erase()

	try await stream.setupStore(streamBuffer: streamBuffer, 1, 2)

	try await stream.lineAbsolute(
		Measurement(value: 29.0047, unit: Units.lengthMillimetres),
		Measurement(value: 40.49, unit: Units.lengthMillimetres)
	)
	try await stream.lineAbsolute(
		Measurement(value: 0),
		Measurement(value: 50.5, unit: Units.lengthMillimetres)
	)

	let pathInCm: [[Double]] = [ [0.00, 3.00], [2.25, 7.10], [5.35, 0.15], [1.45, 10.20], [9.00, 9.00] ]

	for point in pathInCm {
		try await stream.lineAbsolute(
			Measurement(value: point[0], unit: Units.lengthCentimetres),
			Measurement(value: point[1], unit: Units.lengthCentimetres)
		)
	}
	for point in pathInCm {
		try await stream.lineAbsolute(
			Measurement(value: point[0], unit: Units.lengthCentimetres),
			Measurement(value: point[1], unit: Units.lengthCentimetres)
		)
	}

	let content = try await streamBuffer.getContent()
	for line in content {
		print(line)
	}

	try await stream.disable()

	try await stream.setupLive(1, 2)
	try await stream.call(streamBuffer: streamBuffer)

	let circleCenterAbs = [
		Measurement(value: 2, unit: Units.lengthCentimetres),
		Measurement(value: 4, unit: Units.lengthCentimetres)
	]
	try await stream.circleAbsolute(
		rotationDirection: RotationDirection.cw,
		centerX: circleCenterAbs[0],
		centerY: circleCenterAbs[1]
	)

	let circleCenterRel = [
		Measurement(value: -2, unit: Units.lengthCentimetres),
		Measurement(value: 0, unit: Units.lengthCentimetres)
	]
	try await stream.circleRelative(
		rotationDirection: RotationDirection.ccw,
		centerX: circleCenterRel[0],
		centerY: circleCenterRel[1]
	)

	let arcCircleCenterRel = [
		Measurement(value: -2, unit: Units.lengthCentimetres),
		Measurement(value: 0, unit: Units.lengthCentimetres)
	]
	let arcEndRel = [
		Measurement(value: -2, unit: Units.lengthCentimetres),
		Measurement(value: 0, unit: Units.lengthCentimetres)
	]
	try await stream.arcRelative(
		rotationDirection: RotationDirection.ccw,
		centerX: arcCircleCenterRel[0], centerY: arcCircleCenterRel[1],
		endX: arcEndRel[0], endY: arcEndRel[1]
	)

	let arcCircleCenterAbs = [
		Measurement(value: 2, unit: Units.lengthCentimetres),
		Measurement(value: 4, unit: Units.lengthCentimetres)
	]
	let arcEndAbs = [
		Measurement(value: 4, unit: Units.lengthCentimetres),
		Measurement(value: 4, unit: Units.lengthCentimetres)
	]
	try await stream.arcAbsolute(
		rotationDirection: RotationDirection.cw,
		centerX: arcCircleCenterAbs[0], centerY: arcCircleCenterAbs[1],
		endX: arcEndAbs[0], endY: arcEndAbs[1]
	)

	try await stream.lineAbsoluteOn(targetAxesIndices: [ 1 ], endpoint: [ Measurement(value: 1) ])

	try await stream.setMaxCentripetalAcceleration(maxCentripetalAcceleration: 5, unit: Units.accelerationCentimetresPerSecondSquared)
	try await stream.setMaxTangentialAcceleration(maxTangentialAcceleration: 5, unit: Units.accelerationCentimetresPerSecondSquared)
	try await stream.setMaxSpeed(maxSpeed: 0.5, unit: Units.velocityMillimetresPerSecond)

	try await stream.wait(time: 2, unit: Units.timeSeconds)

	try await stream.io.setDigitalOutput(channelNumber: 1, value: DigitalOutputAction.on)
	try await stream.io.waitDigitalInput(channelNumber: 1, value: true)

	try await stream.io.setDigitalOutput(channelNumber: 1, value: DigitalOutputAction.toggle)
	try await stream.io.setDigitalOutput(channelNumber: 1, value: DigitalOutputAction.toggle)

	try await stream.io.setAnalogOutput(channelNumber: 1, value: 0.42)
	try await stream.io.waitAnalogInput(channelNumber: 1, condition: ">=", value: 0.50)

	try await stream.waitUntilIdle()

	print(try stream.toString())
	print(try stream.axes.count)
	print(try await stream.getMaxSpeed(unit: Units.velocityCentimetresPerSecond))
	print(try await stream.getMaxTangentialAcceleration(unit: Units.accelerationCentimetresPerSecondSquared))
	print(try await stream.getMaxCentripetalAcceleration(unit: Units.accelerationCentimetresPerSecondSquared))

	try await stream.cork()
	try await stream.uncork()

	if (try await stream.isBusy()) {
		try await stream.waitUntilIdle()
	}

	try await stream.disable()
    try await conn.close()

} catch let e as MotionLibException {
	print("ZML \(e.self): \(e.message)")
} catch {
	print("Error: \(error)")
}
