/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Definition of a mock peripheral.
 */
public struct MockPeripheral: Serializable {

    /**
     * A valid Zaber peripheral ID.
     */
    public var peripheralId: Int

    /**
     * The peripheral has hardware modifications. Defaults to false.
     */
    public var isModified: Bool?

    /**
     * The number of microsteps per full step for peripheral. Defaults to device database default.
     */
    public var resolution: Int?

    public init(peripheralId: Int = 0, isModified: Bool? = nil, resolution: Int? = nil) {
        self.peripheralId = peripheralId
        self.isModified = isModified
        self.resolution = resolution
    }

    public static func fromByteArray(_ byteArray: Data) throws -> MockPeripheral {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(MockPeripheral.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "MockPeripheral", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "MockPeripheral", error: error)
        }
    }
}
