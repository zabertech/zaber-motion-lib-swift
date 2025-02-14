/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Named parameter with optional value.
 */
public struct NamedParameter: Serializable {

    /**
     * Name of the parameter.
     */
    public var name: String

    /**
     * Optional value of the parameter.
     */
    public var value: Double?

    public init(name: String = "", value: Double? = nil) {
        self.name = name
        self.value = value
    }

    public static func fromByteArray(_ byteArray: Data) throws -> NamedParameter {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(NamedParameter.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "NamedParameter", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "NamedParameter", error: error)
        }
    }
}
