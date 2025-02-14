/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Status of the autofocus.
 */
public struct AutofocusStatus: Serializable {

    /**
     * Indicates whether the autofocus is in focus.
     */
    public var inFocus: Bool

    /**
     * Indicates whether the autofocus is in range.
     */
    public var inRange: Bool

    public init(inFocus: Bool = false, inRange: Bool = false) {
        self.inFocus = inFocus
        self.inRange = inRange
    }

    public static func fromByteArray(_ byteArray: Data) throws -> AutofocusStatus {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(AutofocusStatus.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "AutofocusStatus", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "AutofocusStatus", error: error)
        }
    }
}
