// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct AxesEmptyRequest: Serializable {
    public var interfaces: [Int]
    public var devices: [Int]
    public var axes: [Int]

    public init(interfaces: [Int] = [], devices: [Int] = [], axes: [Int] = []) {
        self.interfaces = interfaces
        self.devices = devices
        self.axes = axes
    }
}
