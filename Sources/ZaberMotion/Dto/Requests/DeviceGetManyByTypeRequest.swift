// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct DeviceGetManyByTypeRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var floatSettings: [DtoAscii.GetSetting]
    public var intSettings: [DtoAscii.GetSetting]
    public var boolSettings: [DtoAscii.GetSetting]
    public var stringSettings: [DtoAscii.GetSetting]

    public init(interfaceId: Int = 0, device: Int = 0, floatSettings: [DtoAscii.GetSetting] = [], intSettings: [DtoAscii.GetSetting] = [], boolSettings: [DtoAscii.GetSetting] = [], stringSettings: [DtoAscii.GetSetting] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.floatSettings = floatSettings
        self.intSettings = intSettings
        self.boolSettings = boolSettings
        self.stringSettings = stringSettings
    }
}
