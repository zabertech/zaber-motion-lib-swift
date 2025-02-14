/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Contains invalid PVT points for PvtExecutionException.
 */
public struct InvalidPvtPoint: Serializable {

    /**
     * Index of the point numbered from the last submitted point.
     */
    public var index: Int

    /**
     * The textual representation of the point.
     */
    public var point: String

    public init(index: Int = 0, point: String = "") {
        self.index = index
        self.point = point
    }

    public static func fromByteArray(_ byteArray: Data) throws -> InvalidPvtPoint {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(InvalidPvtPoint.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "InvalidPvtPoint", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "InvalidPvtPoint", error: error)
        }
    }
}
