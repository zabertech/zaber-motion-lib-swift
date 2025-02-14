/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Class representing version of firmware in the controller.
 */
public struct FirmwareVersion: Serializable {

    /**
     * Major version number.
     */
    public var major: Int

    /**
     * Minor version number.
     */
    public var minor: Int

    /**
     * Build version number.
     */
    public var build: Int

    public init(major: Int = 0, minor: Int = 0, build: Int = 0) {
        self.major = major
        self.minor = minor
        self.build = build
    }

    public static func fromByteArray(_ byteArray: Data) throws -> FirmwareVersion {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(FirmwareVersion.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "FirmwareVersion", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "FirmwareVersion", error: error)
        }
    }
}
