/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Third party components of the microscope.
 */
public struct ThirdPartyComponents: Serializable {

    /**
     * Autofocus provider identifier.
     */
    public var autofocus: Int?

    public init(autofocus: Int? = nil) {
        self.autofocus = autofocus
    }

    public static func fromByteArray(_ byteArray: Data) throws -> ThirdPartyComponents {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(ThirdPartyComponents.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "ThirdPartyComponents", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "ThirdPartyComponents", error: error)
        }
    }
}
