/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct DeviceSetStorageRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var key: String
    public var value: String
    public var encode: Bool

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, key: String = "", value: String = "", encode: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.key = key
        self.value = value
        self.encode = encode
    }
}
