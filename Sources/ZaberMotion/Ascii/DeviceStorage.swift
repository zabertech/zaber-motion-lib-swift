﻿// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import DtoRequests
import Gateway
import ZaberMotionExceptions

/**
 Module: ZaberMotionAscii

 Class providing access to device storage.
 Requires at least Firmware 7.30.
 */
public final class DeviceStorage: @unchecked Sendable {

    private let device: Device

    package init(device: Device) {
        self.device = device
    }

    /**
     Module: ZaberMotionAscii

     Sets the device value stored at the provided key.

     - Parameters:
        - key: Key to set the value at.
        - value: Value to set.
        - encode: Whether the stored value should be base64 encoded before being stored.
          This makes the string unreadable to humans using the ASCII protocol,
          however, values stored this way can be of any length and use non-ASCII and protocol reserved characters.
     */
    public func setString(key: String, value: String, encode: Bool = false) async throws  {
        var request = DtoRequests.DeviceSetStorageRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.key = key
        request.value = value
        request.encode = encode

        try await Gateway.callAsync("device/set_storage", request)
    }

    /**
     Module: ZaberMotionAscii

     Gets the device value stored with the provided key.

     - Parameters:
        - key: Key to read the value of.
        - decode: Whether the stored value should be decoded.
          Only use this when reading values set by storage.set with "encode" true.

     - Returns: Stored value.
     */
    public func getString(key: String, decode: Bool = false) async throws -> String {
        var request = DtoRequests.DeviceGetStorageRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.key = key
        request.decode = decode

        let response = try await Gateway.callAsync("device/get_storage", request, DtoRequests.StringResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Sets the value at the provided key to the provided number.

     - Parameters:
        - key: Key to set the value at.
        - value: Value to set.
     */
    public func setNumber(key: String, value: Double) async throws  {
        var request = DtoRequests.DeviceSetStorageNumberRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.key = key
        request.value = value

        try await Gateway.callAsync("device/set_storage_number", request)
    }

    /**
     Module: ZaberMotionAscii

     Gets the value at the provided key interpreted as a number.

     - Parameters:
        - key: Key to get the value at.

     - Returns: Stored value.
     */
    public func getNumber(key: String) async throws -> Double {
        var request = DtoRequests.DeviceStorageRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.key = key

        let response = try await Gateway.callAsync("device/get_storage_number", request, DtoRequests.DoubleResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Sets the value at the provided key to the provided boolean.

     - Parameters:
        - key: Key to set the value at.
        - value: Value to set.
     */
    public func setBool(key: String, value: Bool) async throws  {
        var request = DtoRequests.DeviceSetStorageBoolRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.key = key
        request.value = value

        try await Gateway.callAsync("device/set_storage_bool", request)
    }

    /**
     Module: ZaberMotionAscii

     Gets the value at the provided key interpreted as a boolean.

     - Parameters:
        - key: Key to get the value at.

     - Returns: Stored value.
     */
    public func getBool(key: String) async throws -> Bool {
        var request = DtoRequests.DeviceStorageRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.key = key

        let response = try await Gateway.callAsync("device/get_storage_bool", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Erases the device value stored at the provided key.

     - Parameters:
        - key: Key to erase.

     - Returns: A boolean indicating if the key existed.
     */
    public func eraseKey(key: String) async throws -> Bool {
        var request = DtoRequests.DeviceStorageRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.key = key

        let response = try await Gateway.callAsync("device/erase_storage", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

    /**
     Module: ZaberMotionAscii

     Lists the device storage keys matching a given prefix.
     Omit the prefix to list all the keys.

     - Parameters:
        - prefix: Optional key prefix.

     - Returns: Storage keys matching the given prefix.
     */
    public func listKeys(prefix: String? = nil) async throws -> [String] {
        var request = DtoRequests.DeviceStorageListKeysRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.prefix = prefix

        let response = try await Gateway.callAsync("device/storage_list_keys", request, DtoRequests.StringArrayResponse.fromByteArray)
        return response.values
    }

    /**
     Module: ZaberMotionAscii

     Determines whether a given key exists in device storage.

     - Parameters:
        - key: Key which existence to determine.

     - Returns: True indicating that the key exists, false otherwise.
     */
    public func keyExists(key: String) async throws -> Bool {
        var request = DtoRequests.DeviceStorageRequest()
        request.interfaceId = device.connection.interfaceId
        request.device = device.deviceAddress
        request.key = key

        let response = try await Gateway.callAsync("device/storage_key_exists", request, DtoRequests.BoolResponse.fromByteArray)
        return response.value
    }

}

