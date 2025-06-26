// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import UnitsInternal
import DtoRequests
import DtoAscii
import Gateway
import ZaberMotionExceptions
import Utils

/**
 Module: ZaberMotionAscii

 A handle for a trigger with this number on the device.
 Triggers allow setting up actions that occur when a certain condition has been met or an event has occurred.
 Please note that the Triggers API is currently an experimental feature.
 Requires at least Firmware 7.06.
 */
public final class Trigger: @unchecked Sendable {

    package init(device: Device, triggerNumber: Int) {
        self.device = device
        self.triggerNumber = triggerNumber
    }

    /**
     Module: ZaberMotionAscii

     Device that this trigger belongs to.
     */
    public let device: Device

    /**
     Module: ZaberMotionAscii

     Number of this trigger.
     */
    public let triggerNumber: Int

    /**
     Module: ZaberMotionAscii

     Enables the trigger.
     Once a trigger is enabled, it will fire whenever its condition transitions from false to true.
     If a trigger condition is true when a disabled trigger is enabled, the trigger will fire immediately.

     - Parameters:
        - count: Number of times the trigger will fire before disabling itself.
          If count is not specified, or 0, the trigger will fire indefinitely.
     */
    public func enable(count: Int = 0) async throws  {
        guard count >= 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Invalid value; count must be 0 or positive.")
        }

        var request = DtoRequests.TriggerEnableRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.triggerNumber = self.triggerNumber
        request.count = count

