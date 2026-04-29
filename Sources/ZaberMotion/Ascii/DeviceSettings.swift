// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import Dto
import DtoAscii
import DtoRequests
import Gateway
import ZaberMotionExceptions
import Utils

/**
 Module: ZaberMotionAscii

 Class providing access to various device settings and properties.
 */
public final class DeviceSettings: @unchecked Sendable {

    private let device: Device

    package init(device: Device) {
        self.device = device
    }

    /**
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

     Returns any device setting or property in its native type.
     Note that specifying units will cause settings that are otherwise integers to be returned as floats.
     For more information refer to the [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_settings).

     - Parameters:
        - setting: Name of the setting.
        - unit: Units of setting to convert result to.

     - Returns: Setting value.
     */
    public func getTyped(setting: String, unit: Units = Units.native) async throws -> TypedSetting {
        _assertSendable(TypedSetting.self)

        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.setting = setting
        request.unit = unit

        let response = try await Gateway.callAsync("device/get_setting_typed", request, DtoRequests.TypedSettingResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

     Returns any device setting or property as an integer.
     For more information refer to the [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_settings).

     - Parameters:
        - setting: Name of the setting.

     - Returns: Setting value.
     */
    public func getInt(setting: String) async throws -> Int64 {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.setting = setting

        let response = try await Gateway.callAsync("device/get_setting_int", request, DtoRequests.Int64Response.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Sets any device setting or property as an integer.
     For more information refer to the [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_settings).

     - Parameters:
        - setting: Name of the setting.
        - value: Value of the setting.
     */
    public func setInt(setting: String, value: Int64) async throws  {
        var request = DtoRequests.DeviceSetSettingIntRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.setting = setting
        request.value = value

        try await Gateway.callAsync("device/set_setting_int", request)
    }

    /**
     Module: ZaberMotionAscii

     Returns any device setting or property as a boolean.
     For more information refer to the [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_settings).

     - Parameters:
        - setting: Name of the setting.

     - Returns: Setting value.
     */
    public func getBool(setting: String) async throws -> Bool {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.setting = setting

        let response = try await Gateway.callAsync("device/get_setting_bool", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Sets any device setting as a boolean.
     For more information refer to the [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_settings).

     - Parameters:
        - setting: Name of the setting.
        - value: Value of the setting.
     */
    public func setBool(setting: String, value: Bool) async throws  {
        var request = DtoRequests.DeviceSetSettingBoolRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.setting = setting
        request.value = value

        try await Gateway.callAsync("device/set_setting_bool", request)
    }

    /**
     Module: ZaberMotionAscii

     Convert arbitrary setting value to Zaber native units.

     - Parameters:
        - setting: Name of the setting.
        - value: Value of the setting in units specified by following argument.
        - unit: Units of the value.
        - round: If true, round the result to the device's native decimal places.

     - Returns: Setting value.
     */
    public func convertToNativeUnits(setting: String, value: Double, unit: Units, round: Bool = false) throws -> Double {
        var request = DtoRequests.DeviceConvertSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.setting = setting
        request.value = value
        request.unit = unit
        request.round = round

        let response = try Gateway.callSync("device/convert_setting", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

     Returns the default value of a setting as an integer.

     - Parameters:
        - setting: Name of the setting.

     - Returns: Default setting value.
     */
    public func getDefaultInt(setting: String) throws -> Int64 {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.setting = setting

        let response = try Gateway.callSync("device/get_setting_default_int", request, DtoRequests.Int64Response.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Returns the default value of a setting as a boolean.

     - Parameters:
        - setting: Name of the setting.

     - Returns: Default setting value.
     */
    public func getDefaultBool(setting: String) throws -> Bool {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.setting = setting

        let response = try Gateway.callSync("device/get_setting_default_bool", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

     Retrieves unit conversion descriptor for a setting, allowing unit conversion without a device.
     The descriptor can be used with the ConvertTo/FromNativeUnits methods of the UnitTable class.

     - Parameters:
        - setting: Name of the setting.

     - Returns: The unit conversion descriptor for the setting.
     */
    public func getUnitConversionDescriptor(setting: String) throws -> UnitConversionDescriptor {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.setting = setting

        let response = try Gateway.callSync("device/get_setting_unit_conversion", request, UnitConversionDescriptor.fromByteArray)
        return response
    }

    /**
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

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
     Module: ZaberMotionAscii

     Returns many device settings or properties in their native types in as few requests as possible.
     Note that specifying units will always return floating point values,
     even for settings that are natively integers.
     For more information refer to the [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_settings).

     - Parameters:
        - settings: The settings to read.

     - Returns: The setting values read.
     */
    public func getManyTyped(_ settings: GetSetting...) async throws -> [GetSettingTypedResult] {
        _assertSendable(GetSettingTypedResult.self)

        var request = DtoRequests.DeviceMultiGetSettingRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.settings = settings

        let response = try await Gateway.callAsync("device/get_many_settings_typed", request, DtoRequests.GetSettingsTypedResponse.fromByteArray)
        return response.values
    }

    /**
     Module: ZaberMotionAscii

     Gets many settings in as few requests as possible, parsing each as the caller-specified type.
     Unlike GetManyTyped, the type is determined by the caller, not the device database.
     If a value cannot be parsed as the requested type, an error is thrown.

     - Parameters:
        - floatSettings: Settings to read as float values. Supports unit conversion.
        - intSettings: Settings to read as integer values. Unit conversion is not supported.
        - boolSettings: Settings to read as boolean values.
        - stringSettings: Settings to read as string values.

     - Returns: The setting values grouped by type.
     */
    public func getManyByType(floatSettings: [GetSetting] = [], intSettings: [GetSetting] = [], boolSettings: [GetSetting] = [], stringSettings: [GetSetting] = []) async throws -> GetSettingsByTypeResult {
        _assertSendable(GetSettingsByTypeResult.self)

        var request = DtoRequests.DeviceGetManyByTypeRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.floatSettings = floatSettings
        request.intSettings = intSettings
        request.boolSettings = boolSettings
        request.stringSettings = stringSettings

        let response = try await Gateway.callAsync("device/get_many_settings_by_type", request, GetSettingsByTypeResult.fromByteArray)
        return response
    }

    /**
     Module: ZaberMotionAscii

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
