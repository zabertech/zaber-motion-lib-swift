/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Status of the WDI autofocus.
 */
public struct WdiAutofocusProviderStatus: Serializable {

    /**
     * Indicates whether the autofocus is in range.
     */
    public var inRange: Bool

    /**
     * Indicates whether the laser is turned on.
     */
    public var laserOn: Bool

    public init(inRange: Bool = false, laserOn: Bool = false) {
        self.inRange = inRange
        self.laserOn = laserOn
    }

    public static func fromByteArray(_ byteArray: Data) throws -> WdiAutofocusProviderStatus {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(WdiAutofocusProviderStatus.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "WdiAutofocusProviderStatus", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "WdiAutofocusProviderStatus", error: error)
        }
    }
}
