// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

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
