// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * The label of an IO port.
 */
public struct IoPortLabel: Serializable {

    /**
     * The type of the port.
     */
    public var portType: IoPortType

    /**
     * The number of the port.
     */
    public var channelNumber: Int

    /**
     * The label of the port.
     */
    public var label: String

    public init(portType: IoPortType = IoPortType(rawValue: 0)!, channelNumber: Int = 0, label: String = "") {
        self.portType = portType
        self.channelNumber = channelNumber
        self.label = label
    }
}
