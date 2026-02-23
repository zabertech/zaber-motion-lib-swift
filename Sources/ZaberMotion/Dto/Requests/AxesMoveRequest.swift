/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import Dto


public struct AxesMoveRequest: Serializable {
    public var interfaces: [Int]
    public var devices: [Int]
    public var axes: [Int]
    public var position: [Dto.Measurement]

    public init(interfaces: [Int] = [], devices: [Int] = [], axes: [Int] = [], position: [Dto.Measurement] = []) {
        self.interfaces = interfaces
        self.devices = devices
        self.axes = axes
        self.position = position
    }
}
