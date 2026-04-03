// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct DeviceOnAllResponse: Serializable {
    public var deviceAddresses: [Int]

    public init(deviceAddresses: [Int] = []) {
        self.deviceAddresses = deviceAddresses
    }
}
