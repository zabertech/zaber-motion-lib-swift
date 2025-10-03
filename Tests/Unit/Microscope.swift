import Testing
import Dto
import DtoMicroscopy
import ZaberMotionAscii
import ZaberMotionMicroscopy

@Suite struct MicroscopeTests {
    @Test("Initialize microscope")
    func testInitializeMicroscope() async throws {
        let transport = try Transport.open()
        let connection = try await Connection.openCustom(transport: transport)

        let config = MicroscopeConfig(
            focusAxis: AxisAddress(device: 2, axis: 1),
            xAxis: AxisAddress(device: 3, axis: 1),
            yAxis: AxisAddress(device: 3, axis: 2),
            illuminator: 1,
            filterChanger: 5,
            objectiveChanger: 4,
            autofocus: 6,
            cameraTrigger: ChannelAddress(device: 7, channel: 1)
        )
        let microscope = try Microscope(connection: connection, config: config)

        #expect(microscope.illuminator?.device.deviceAddress == 1)
        #expect(microscope.focusAxis?.device.deviceAddress == 2)
        #expect(microscope.xAxis?.device.deviceAddress == 3)
        #expect(microscope.xAxis?.axisNumber == 1)
        #expect(microscope.yAxis?.device.deviceAddress == 3)
        #expect(microscope.yAxis?.axisNumber == 2)
        #expect(microscope.plate?.axes.count == 2)
        #expect(microscope.objectiveChanger?.turret.deviceAddress == 4)
        #expect(microscope.objectiveChanger?.focusAxis.device.deviceAddress == 2)
        #expect(microscope.filterChanger?.device.deviceAddress == 5)
        #expect(microscope.autofocus?.providerId == 6)
        #expect(microscope.cameraTrigger?.device.deviceAddress == 7)
        #expect(microscope.cameraTrigger?.channel == 1)
    }

    @Test("Initialize empty microscope")
    func testInitializeEmptyMicroscope() async throws {
        let transport =  try Transport.open()
        let connection = try await Connection.openCustom(transport: transport)

        let microscope = try Microscope(connection: connection, config: MicroscopeConfig())

        #expect(microscope.illuminator == nil)
        #expect(microscope.focusAxis == nil)
        #expect(microscope.xAxis == nil)
        #expect(microscope.yAxis == nil)
        #expect(microscope.plate == nil)
        #expect(microscope.objectiveChanger == nil)
        #expect(microscope.filterChanger == nil)
        #expect(microscope.autofocus == nil)
        #expect(microscope.cameraTrigger == nil)
    }

}
