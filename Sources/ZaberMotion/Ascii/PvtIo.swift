// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import DtoRequests
import Gateway
import ZaberMotionExceptions

/**
 Module: ZaberMotionAscii

 Class providing access to I/O for a PVT sequence.
 */
public final class PvtIo: @unchecked Sendable {

    private let device: Device

    private let streamId: Int

    package init(device: Device, streamId: Int) {
        self.device = device
        self.streamId = streamId
    }

    /**
     Module: ZaberMotionAscii

     Sets value for the specified digital output channel.

     - Parameters:
        - channelNumber: Channel number starting at 1.
        - value: The type of action to perform on the channel.
     */
    public func setDigitalOutput(channelNumber: Int, value: DigitalOutputAction) async throws  {
        var request = DtoRequests.StreamSetDigitalOutputRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = streamId
        request.pvt = true
        request.channelNumber = channelNumber
        request.value = value

        try await Gateway.callAsync("device/stream_set_digital_output", request)
    }

    /**
     Module: ZaberMotionAscii

     Sets values for all digital output channels.

     - Parameters:
        - values: The type of action to perform on the channel.
     */
    public func setAllDigitalOutputs(values: [DigitalOutputAction]) async throws  {
        var request = DtoRequests.StreamSetAllDigitalOutputsRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = streamId
        request.pvt = true
        request.values = values

        try await Gateway.callAsync("device/stream_set_all_digital_outputs", request)
    }

    /**
     Module: ZaberMotionAscii

     Sets value for the specified analog output channel.

     - Parameters:
        - channelNumber: Channel number starting at 1.
        - value: Value to set the output channel voltage to.
     */
    public func setAnalogOutput(channelNumber: Int, value: Double) async throws  {
        var request = DtoRequests.StreamSetAnalogOutputRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = streamId
        request.pvt = true
        request.channelNumber = channelNumber
        request.value = value

        try await Gateway.callAsync("device/stream_set_analog_output", request)
    }

    /**
     Module: ZaberMotionAscii

     Sets values for all analog output channels.

     - Parameters:
        - values: Voltage values to set the output channels to.
     */
    public func setAllAnalogOutputs(values: [Double]) async throws  {
        var request = DtoRequests.StreamSetAllAnalogOutputsRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = streamId
        request.pvt = true
        request.values = values

        try await Gateway.callAsync("device/stream_set_all_analog_outputs", request)
    }

    /**
     Module: ZaberMotionAscii

     Sets current and future value for the specified digital output channel.
     Requires at least Firmware 7.37.

     - Parameters:
        - channelNumber: Channel number starting at 1.
        - value: The type of action to perform immediately on the channel.
        - futureValue: The type of action to perform in the future on the channel.
        - delay: Delay between setting current value and setting future value.
        - unit: Units of time.
     */
    public func setDigitalOutputSchedule(channelNumber: Int, value: DigitalOutputAction, futureValue: DigitalOutputAction, delay: Double, unit: Units = Units.native) async throws  {
        guard delay > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Delay must be a positive value.")
        }

        var request = DtoRequests.StreamSetDigitalOutputScheduleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = streamId
        request.pvt = true
        request.channelNumber = channelNumber
        request.value = value
        request.futureValue = futureValue
        request.delay = delay
        request.unit = unit

