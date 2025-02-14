// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import DtoRequests
import Gateway
import ZaberMotionExceptions

/**
 Class providing access to various device settings and properties.
 */
public final class DeviceSettings {

    private let device: Device

    public init(device: Device) {
        self.device = device
    }

    /**
     Returns any device setting or property.

     - Parameters:
        - setting: Setting to get.
        - unit: Units of setting.

     - Returns: Setting value.
     */
    public func get(setting: BinarySettings, unit: Units = Units.native) async throws -> Double {
        var request = DtoRequests.BinaryDeviceGetSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.setting = setting
        request.unit = unit

        let response = try await Gateway.callAsync("binary/device/get_setting", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Sets any device setting.

     - Parameters:
        - setting: Setting to set.
        - value: Value of the setting.
        - unit: Units of setting.
     */
    public func set(setting: BinarySettings, value: Double, unit: Units = Units.native) async throws  {
        var request = DtoRequests.BinaryDeviceSetSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.setting = setting
        request.value = value
        request.unit = unit

        try await Gateway.callAsync("binary/device/set_setting", request)
    }

}
