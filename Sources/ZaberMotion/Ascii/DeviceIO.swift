// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import DtoRequests
import Gateway
import ZaberMotionExceptions
import Utils

/**
 Class providing access to the I/O channels of the device.
 */
public final class DeviceIO {

    private let device: Device

    public init(device: Device) {
        self.device = device
    }

    /**
     Returns the number of I/O channels the device has.

     - Returns: An object containing the number of I/O channels the device has.
     */
    public func getChannelsInfo() async throws -> DeviceIOInfo {
        _assertSendable(DeviceIOInfo.self)

        var request = DtoRequests.DeviceEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress

        return try await Gateway.callAsync("device/get_io_info", request, DeviceIOInfo.fromByteArray)
    }

    /**
     Sets the label of the specified channel.

     - Parameters:
        - portType: The type of channel to set the label of.
        - channelNumber: Channel number starting at 1.
        - label: The label to set for the specified channel.
          If no value or an empty string is provided, this label is deleted.
     */
    public func setLabel(portType: IoPortType, channelNumber: Int, label: String?) async throws  {
        var request = DtoRequests.SetIoPortLabelRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.portType = portType
        request.channelNumber = channelNumber
        request.label = label

        try await Gateway.callAsync("device/set_io_label", request)
    }

    /**
     Returns the label of the specified channel.

     - Parameters:
        - portType: The type of channel to get the label of.
        - channelNumber: Channel number starting at 1.

     - Returns: The label of the specified channel.
     */
    public func getLabel(portType: IoPortType, channelNumber: Int) async throws -> String {
        var request = DtoRequests.GetIoPortLabelRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.portType = portType
        request.channelNumber = channelNumber

        let response = try await Gateway.callAsync("device/get_io_label", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Returns every label assigned to an IO port on this device.

     - Returns: The labels set for this device's IO.
     */
    public func getAllLabels() async throws -> [IoPortLabel] {
        _assertSendable(IoPortLabel.self)

        var request = DtoRequests.DeviceEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress

        let response = try await Gateway.callAsync("device/get_all_io_labels", request, DtoRequests.GetAllIoPortLabelsResponse.fromByteArray)
        return response.labels
    }

    /**
     Returns the current value of the specified digital input channel.

     - Parameters:
        - channelNumber: Channel number starting at 1.

     - Returns: True if voltage is present on the input channel and false otherwise.
     */
    public func getDigitalInput(channelNumber: Int) async throws -> Bool {
        var request = DtoRequests.DeviceGetDigitalIORequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.channelType = "di"
        request.channelNumber = channelNumber

        let response = try await Gateway.callAsync("device/get_digital_io", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Returns the current value of the specified digital output channel.

     - Parameters:
        - channelNumber: Channel number starting at 1.

     - Returns: True if the output channel is conducting and false otherwise.
     */
    public func getDigitalOutput(channelNumber: Int) async throws -> Bool {
        var request = DtoRequests.DeviceGetDigitalIORequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.channelType = "do"
        request.channelNumber = channelNumber

        let response = try await Gateway.callAsync("device/get_digital_io", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Returns the current value of the specified analog input channel.

     - Parameters:
        - channelNumber: Channel number starting at 1.

     - Returns:  A measurement of the voltage present on the input channel.
     */
    public func getAnalogInput(channelNumber: Int) async throws -> Double {
        var request = DtoRequests.DeviceGetAnalogIORequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.channelType = "ai"
        request.channelNumber = channelNumber

        let response = try await Gateway.callAsync("device/get_analog_io", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Returns the current values of the specified analog output channel.

     - Parameters:
        - channelNumber: Channel number starting at 1.

     - Returns: A measurement of voltage that the output channel is conducting.
     */
    public func getAnalogOutput(channelNumber: Int) async throws -> Double {
        var request = DtoRequests.DeviceGetAnalogIORequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.channelType = "ao"
        request.channelNumber = channelNumber

        let response = try await Gateway.callAsync("device/get_analog_io", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Returns the current values of all digital input channels.

     - Returns: True if voltage is present on the input channel and false otherwise.
     */
    public func getAllDigitalInputs() async throws -> [Bool] {
        var request = DtoRequests.DeviceGetAllDigitalIORequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.channelType = "di"

        let response = try await Gateway.callAsync("device/get_all_digital_io", request, DtoRequests.DeviceGetAllDigitalIOResponse.fromByteArray)
        return response.values
    }

    /**
     Returns the current values of all digital output channels.

     - Returns: True if the output channel is conducting and false otherwise.
     */
    public func getAllDigitalOutputs() async throws -> [Bool] {
        var request = DtoRequests.DeviceGetAllDigitalIORequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.channelType = "do"

        let response = try await Gateway.callAsync("device/get_all_digital_io", request, DtoRequests.DeviceGetAllDigitalIOResponse.fromByteArray)
        return response.values
    }

    /**
     Returns the current values of all analog input channels.

     - Returns: Measurements of the voltages present on the input channels.
     */
    public func getAllAnalogInputs() async throws -> [Double] {
        var request = DtoRequests.DeviceGetAllAnalogIORequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.channelType = "ai"

        let response = try await Gateway.callAsync("device/get_all_analog_io", request, DtoRequests.DeviceGetAllAnalogIOResponse.fromByteArray)
        return response.values
    }

    /**
     Returns the current values of all analog output channels.

     - Returns: Measurements of voltage that the output channels are conducting.
     */
    public func getAllAnalogOutputs() async throws -> [Double] {
        var request = DtoRequests.DeviceGetAllAnalogIORequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.channelType = "ao"

        let response = try await Gateway.callAsync("device/get_all_analog_io", request, DtoRequests.DeviceGetAllAnalogIOResponse.fromByteArray)
        return response.values
    }

    /**
     Sets value for the specified digital output channel.

     - Parameters:
        - channelNumber: Channel number starting at 1.
        - value: The type of action to perform on the channel.
     */
    public func setDigitalOutput(channelNumber: Int, value: DigitalOutputAction) async throws  {
        var request = DtoRequests.DeviceSetDigitalOutputRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.channelNumber = channelNumber
        request.value = value

        try await Gateway.callAsync("device/set_digital_output", request)
    }

    /**
     Sets values for all digital output channels.

     - Parameters:
        - values: The type of action to perform on the channel.
     */
    public func setAllDigitalOutputs(values: [DigitalOutputAction]) async throws  {
        var request = DtoRequests.DeviceSetAllDigitalOutputsRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.values = values

        try await Gateway.callAsync("device/set_all_digital_outputs", request)
    }

    /**
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

        var request = DtoRequests.DeviceSetDigitalOutputScheduleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.channelNumber = channelNumber
        request.value = value
        request.futureValue = futureValue
        request.delay = delay
        request.unit = unit

        try await Gateway.callAsync("device/set_digital_output_schedule", request)
    }

    /**
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

        var request = DtoRequests.DeviceSetAllDigitalOutputsScheduleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.values = values
        request.futureValues = futureValues
        request.delay = delay
        request.unit = unit

        try await Gateway.callAsync("device/set_all_digital_outputs_schedule", request)
    }

    /**
     Sets value for the specified analog output channel.

     - Parameters:
        - channelNumber: Channel number starting at 1.
        - value: Value to set the output channel voltage to.
     */
    public func setAnalogOutput(channelNumber: Int, value: Double) async throws  {
        var request = DtoRequests.DeviceSetAnalogOutputRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.channelNumber = channelNumber
        request.value = value

        try await Gateway.callAsync("device/set_analog_output", request)
    }

    /**
     Sets values for all analog output channels.

     - Parameters:
        - values: Voltage values to set the output channels to.
     */
    public func setAllAnalogOutputs(values: [Double]) async throws  {
        var request = DtoRequests.DeviceSetAllAnalogOutputsRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.values = values

        try await Gateway.callAsync("device/set_all_analog_outputs", request)
    }

    /**
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

        var request = DtoRequests.DeviceSetAnalogOutputScheduleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.channelNumber = channelNumber
        request.value = value
        request.futureValue = futureValue
        request.delay = delay
        request.unit = unit

        try await Gateway.callAsync("device/set_analog_output_schedule", request)
    }

    /**
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

        var request = DtoRequests.DeviceSetAllAnalogOutputsScheduleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.values = values
        request.futureValues = futureValues
        request.delay = delay
        request.unit = unit

        try await Gateway.callAsync("device/set_all_analog_outputs_schedule", request)
    }

    /**
     Sets the cutoff frequency of the low-pass filter for the specified analog input channel.
     Set the frequency to 0 to disable the filter.

     - Parameters:
        - channelNumber: Channel number starting at 1.
        - cutoffFrequency: Cutoff frequency of the low-pass filter.
        - unit: Units of frequency.
     */
    public func setAnalogInputLowpassFilter(channelNumber: Int, cutoffFrequency: Double, unit: Units = Units.native) async throws  {
        var request = DtoRequests.DeviceSetLowpassFilterRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.channelNumber = channelNumber
        request.cutoffFrequency = cutoffFrequency
        request.unit = unit

        try await Gateway.callAsync("device/set_lowpass_filter", request)
    }

    /**
     Cancels a scheduled digital output action.
     Requires at least Firmware 7.37.

     - Parameters:
        - channelNumber: Channel number starting at 1.
     */
    public func cancelDigitalOutputSchedule(channelNumber: Int) async throws  {
        var request = DtoRequests.DeviceCancelOutputScheduleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.analog = false
        request.channelNumber = channelNumber

        try await Gateway.callAsync("device/cancel_output_schedule", request)
    }

    /**
     Cancel all scheduled digital output actions.
     Requires at least Firmware 7.37.

     - Parameters:
        - channels: Optionally specify which channels to cancel.
          Array length must be empty or equal to the number of channels on device.
          Specifying "True" for a channel will cancel the scheduled digital output action for that channel.
     */
    public func cancelAllDigitalOutputsSchedule(channels: [Bool] = []) async throws  {
        var request = DtoRequests.DeviceCancelAllOutputsScheduleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.analog = false
        request.channels = channels

        try await Gateway.callAsync("device/cancel_all_outputs_schedule", request)
    }

    /**
     Cancels a scheduled analog output value.
     Requires at least Firmware 7.38.

     - Parameters:
        - channelNumber: Channel number starting at 1.
     */
    public func cancelAnalogOutputSchedule(channelNumber: Int) async throws  {
        var request = DtoRequests.DeviceCancelOutputScheduleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.analog = true
        request.channelNumber = channelNumber

        try await Gateway.callAsync("device/cancel_output_schedule", request)
    }

    /**
     Cancel all scheduled analog output actions.
     Requires at least Firmware 7.38.

     - Parameters:
        - channels: Optionally specify which channels to cancel.
          Array length must be empty or equal to the number of channels on device.
          Specifying "True" for a channel will cancel the scheduled analog output value for that channel.
     */
    public func cancelAllAnalogOutputsSchedule(channels: [Bool] = []) async throws  {
        var request = DtoRequests.DeviceCancelAllOutputsScheduleRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.analog = true
        request.channels = channels

        try await Gateway.callAsync("device/cancel_all_outputs_schedule", request)
    }

}