        try await Gateway.callAsync("device/stream_set_digital_output_schedule", request)
    }

    /**
     Module: ZaberMotionAscii

     Sets current and future values for all digital output channels.
     Requires at least Firmware 7.37.

     - Parameters:
        - values: The type of actions to perform immediately on output channels.
        - futureValues: The type of actions to perform in the future on output channels.
        - delay: Delay between setting current values and setting future values.
        - unit: Units of time.
     */
    public func setAllDigitalOutputsSchedule(values: [DigitalOutputAction], futureValues: [DigitalOutputAction], delay: Double, unit: Units = Units.native) async throws  {
        guard delay > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Delay must be a positive value.")
        }

        var request = DtoRequests.StreamSetAllDigitalOutputsScheduleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = streamId
        request.pvt = true
        request.values = values
        request.futureValues = futureValues
        request.delay = delay
        request.unit = unit

        try await Gateway.callAsync("device/stream_set_all_digital_outputs_schedule", request)
    }

    /**
     Module: ZaberMotionAscii

     Sets current and future value for the specified analog output channel.
     Requires at least Firmware 7.38.

     - Parameters:
        - channelNumber: Channel number starting at 1.
        - value: Value to set the output channel voltage to immediately.
        - futureValue: Value to set the output channel voltage to in the future.
        - delay: Delay between setting current value and setting future value.
        - unit: Units of time.
     */
    public func setAnalogOutputSchedule(channelNumber: Int, value: Double, futureValue: Double, delay: Double, unit: Units = Units.native) async throws  {
        guard delay > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Delay must be a positive value.")
        }

        var request = DtoRequests.StreamSetAnalogOutputScheduleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = streamId
        request.pvt = true
        request.channelNumber = channelNumber
        request.value = value
        request.futureValue = futureValue
        request.delay = delay
        request.unit = unit

        try await Gateway.callAsync("device/stream_set_analog_output_schedule", request)
    }

    /**
     Module: ZaberMotionAscii

     Sets current and future values for all analog output channels.
     Requires at least Firmware 7.38.

     - Parameters:
        - values: Voltage values to set the output channels to immediately.
        - futureValues: Voltage values to set the output channels to in the future.
        - delay: Delay between setting current values and setting future values.
        - unit: Units of time.
     */
    public func setAllAnalogOutputsSchedule(values: [Double], futureValues: [Double], delay: Double, unit: Units = Units.native) async throws  {
        guard delay > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Delay must be a positive value.")
        }

        var request = DtoRequests.StreamSetAllAnalogOutputsScheduleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.streamId = streamId
        request.pvt = true
        request.values = values
        request.futureValues = futureValues
        request.delay = delay
        request.unit = unit

        try await Gateway.callAsync("device/stream_set_all_analog_outputs_schedule", request)
    }

    /**
     Module: ZaberMotionAscii

     Cancels a scheduled digital output action.
     Requires at least Firmware 7.37.

     - Parameters:
        - channelNumber: Channel number starting at 1.
     */
    public func cancelDigitalOutputSchedule(channelNumber: Int) async throws  {
        var request = DtoRequests.StreamCancelOutputScheduleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.analog = false
        request.streamId = streamId
        request.pvt = true
        request.channelNumber = channelNumber

        try await Gateway.callAsync("device/stream_cancel_output_schedule", request)
    }

    /**
     Module: ZaberMotionAscii

     Cancel all scheduled digital output actions.
     Requires at least Firmware 7.37.

     - Parameters:
        - channels: Optionally specify which channels to cancel.
          Array length must be empty or equal to the number of channels on device.
          Specifying "True" for a channel will cancel the scheduled digital output action for that channel.
     */
    public func cancelAllDigitalOutputsSchedule(channels: [Bool] = []) async throws  {
        var request = DtoRequests.StreamCancelAllOutputsScheduleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.analog = false
        request.streamId = streamId
        request.pvt = true
        request.channels = channels

        try await Gateway.callAsync("device/stream_cancel_all_outputs_schedule", request)
    }

    /**
     Module: ZaberMotionAscii

     Cancels a scheduled analog output value.
     Requires at least Firmware 7.38.

     - Parameters:
        - channelNumber: Channel number starting at 1.
     */
    public func cancelAnalogOutputSchedule(channelNumber: Int) async throws  {
        var request = DtoRequests.StreamCancelOutputScheduleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.analog = true
        request.streamId = streamId
        request.pvt = true
        request.channelNumber = channelNumber

        try await Gateway.callAsync("device/stream_cancel_output_schedule", request)
    }

    /**
     Module: ZaberMotionAscii

     Cancel all scheduled analog output actions.
     Requires at least Firmware 7.38.

     - Parameters:
        - channels: Optionally specify which channels to cancel.
          Array length must be empty or equal to the number of channels on device.
          Specifying "True" for a channel will cancel the scheduled analog output value for that channel.
     */
    public func cancelAllAnalogOutputsSchedule(channels: [Bool] = []) async throws  {
        var request = DtoRequests.StreamCancelAllOutputsScheduleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.analog = true
        request.streamId = streamId
        request.pvt = true
        request.channels = channels

        try await Gateway.callAsync("device/stream_cancel_all_outputs_schedule", request)
    }

}
