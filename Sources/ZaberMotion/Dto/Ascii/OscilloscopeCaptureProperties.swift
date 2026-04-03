// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * The public properties of one channel of recorded oscilloscope data.
 */
public struct OscilloscopeCaptureProperties: Serializable {

    /**
     * Indicates whether the data came from a setting or an I/O pin.
     */
    public var dataSource: OscilloscopeDataSource

    /**
     * The name of the recorded setting.
     */
    public var setting: String

    /**
     * The number of the axis the data was recorded from, or 0 for the controller.
     */
    public var axisNumber: Int

    /**
     * Which kind of I/O port data was recorded from.
     */
    public var ioType: IoPortType

    /**
     * Which I/O pin within the port was recorded.
     */
    public var ioChannel: Int

    public init(dataSource: OscilloscopeDataSource = OscilloscopeDataSource(rawValue: 0)!, setting: String = "", axisNumber: Int = 0, ioType: IoPortType = IoPortType(rawValue: 0)!, ioChannel: Int = 0) {
        self.dataSource = dataSource
        self.setting = setting
        self.axisNumber = axisNumber
        self.ioType = ioType
        self.ioChannel = ioChannel
    }
}
