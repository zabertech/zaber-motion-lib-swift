// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import Dto
import DtoRequests
import Gateway
import ZaberMotionExceptions
import Utils

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
     For more information refer to the [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_settings).

     - Parameters:
        - setting: Name of the setting.
        - unit: Units of setting.

     - Returns: Setting value.
     */
    public func get(setting: String, unit: Units = Units.native) async throws -> Double {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.setting = setting
        request.unit = unit

        let response = try await Gateway.callAsync("device/get_setting", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Sets any device setting.
     For more information refer to the [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_settings).

     - Parameters:
        - setting: Name of the setting.
        - value: Value of the setting.
        - unit: Units of setting.
     */
    public func set(setting: String, value: Double, unit: Units = Units.native) async throws  {
        var request = DtoRequests.DeviceSetSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.setting = setting
        request.value = value
        request.unit = unit

        try await Gateway.callAsync("device/set_setting", request)
    }

    /**
     Returns any device setting or property as a string.
     For more information refer to the [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_settings).

     - Parameters:
        - setting: Name of the setting.

     - Returns: Setting value.
     */
    public func getString(setting: String) async throws -> String {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.setting = setting

        let response = try await Gateway.callAsync("device/get_setting_str", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Sets any device setting as a string.
     For more information refer to the [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_settings).

     - Parameters:
        - setting: Name of the setting.
        - value: Value of the setting.
     */
    public func setString(setting: String, value: String) async throws  {
        var request = DtoRequests.DeviceSetSettingStrRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.setting = setting
        request.value = value

        try await Gateway.callAsync("device/set_setting_str", request)
    }

    /**
     Convert arbitrary setting value to Zaber native units.

     - Parameters:
        - setting: Name of the setting.
        - value: Value of the setting in units specified by following argument.
        - unit: Units of the value.

     - Returns: Setting value.
     */
    public func convertToNativeUnits(setting: String, value: Double, unit: Units) throws -> Double {
        var request = DtoRequests.DeviceConvertSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.setting = setting
        request.value = value
        request.unit = unit

        let response = try Gateway.callSync("device/convert_setting", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Convert arbitrary setting value from Zaber native units.

     - Parameters:
        - setting: Name of the setting.
        - value: Value of the setting in Zaber native units.
        - unit: Units to convert value to.

     - Returns: Setting value.
     */
    public func convertFromNativeUnits(setting: String, value: Double, unit: Units) throws -> Double {
        var request = DtoRequests.DeviceConvertSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.fromNative = true
        request.setting = setting
        request.value = value
        request.unit = unit

        let response = try Gateway.callSync("device/convert_setting", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Returns the default value of a setting.

     - Parameters:
        - setting: Name of the setting.
        - unit: Units of setting.

     - Returns: Default setting value.
     */
    public func getDefault(setting: String, unit: Units = Units.native) throws -> Double {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.setting = setting
        request.unit = unit

        let response = try Gateway.callSync("device/get_setting_default", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Returns the default value of a setting as a string.

     - Parameters:
        - setting: Name of the setting.

     - Returns: Default setting value.
     */
    public func getDefaultString(setting: String) throws -> String {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.setting = setting

        let response = try Gateway.callSync("device/get_setting_default_str", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Indicates if given setting can be converted from and to native units.

     - Parameters:
        - setting: Name of the setting.

     - Returns: True if unit conversion can be performed.
     */
    public func canConvertNativeUnits(setting: String) throws -> Bool {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.setting = setting

        let response = try Gateway.callSync("device/can_convert_setting", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Gets the value of an axis scope setting for each axis on the device.
     Values may be NaN where the setting is not applicable.

     - Parameters:
        - setting: Name of the setting.

     - Returns: The setting values on each axis.
     */
    public func getFromAllAxes(setting: String) async throws -> [Double] {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.setting = setting

        let response = try await Gateway.callAsync("device/get_setting_from_all_axes", request, DtoRequests.DoubleArrayResponse.fromByteArray)
        return response.values
    }

    /**
     Gets many setting values in as few device requests as possible.

     - Parameters:
        - settings: The settings to read.

     - Returns: The setting values read.
     */
    public func getMany(_ settings: GetSetting...) async throws -> [GetSettingResult] {
        _assertSendable(GetSettingResult.self)

        var request = DtoRequests.DeviceMultiGetSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.settings = settings

        let response = try await Gateway.callAsync("device/get_many_settings", request, DtoRequests.GetSettingResults.fromByteArray)
        return response.results
    }

    /**
     Gets many setting values in the same tick, ensuring their values are synchronized.
     Requires at least Firmware 7.35.

     - Parameters:
        - settings: The settings to read.

     - Returns: The setting values read.
     */
    public func getSynchronized(_ settings: GetSetting...) async throws -> [GetSettingResult] {
        _assertSendable(GetSettingResult.self)

        var request = DtoRequests.DeviceMultiGetSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.settings = settings

        let response = try await Gateway.callAsync("device/get_sync_settings", request, DtoRequests.GetSettingResults.fromByteArray)
        return response.results
    }

}
