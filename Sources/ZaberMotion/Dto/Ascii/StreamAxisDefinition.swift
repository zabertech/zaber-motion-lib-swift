/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Defines an axis of the stream.
 */
public struct StreamAxisDefinition: Serializable {

    /**
     * Number of a physical axis or a lockstep group.
     */
    public var axisNumber: Int

    /**
     * Defines the type of the axis.
     */
    public var axisType: StreamAxisType?

    public init(axisNumber: Int = 0, axisType: StreamAxisType? = nil) {
        self.axisNumber = axisNumber
        self.axisType = axisType
    }

    public static func fromByteArray(_ byteArray: Data) throws -> StreamAxisDefinition {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(StreamAxisDefinition.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "StreamAxisDefinition", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "StreamAxisDefinition", error: error)
        }
    }
}
