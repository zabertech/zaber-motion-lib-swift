/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Defines an axis of the PVT sequence.
 */
public struct PvtAxisDefinition: Serializable {

    /**
     * Number of a physical axis or a lockstep group.
     */
    public var axisNumber: Int

    /**
     * Defines the type of the axis.
     */
    public var axisType: PvtAxisType?

    public init(axisNumber: Int = 0, axisType: PvtAxisType? = nil) {
        self.axisNumber = axisNumber
        self.axisType = axisType
    }

    public static func fromByteArray(_ byteArray: Data) throws -> PvtAxisDefinition {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(PvtAxisDefinition.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "PvtAxisDefinition", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "PvtAxisDefinition", error: error)
        }
    }
}
