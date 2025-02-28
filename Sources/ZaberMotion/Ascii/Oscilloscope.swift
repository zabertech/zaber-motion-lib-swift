// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import DtoRequests
import Gateway
import ZaberMotionExceptions
import Utils

/**
 Provides a convenient way to control the oscilloscope data recording feature of some devices.
 The oscilloscope can record the values of some settings over time at high resolution.
 Requires at least Firmware 7.00.
 */
public final class Oscilloscope: @unchecked Sendable {

    package init(device: Device) {
        self.device = device
    }

    /**
     Device that this Oscilloscope measures.
     */
    public let device: Device

    /**
     Select a setting to be recorded.

     - Parameters:
        - axis: The 1-based index of the axis to record the value from.
        - setting: The name of a setting to record.
     */
    public func addChannel(axis: Int, setting: String) async throws  {
        var request = DtoRequests.OscilloscopeAddSettingChannelRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.axis = axis
        request.setting = setting

        try await Gateway.callAsync("oscilloscope/add_setting_channel", request)
    }

    /**
     Select an I/O pin to be recorded.
     Requires at least Firmware 7.33.

     - Parameters:
        - ioType: The I/O port type to read data from.
        - ioChannel: The 1-based index of the I/O pin to read from.
     */
    public func addIoChannel(ioType: IoPortType, ioChannel: Int) async throws  {
        var request = DtoRequests.OscilloscopeAddIoChannelRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.ioType = ioType
        request.ioChannel = ioChannel

        try await Gateway.callAsync("oscilloscope/add_io_channel", request)
    }

    /**
     Clear the list of channels to record.
     */
    public func clear() async throws  {
        var request = DtoRequests.DeviceEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress

        try await Gateway.callAsync("oscilloscope/clear_channels", request)
    }

    /**
     Get the current sampling interval.

     - Parameters:
        - unit: Unit of measure to represent the timebase in.

     - Returns: The current sampling interval in the selected time units.
     */
    public func getTimebase(unit: Units = Units.native) async throws -> Double {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.setting = "scope.timebase"
        request.unit = unit

        let response = try await Gateway.callAsync("device/get_setting", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Set the sampling interval.

     - Parameters:
        - interval: Sample interval for the next oscilloscope recording. Minimum value is 100µs.
        - unit: Unit of measure the timebase is represented in.
     */
    public func setTimebase(interval: Double, unit: Units = Units.native) async throws  {
        var request = DtoRequests.DeviceSetSettingRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.setting = "scope.timebase"
        request.value = interval
        request.unit = unit

        try await Gateway.callAsync("device/set_setting", request)
    }

    /**
     Get the current sampling frequency.
     The values is calculated as the inverse of the current sampling interval.

     - Parameters:
        - unit: Unit of measure to represent the frequency in.

     - Returns: The inverse of current sampling interval in the selected units.
     */
    public func getFrequency(unit: Units = Units.native) async throws -> Double {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.setting = "scope.timebase"
        request.unit = unit

        let response = try await Gateway.callAsync("oscilloscope/get_frequency", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Set the sampling frequency (inverse of the sampling interval).
     The value is quantized to the next closest value supported by the firmware.

     - Parameters:
        - frequency: Sample frequency for the next oscilloscope recording.
        - unit: Unit of measure the frequency is represented in.
     */
    public func setFrequency(frequency: Double, unit: Units = Units.native) async throws  {
        var request = DtoRequests.DeviceSetSettingRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.setting = "scope.timebase"
        request.value = frequency
        request.unit = unit

        try await Gateway.callAsync("oscilloscope/set_frequency", request)
    }

    /**
     Get the delay before oscilloscope recording starts.

     - Parameters:
        - unit: Unit of measure to represent the delay in.

     - Returns: The current start delay in the selected time units.
     */
    public func getDelay(unit: Units = Units.native) async throws -> Double {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.setting = "scope.delay"
        request.unit = unit

        let response = try await Gateway.callAsync("device/get_setting", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Set the sampling start delay.

     - Parameters:
        - interval: Delay time between triggering a recording and the first data point being recorded.
        - unit: Unit of measure the delay is represented in.
     */
    public func setDelay(interval: Double, unit: Units = Units.native) async throws  {
        var request = DtoRequests.DeviceSetSettingRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.setting = "scope.delay"
        request.value = interval
        request.unit = unit

        try await Gateway.callAsync("device/set_setting", request)
    }

    /**
     Get the maximum number of channels that can be recorded.

     - Returns: The maximum number of channels that can be added to an Oscilloscope recording.
     */
    public func getMaxChannels() async throws -> Int {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.setting = "scope.numchannels"

        let response = try await Gateway.callAsync("oscilloscope/get_setting", request, DtoRequests.IntResponse.fromByteArray)
        return response.value
    }

    /**
     Get the maximum number of samples that can be recorded per Oscilloscope channel.

     - Returns: The maximum number of samples that can be recorded per Oscilloscope channel.
     */
    public func getMaxBufferSize() async throws -> Int {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.setting = "scope.channel.size.max"

        let response = try await Gateway.callAsync("oscilloscope/get_setting", request, DtoRequests.IntResponse.fromByteArray)
        return response.value
    }

    /**
     Get the number of samples that can be recorded per channel given the current number of channels added.

     - Returns: Number of samples that will be recorded per channel with the current channels. Zero if none have been added.
     */
    public func getBufferSize() async throws -> Int {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.setting = "scope.channel.size"

        let response = try await Gateway.callAsync("oscilloscope/get_setting", request, DtoRequests.IntResponse.fromByteArray)
        return response.value
    }

    /**
     Trigger data recording.

     - Parameters:
        - captureLength: Optional number of samples to record per channel.
          If left empty, the device records samples until the buffer fills.
          Requires at least Firmware 7.29.
     */
    public func start(captureLength: Int = 0) async throws  {
        var request = DtoRequests.OscilloscopeStartRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.captureLength = captureLength

        try await Gateway.callAsync("oscilloscope/start", request)
    }

    /**
     End data recording if currently in progress.
     */
    public func stop() async throws  {
        var request = DtoRequests.OscilloscopeRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress

        try await Gateway.callAsync("oscilloscope/stop", request)
    }

    /**
     Reads the last-recorded data from the oscilloscope. Will block until any in-progress recording completes.

     - Returns: Array of recorded channel data arrays, in the order added.
     */
    public func read() async throws -> [OscilloscopeData] {
        _assertSendable(OscilloscopeData.self)

        var request = DtoRequests.DeviceEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress

        let response = try await Gateway.callAsync("oscilloscope/read", request, DtoRequests.OscilloscopeReadResponse.fromByteArray)
        return response.dataIds.map { OscilloscopeData(dataId: $0) }
    }

}
