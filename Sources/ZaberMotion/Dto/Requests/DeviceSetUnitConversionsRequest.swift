// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct DeviceSetUnitConversionsRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var key: String
    public var conversions: [DtoAscii.ConversionFactor]

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, key: String = "", conversions: [DtoAscii.ConversionFactor] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.key = key
        self.conversions = conversions
    }
}
