// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import DtoRequests
import Gateway
import ZaberMotionExceptions
import Utils

/**
 Module: ZaberMotionAscii

 Class providing access to various axis settings and properties.
 */
public final class AxisSettings: @unchecked Sendable {

    private let axis: Axis

    package init(axis: Axis) {
        self.axis = axis
    }

    /**
     Module: ZaberMotionAscii

     Returns any axis setting or property.
     For more information refer to the [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_settings).

     - Parameters:
        - setting: Name of the setting.
        - unit: Units of setting.

     - Returns: Setting value.
     */
    public func get(setting: String, unit: Units = Units.native) async throws -> Double {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
        request.setting = setting
        request.unit = unit

        let response = try await Gateway.callAsync("device/get_setting", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Sets any axis setting.
     For more information refer to the [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_settings).

     - Parameters:
        - setting: Name of the setting.
        - value: Value of the setting.
        - unit: Units of setting.
     */
    public func set(setting: String, value: Double, unit: Units = Units.native) async throws  {
        var request = DtoRequests.DeviceSetSettingRequest()
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
        request.setting = setting
        request.value = value
        request.unit = unit

        try await Gateway.callAsync("device/set_setting", request)
    }

    /**
     Module: ZaberMotionAscii

     Returns any axis setting or property as a string.
     For more information refer to the [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_settings).

     - Parameters:
        - setting: Name of the setting.

     - Returns: Setting value.
     */
    public func getString(setting: String) async throws -> String {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
        request.setting = setting

        let response = try await Gateway.callAsync("device/get_setting_str", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Sets any axis setting as a string.
     For more information refer to the [ASCII Protocol Manual](https://www.zaber.com/protocol-manual#topic_settings).

     - Parameters:
        - setting: Name of the setting.
        - value: Value of the setting.
     */
    public func setString(setting: String, value: String) async throws  {
        var request = DtoRequests.DeviceSetSettingStrRequest()
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
        request.setting = setting
        request.value = value

        try await Gateway.callAsync("device/set_setting_str", request)
    }

    /**
     Module: ZaberMotionAscii

     Convert arbitrary setting value to Zaber native units.

     - Parameters:
        - setting: Name of the setting.
        - value: Value of the setting in units specified by following argument.
        - unit: Units of the value.

     - Returns: Setting value.
     */
    public func convertToNativeUnits(setting: String, value: Double, unit: Units) throws -> Double {
        var request = DtoRequests.DeviceConvertSettingRequest()
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
        request.setting = setting
        request.value = value
        request.unit = unit

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
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
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
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
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
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
        request.setting = setting

        let response = try Gateway.callSync("device/get_setting_default_str", request, DtoRequests.StringResponse.fromByteArray)
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
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
        request.setting = setting

        let response = try Gateway.callSync("device/can_convert_setting", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Overrides default unit conversions.
     Conversion factors are specified by setting names representing underlying dimensions.
     Requires at least Firmware 7.30.

     - Parameters:
        - conversions: Factors of all conversions to override.
     */
    public func setCustomUnitConversions(conversions: [ConversionFactor]) async throws  {
        var request = DtoRequests.DeviceSetUnitConversionsRequest()
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
        request.conversions = conversions

        try await Gateway.callAsync("device/set_unit_conversions", request)
    }

    /**
     Module: ZaberMotionAscii

     Gets many setting values in as few requests as possible.

     - Parameters:
        - axisSettings: The settings to read.

     - Returns: The setting values read.
     */
    public func getMany(_ axisSettings: GetAxisSetting...) async throws -> [GetAxisSettingResult] {
        _assertSendable(GetAxisSettingResult.self)

        var request = DtoRequests.DeviceMultiGetSettingRequest()
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
        request.axisSettings = axisSettings

        let response = try await Gateway.callAsync("device/get_many_settings", request, DtoRequests.GetAxisSettingResults.fromByteArray)
        return response.results
    }

    /**
     Module: ZaberMotionAscii

     Gets many setting values in the same tick, ensuring their values are synchronized.
     Requires at least Firmware 7.35.

     - Parameters:
        - axisSettings: The settings to read.

     - Returns: The setting values read.
     */
    public func getSynchronized(_ axisSettings: GetAxisSetting...) async throws -> [GetAxisSettingResult] {
        _assertSendable(GetAxisSettingResult.self)

        var request = DtoRequests.DeviceMultiGetSettingRequest()
        request.interfaceId = self.axis.device.connection.interfaceId
        request.device = self.axis.device.deviceAddress
        request.axis = self.axis.axisNumber
        request.axisSettings = axisSettings

        let response = try await Gateway.callAsync("device/get_sync_settings", request, DtoRequests.GetAxisSettingResults.fromByteArray)
        return response.results
    }

}

