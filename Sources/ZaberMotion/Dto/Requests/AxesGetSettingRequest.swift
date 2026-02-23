/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import UnitsInternal


public struct AxesGetSettingRequest: Serializable {
    public var interfaces: [Int]
    public var devices: [Int]
    public var axes: [Int]
    public var unit: [Units]
    public var setting: String

    public init(interfaces: [Int] = [], devices: [Int] = [], axes: [Int] = [], unit: [Units] = [], setting: String = "") {
        self.interfaces = interfaces
        self.devices = devices
        self.axes = axes
        self.unit = unit
        self.setting = setting
    }
}
