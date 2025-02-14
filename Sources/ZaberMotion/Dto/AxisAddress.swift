/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Holds device address and axis number.
 */
public struct AxisAddress: Serializable {

    /**
     * Device address.
     */
    public var device: Int

    /**
     * Axis number.
     */
    public var axis: Int

    public init(device: Int = 0, axis: Int = 0) {
        self.device = device
        self.axis = axis
    }

    public static func fromByteArray(_ byteArray: Data) throws -> AxisAddress {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(AxisAddress.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "AxisAddress", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "AxisAddress", error: error)
        }
    }
}
