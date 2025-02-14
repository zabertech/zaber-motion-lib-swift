/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Representation of data gathered during axis identification.
 */
public struct AxisIdentity: Serializable {

    /**
     * Unique ID of the peripheral hardware.
     */
    public var peripheralId: Int

    /**
     * Name of the peripheral.
     */
    public var peripheralName: String

    /**
     * Serial number of the peripheral, or 0 when not applicable.
     */
    public var peripheralSerialNumber: UInt

    /**
     * Indicates whether the axis is a peripheral or part of an integrated device.
     */
    public var isPeripheral: Bool

    /**
     * Determines the type of an axis and units it accepts.
     */
    public var axisType: AxisType

    /**
     * The peripheral has hardware modifications.
     */
    public var isModified: Bool

    public init(peripheralId: Int = 0, peripheralName: String = "", peripheralSerialNumber: UInt = 0, isPeripheral: Bool = false, axisType: AxisType = AxisType(rawValue: 0)!, isModified: Bool = false) {
        self.peripheralId = peripheralId
        self.peripheralName = peripheralName
        self.peripheralSerialNumber = peripheralSerialNumber
        self.isPeripheral = isPeripheral
        self.axisType = axisType
        self.isModified = isModified
    }

    public static func fromByteArray(_ byteArray: Data) throws -> AxisIdentity {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(AxisIdentity.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "AxisIdentity", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "AxisIdentity", error: error)
        }
    }
}
