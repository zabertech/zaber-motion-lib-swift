/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct ForgetDevicesRequest: Serializable {
    public var interfaceId: Int
    public var exceptDevices: [Int]

    public init(interfaceId: Int = 0, exceptDevices: [Int] = []) {
        self.interfaceId = interfaceId
        self.exceptDevices = exceptDevices
    }
}
