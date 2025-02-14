/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * The axis numbers of a lockstep group.
 */
public struct LockstepAxes: Serializable {

    /**
     * The axis number used to set the first axis.
     */
    public var axis1: Int

    /**
     * The axis number used to set the second axis.
     */
    public var axis2: Int

    /**
     * The axis number used to set the third axis.
     */
    public var axis3: Int

    /**
     * The axis number used to set the fourth axis.
     */
    public var axis4: Int

    public init(axis1: Int = 0, axis2: Int = 0, axis3: Int = 0, axis4: Int = 0) {
        self.axis1 = axis1
        self.axis2 = axis2
        self.axis3 = axis3
        self.axis4 = axis4
    }

    public static func fromByteArray(_ byteArray: Data) throws -> LockstepAxes {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(LockstepAxes.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "LockstepAxes", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "LockstepAxes", error: error)
        }
    }
}
