// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import DtoRequests
import Gateway
import ZaberMotionExceptions
import Utils

/**
 Class providing access to device triggers.
 Please note that the Triggers API is currently an experimental feature.
 Requires at least Firmware 7.06.
 */
public final class Triggers {

    public init(device: Device) {
        self.device = device
    }

    /**
     Device that these triggers belong to.
     */
    public let device: Device

    /**
     Get the number of triggers for this device.

     - Returns: Number of triggers for this device.
     */
    public func getNumberOfTriggers() async throws -> Int {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.setting = "trigger.numtriggers"

        let response = try await Gateway.callAsync("triggers/get_setting", request, DtoRequests.IntResponse.fromByteArray)
        return response.value
    }

    /**
     Get the number of actions for each trigger for this device.

     - Returns: Number of actions for each trigger for this device.
     */
    public func getNumberOfActions() async throws -> Int {
        var request = DtoRequests.DeviceGetSettingRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress
        request.setting = "trigger.numactions"

        let response = try await Gateway.callAsync("triggers/get_setting", request, DtoRequests.IntResponse.fromByteArray)
        return response.value
    }

    /**
     Get a specific trigger for this device.

     - Parameters:
        - triggerNumber: The number of the trigger to control. Trigger numbers start at 1.

     - Returns: Trigger instance.
     */
    public func getTrigger(triggerNumber: Int) throws -> Trigger {
        guard triggerNumber > 0 else {
            throw ZaberMotionExceptions.InvalidArgumentException(message: "Invalid value; triggers are numbered from 1.")
        }

        return Trigger(device: self.device, triggerNumber: triggerNumber)
    }

    /**
     Get the state for every trigger for this device.

     - Returns: Complete state for every trigger.
     */
    public func getTriggerStates() async throws -> [TriggerState] {
        _assertSendable(TriggerState.self)

        var request = DtoRequests.DeviceEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress

        let response = try await Gateway.callAsync("triggers/get_trigger_states", request, DtoRequests.TriggerStates.fromByteArray)
        return response.states
    }

    /**
     Gets the enabled state for every trigger for this device.

     - Returns: Whether triggers are enabled and the number of times they will fire.
     */
    public func getEnabledStates() async throws -> [TriggerEnabledState] {
        _assertSendable(TriggerEnabledState.self)

        var request = DtoRequests.DeviceEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress

        let response = try await Gateway.callAsync("triggers/get_enabled_states", request, DtoRequests.TriggerEnabledStates.fromByteArray)
        return response.states
    }

    /**
     Gets the labels for every trigger for this device.

     - Returns: The labels for every trigger for this device. If a trigger has no label, the value will be an empty string.
     */
    public func getAllLabels() async throws -> [String] {
        var request = DtoRequests.DeviceEmptyRequest()
        request.interfaceId = self.device.connection.interfaceId
        request.device = self.device.deviceAddress

        let response = try await Gateway.callAsync("triggers/get_all_labels", request, DtoRequests.StringArrayResponse.fromByteArray)
        return response.values
    }

}
