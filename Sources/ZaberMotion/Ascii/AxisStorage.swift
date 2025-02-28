// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import DtoRequests
import Gateway
import ZaberMotionExceptions

/**
 Class providing access to axis storage.
 Requires at least Firmware 7.30.
 */
public final class AxisStorage: @unchecked Sendable {

    private let axis: Axis

    package init(axis: Axis) {
        self.axis = axis
    }

    /**
     Sets the axis value stored at the provided key.

     - Parameters:
        - key: Key to set the value at.
        - value: Value to set.
        - encode: Whether the stored value should be base64 encoded before being stored.
          This makes the string unreadable to humans using the ASCII protocol,
          however, values stored this way can be of any length and use non-ASCII and protocol reserved characters.
     */
    public func setString(key: String, value: String, encode: Bool = false) async throws  {
        var request = DtoRequests.DeviceSetStorageRequest()
        request.interfaceId = axis.device.connection.interfaceId
        request.device = axis.device.deviceAddress
        request.axis = axis.axisNumber
        request.key = key
        request.value = value
        request.encode = encode

        try await Gateway.callAsync("device/set_storage", request)
    }

    /**
     Gets the axis value stored with the provided key.

     - Parameters:
        - key: Key to read the value of.
        - decode: Whether the stored value should be decoded.
          Only use this when reading values set by storage.set with "encode" true.

     - Returns: Stored value.
     */
    public func getString(key: String, decode: Bool = false) async throws -> String {
        var request = DtoRequests.DeviceGetStorageRequest()
        request.interfaceId = axis.device.connection.interfaceId
        request.device = axis.device.deviceAddress
        request.axis = axis.axisNumber
        request.key = key
        request.decode = decode

        let response = try await Gateway.callAsync("device/get_storage", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Sets the value at the provided key to the provided number.

     - Parameters:
        - key: Key to set the value at.
        - value: Value to set.
     */
    public func setNumber(key: String, value: Double) async throws  {
        var request = DtoRequests.DeviceSetStorageNumberRequest()
        request.interfaceId = axis.device.connection.interfaceId
        request.device = axis.device.deviceAddress
        request.axis = axis.axisNumber
        request.key = key
        request.value = value

        try await Gateway.callAsync("device/set_storage_number", request)
    }

    /**
     Gets the value at the provided key interpreted as a number.

     - Parameters:
        - key: Key to get the value at.

     - Returns: Stored value.
     */
    public func getNumber(key: String) async throws -> Double {
        var request = DtoRequests.DeviceStorageRequest()
        request.interfaceId = axis.device.connection.interfaceId
        request.device = axis.device.deviceAddress
        request.axis = axis.axisNumber
        request.key = key

        let response = try await Gateway.callAsync("device/get_storage_number", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Sets the value at the provided key to the provided boolean.

     - Parameters:
        - key: Key to set the value at.
        - value: Value to set.
     */
    public func setBool(key: String, value: Bool) async throws  {
        var request = DtoRequests.DeviceSetStorageBoolRequest()
        request.interfaceId = axis.device.connection.interfaceId
        request.device = axis.device.deviceAddress
        request.axis = axis.axisNumber
        request.key = key
        request.value = value

        try await Gateway.callAsync("device/set_storage_bool", request)
    }

    /**
     Gets the value at the provided key interpreted as a boolean.

     - Parameters:
        - key: Key to get the value at.

     - Returns: Stored value.
     */
    public func getBool(key: String) async throws -> Bool {
        var request = DtoRequests.DeviceStorageRequest()
        request.interfaceId = axis.device.connection.interfaceId
        request.device = axis.device.deviceAddress
        request.axis = axis.axisNumber
        request.key = key

        let response = try await Gateway.callAsync("device/get_storage_bool", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Erases the axis value stored at the provided key.

     - Parameters:
        - key: Key to erase.

     - Returns: A boolean indicating if the key existed.
     */
    public func eraseKey(key: String) async throws -> Bool {
        var request = DtoRequests.DeviceStorageRequest()
        request.interfaceId = axis.device.connection.interfaceId
        request.device = axis.device.deviceAddress
        request.axis = axis.axisNumber
        request.key = key

        let response = try await Gateway.callAsync("device/erase_storage", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Lists the axis storage keys matching a given prefix.
     Omit the prefix to list all the keys.

     - Parameters:
        - prefix: Optional key prefix.

     - Returns: Storage keys matching the given prefix.
     */
    public func listKeys(prefix: String? = nil) async throws -> [String] {
        var request = DtoRequests.DeviceStorageListKeysRequest()
        request.interfaceId = axis.device.connection.interfaceId
        request.device = axis.device.deviceAddress
        request.axis = axis.axisNumber
        request.prefix = prefix

        let response = try await Gateway.callAsync("device/storage_list_keys", request, DtoRequests.StringArrayResponse.fromByteArray)
        return response.values
    }

    /**
     Determines whether a given key exists in axis storage.

     - Parameters:
        - key: Key which existence to determine.

     - Returns: True indicating that the key exists, false otherwise.
     */
    public func keyExists(key: String) async throws -> Bool {
        var request = DtoRequests.DeviceStorageRequest()
        request.interfaceId = axis.device.connection.interfaceId
        request.device = axis.device.deviceAddress
        request.axis = axis.axisNumber
        request.key = key

        let response = try await Gateway.callAsync("device/storage_key_exists", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

}

