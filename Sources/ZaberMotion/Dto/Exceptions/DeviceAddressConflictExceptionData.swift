/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Contains additional data for DeviceAddressConflictException.
 */
public struct DeviceAddressConflictExceptionData: Serializable {

    /**
     * The full list of detected device addresses.
     */
    public var deviceAddresses: [Int]

    public init(deviceAddresses: [Int] = []) {
        self.deviceAddresses = deviceAddresses
    }

    public static func fromByteArray(_ byteArray: Data) throws -> DeviceAddressConflictExceptionData {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(DeviceAddressConflictExceptionData.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "DeviceAddressConflictExceptionData", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "DeviceAddressConflictExceptionData", error: error)
        }
    }
}
