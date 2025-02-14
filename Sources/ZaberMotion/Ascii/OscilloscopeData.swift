﻿// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import DtoRequests
import Gateway
import ZaberMotionExceptions

/**
 Contains a block of contiguous recorded data for one channel of the device's oscilloscope.
 */
public final class OscilloscopeData: @unchecked Sendable {

    public init(dataId: Int) {
        self.dataId = dataId
    }

    /**
     Unique ID for this block of recorded data.
     */
    public let dataId: Int

    /**
     Indicates whether the data came from a setting or an I/O pin.
     */
    public var dataSource: OscilloscopeDataSource {
        get throws { return try self.retrieveProperties().dataSource }
    }

    /**
     The name of the recorded setting.
     */
    public var setting: String {
        get throws { return try self.retrieveProperties().setting }
    }

    /**
     The number of the axis the data was recorded from, or 0 for the controller.
     */
    public var axisNumber: Int {
        get throws { return try self.retrieveProperties().axisNumber }
    }

    /**
     Which kind of I/O port data was recorded from.
     */
    public var ioType: IoPortType {
        get throws { return try self.retrieveProperties().ioType }
    }

    /**
     Which I/O pin within the port was recorded.
     */
    public var ioChannel: Int {
        get throws { return try self.retrieveProperties().ioChannel }
    }

    /**
     Get the sample interval that this data was recorded with.

     - Parameters:
        - unit: Unit of measure to represent the timebase in.

     - Returns: The timebase setting at the time the data was recorded.
     */
    public func getTimebase(unit: Units = Units.native) throws -> Double {
        var request = DtoRequests.OscilloscopeDataGetRequest()
        request.dataId = self.dataId
        request.unit = unit

        let response = try Gateway.callSync("oscilloscopedata/get_timebase", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Get the sampling frequency that this data was recorded with.

     - Parameters:
        - unit: Unit of measure to represent the frequency in.

     - Returns: The frequency (inverse of the timebase setting) at the time the data was recorded.
     */
    public func getFrequency(unit: Units = Units.native) throws -> Double {
        var request = DtoRequests.OscilloscopeDataGetRequest()
        request.dataId = self.dataId
        request.unit = unit

        let response = try Gateway.callSync("oscilloscopedata/get_frequency", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Get the user-specified time period between receipt of the start command and the first data point.
     Under some circumstances, the actual delay may be different - call GetSampleTime(0) to get the effective delay.

     - Parameters:
        - unit: Unit of measure to represent the delay in.

     - Returns: The delay setting at the time the data was recorded.
     */
    public func getDelay(unit: Units = Units.native) throws -> Double {
        var request = DtoRequests.OscilloscopeDataGetRequest()
        request.dataId = self.dataId
        request.unit = unit

        let response = try Gateway.callSync("oscilloscopedata/get_delay", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Calculate the time a sample was recorded, relative to when the recording was triggered.

     - Parameters:
        - index: 0-based index of the sample to calculate the time of.
        - unit: Unit of measure to represent the calculated time in.

     - Returns: The calculated time offset of the data sample at the given index.
     */
    public func getSampleTime(index: Int, unit: Units = Units.native) throws -> Double {
        var request = DtoRequests.OscilloscopeDataGetSampleTimeRequest()
        request.dataId = self.dataId
        request.index = index
        request.unit = unit

        let response = try Gateway.callSync("oscilloscopedata/get_sample_time", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Calculate the time for all samples, relative to when the recording was triggered.

     - Parameters:
        - unit: Unit of measure to represent the calculated time in.

     - Returns: The calculated time offsets of all data samples.
     */
    public func getSampleTimes(unit: Units = Units.native) throws -> [Double] {
        var request = DtoRequests.OscilloscopeDataGetSampleTimeRequest()
        request.dataId = self.dataId
        request.unit = unit

        let response = try Gateway.callSync("oscilloscopedata/get_sample_times", request, DtoRequests.DoubleArrayResponse.fromByteArray)
        return response.values
    }

    /**
     Get the recorded data as an array of doubles, with optional unit conversion.
     Note that not all quantities can be unit converted.
     For example, digital I/O channels and pure numbers such as device mode settings have no units.

     - Parameters:
        - unit: Unit of measure to convert the data to.

     - Returns: The recorded data for one oscilloscope channel, converted to the units specified.
     */
    public func getData(unit: Units = Units.native) throws -> [Double] {
        var request = DtoRequests.OscilloscopeDataGetRequest()
        request.dataId = self.dataId
        request.unit = unit

        let response = try Gateway.callSync("oscilloscopedata/get_samples", request, DtoRequests.OscilloscopeDataGetSamplesResponse.fromByteArray)
        return response.data
    }

    /**
     Releases native resources of an oscilloscope data buffer.

     - Parameters:
        - dataId: The ID of the data buffer to delete.
     */
    static func free(dataId: Int) throws  {
        var request = DtoRequests.OscilloscopeDataIdentifier()
        request.dataId = dataId

        try Gateway.callSync("oscilloscopedata/free", request)
    }

    /**
     Returns recording properties.

     - Returns: Capture properties.
     */
    func retrieveProperties() throws -> OscilloscopeCaptureProperties {
        var request = DtoRequests.OscilloscopeDataIdentifier()
        request.dataId = self.dataId

        return try Gateway.callSync("oscilloscopedata/get_properties", request, OscilloscopeCaptureProperties.fromByteArray)
    }


    // TODO: Maybe need destructor
    // ~OscilloscopeData() {
    //     OscilloscopeData.Free(DataId);
    // }
}