        try await Gateway.callAsync("trigger/enable", request)
    }

    /**
     Module: ZaberMotionAscii

     Disables the trigger.
     Once disabled, the trigger will not fire and trigger actions will not run, even if trigger conditions are met.
     */
    public func disable() async throws  {
        var request = DtoRequests.TriggerEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.triggerNumber = self.triggerNumber

        try await Gateway.callAsync("trigger/disable", request)
    }

    /**
     Module: ZaberMotionAscii

     Gets the state of the trigger.

     - Returns: Complete state of the trigger.
     */
    public func getState() async throws -> TriggerState {
        _assertSendable(TriggerState.self)

        var request = DtoRequests.TriggerEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.triggerNumber = self.triggerNumber

        let response = try await Gateway.callAsync("trigger/get_state", request, TriggerState.fromByteArray)
        return response
    }

    /**
     Module: ZaberMotionAscii

     Gets the enabled state of the trigger.

     - Returns: Whether the trigger is enabled and the number of times it will fire.
     */
    public func getEnabledState() async throws -> TriggerEnabledState {
        _assertSendable(TriggerEnabledState.self)

        var request = DtoRequests.TriggerEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.triggerNumber = self.triggerNumber

        let response = try await Gateway.callAsync("trigger/get_enabled_state", request, TriggerEnabledState.fromByteArray)
        return response
    }

    /**
     Module: ZaberMotionAscii

     Set a generic trigger condition.

     - Parameters:
        - condition: The condition to set for this trigger.
     */
    public func fireWhen(condition: String) async throws  {
        var request = DtoRequests.TriggerFireWhenRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.triggerNumber = self.triggerNumber
        request.condition = condition

        try await Gateway.callAsync("trigger/fire_when", request)
    }

    /**
     Module: ZaberMotionAscii

     Set a trigger condition for when an encoder position has changed by a specific distance.

     - Parameters:
        - axis: The axis to monitor for this condition.
          May be set to 0 on single-axis devices only.
        - distance: The measured encoder distance between trigger fires.
        - unit: Units of dist.
     */
    public func fireWhenEncoderDistanceTravelled(axis: Int, distance: Double, unit: Units = Units.native) async throws  {
        guard distance > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Invalid value; encoder distance must be a positive value.")
        }

        var request = DtoRequests.TriggerFireWhenDistanceTravelledRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.triggerNumber = self.triggerNumber
        request.axis = axis
        request.distance = distance
        request.unit = unit

        try await Gateway.callAsync("trigger/fire_when_encoder_distance_travelled", request)
    }

    /**
     Module: ZaberMotionAscii

     Set a trigger condition for when an axis position has changed by a specific distance.

     - Parameters:
        - axis: The axis to monitor for this condition.
          May be set to 0 on single-axis devices only.
        - distance: The measured distance between trigger fires.
        - unit: Units of dist.
     */
    public func fireWhenDistanceTravelled(axis: Int, distance: Double, unit: Units = Units.native) async throws  {
        guard distance > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Invalid value; distance must be a positive value.")
        }

        var request = DtoRequests.TriggerFireWhenDistanceTravelledRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.triggerNumber = self.triggerNumber
        request.axis = axis
        request.distance = distance
        request.unit = unit

        try await Gateway.callAsync("trigger/fire_when_distance_travelled", request)
    }

    /**
     Module: ZaberMotionAscii

     Set a trigger condition based on an IO channel value.

     - Parameters:
        - portType: The type of IO channel to monitor.
        - channel: The IO channel to monitor.
        - triggerCondition: Comparison operator.
        - value: Comparison value.
     */
    public func fireWhenIo(portType: IoPortType, channel: Int, triggerCondition: TriggerCondition, value: Double) async throws  {
        guard channel > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Invalid value; channel must be a positive value.")
        }

        var request = DtoRequests.TriggerFireWhenIoRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.triggerNumber = self.triggerNumber
        request.portType = portType
        request.channel = channel
        request.triggerCondition = triggerCondition
        request.value = value

        try await Gateway.callAsync("trigger/fire_when_io", request)
    }

    /**
     Module: ZaberMotionAscii

     Set a trigger condition based on a setting value.

     - Parameters:
        - axis: The axis to monitor for this condition.
          Set to 0 for device-scope settings.
        - setting: The setting to monitor.
        - triggerCondition: Comparison operator.
        - value: Comparison value.
        - unit: Units of value.
     */
    public func fireWhenSetting(axis: Int, setting: String, triggerCondition: TriggerCondition, value: Double, unit: Units = Units.native) async throws  {
        var request = DtoRequests.TriggerFireWhenSettingRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.triggerNumber = self.triggerNumber
        request.axis = axis
        request.setting = setting
        request.triggerCondition = triggerCondition
        request.value = value
        request.unit = unit

        try await Gateway.callAsync("trigger/fire_when_setting", request)
    }

    /**
     Module: ZaberMotionAscii

     Set a trigger condition based on an absolute setting value.

     - Parameters:
        - axis: The axis to monitor for this condition.
          Set to 0 for device-scope settings.
        - setting: The setting to monitor.
        - triggerCondition: Comparison operator.
        - value: Comparison value.
        - unit: Units of value.
     */
    public func fireWhenAbsoluteSetting(axis: Int, setting: String, triggerCondition: TriggerCondition, value: Double, unit: Units = Units.native) async throws  {
        var request = DtoRequests.TriggerFireWhenSettingRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.triggerNumber = self.triggerNumber
        request.axis = axis
        request.setting = setting
        request.triggerCondition = triggerCondition
        request.value = value
        request.unit = unit

        try await Gateway.callAsync("trigger/fire_when_setting_absolute", request)
    }

    /**
     Module: ZaberMotionAscii

     Set a trigger condition based on a time interval.

     - Parameters:
        - interval: The time interval between trigger fires.
        - unit: Units of time.
     */
    public func fireAtInterval(interval: Double, unit: Units = Units.native) async throws  {
        guard interval > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Invalid value; interval must be a positive value.")
        }

        var request = DtoRequests.TriggerFireAtIntervalRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.triggerNumber = self.triggerNumber
        request.interval = interval
        request.unit = unit

        try await Gateway.callAsync("trigger/fire_at_interval", request)
    }

    /**
     Module: ZaberMotionAscii

     Set a command to be a trigger action.

     - Parameters:
        - action: The action number to assign the command to.
        - axis: The axis to on which to run this command.
          Set to 0 for device-scope settings or to run command on all axes.
        - command: The command to run when the action is triggered.
     */
    public func onFire(action: TriggerAction, axis: Int, command: String) async throws  {
        var request = DtoRequests.TriggerOnFireRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.triggerNumber = self.triggerNumber
        request.action = action
        request.axis = axis
        request.command = command

        try await Gateway.callAsync("trigger/on_fire", request)
    }

    /**
     Module: ZaberMotionAscii

     Set a trigger action to update a setting.

     - Parameters:
        - action: The action number to assign the command to.
        - axis: The axis on which to change the setting.
          Set to 0 to change the setting for the device.
        - setting: The name of the setting to change.
        - operation: The operation to apply to the setting.
        - value: Operation value.
        - unit: Units of value.
     */
    public func onFireSet(action: TriggerAction, axis: Int, setting: String, operation: TriggerOperation, value: Double, unit: Units = Units.native) async throws  {
        var request = DtoRequests.TriggerOnFireSetRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.triggerNumber = self.triggerNumber
        request.action = action
        request.axis = axis
        request.setting = setting
        request.operation = operation
        request.value = value
        request.unit = unit

        try await Gateway.callAsync("trigger/on_fire_set", request)
    }

    /**
     Module: ZaberMotionAscii

     Set a trigger action to update a setting with the value of another setting.

     - Parameters:
        - action: The action number to assign the command to.
        - axis: The axis on which to change the setting.
          Set to 0 to change the setting for the device.
        - setting: The name of the setting to change.
          Must have either integer or boolean type.
        - operation: The operation to apply to the setting.
        - fromAxis: The axis from which to read the setting.
          Set to 0 to read the setting from the device.
        - fromSetting: The name of the setting to read.
          Must have either integer or boolean type.
     */
    public func onFireSetToSetting(action: TriggerAction, axis: Int, setting: String, operation: TriggerOperation, fromAxis: Int, fromSetting: String) async throws  {
        var request = DtoRequests.TriggerOnFireSetToSettingRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.triggerNumber = self.triggerNumber
        request.action = action
        request.axis = axis
        request.setting = setting
        request.operation = operation
        request.fromAxis = fromAxis
        request.fromSetting = fromSetting

        try await Gateway.callAsync("trigger/on_fire_set_to_setting", request)
    }

    /**
     Module: ZaberMotionAscii

     Clear a trigger action.

     - Parameters:
        - action: The action number to clear.
          The default option is to clear all actions.
     */
    public func clearAction(action: TriggerAction = DtoAscii.TriggerAction.all) async throws  {
        var request = DtoRequests.TriggerClearActionRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.triggerNumber = self.triggerNumber
        request.action = action

        try await Gateway.callAsync("trigger/clear_action", request)
    }

    /**
     Module: ZaberMotionAscii

     Returns the label for the trigger.

     - Returns: The label for the trigger.
     */
    public func getLabel() async throws -> String {
        var request = DtoRequests.TriggerEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.triggerNumber = self.triggerNumber

        let response = try await Gateway.callAsync("trigger/get_label", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Sets the label for the trigger.

     - Parameters:
        - label: The label to set for this trigger.
          If no value or an empty string is provided, this label is deleted.
     */
    public func setLabel(label: String?) async throws  {
        var request = DtoRequests.TriggerSetLabelRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.triggerNumber = self.triggerNumber
        request.label = label

        try await Gateway.callAsync("trigger/set_label", request)
    }

}

