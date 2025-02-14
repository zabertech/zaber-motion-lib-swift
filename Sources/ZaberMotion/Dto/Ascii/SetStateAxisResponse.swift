/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * An object containing any non-blocking issues encountered when loading a saved state to an axis.
 */
public struct SetStateAxisResponse: Serializable {

    /**
     * The warnings encountered when applying this state to the given axis.
     */
    public var warnings: [String]

    /**
     * The number of the axis that was set.
     */
    public var axisNumber: Int

    public init(warnings: [String] = [], axisNumber: Int = 0) {
        self.warnings = warnings
        self.axisNumber = axisNumber
    }

    public static func fromByteArray(_ byteArray: Data) throws -> SetStateAxisResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(SetStateAxisResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "SetStateAxisResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "SetStateAxisResponse", error: error)
        }
    }
}
