// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct DeviceMultiGetSettingRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var settings: [DtoAscii.GetSetting]
    public var axisSettings: [DtoAscii.GetAxisSetting]

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, settings: [DtoAscii.GetSetting] = [], axisSettings: [DtoAscii.GetAxisSetting] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.settings = settings
        self.axisSettings = axisSettings
    }
}
