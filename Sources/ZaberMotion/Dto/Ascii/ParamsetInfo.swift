/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * The raw parameters currently saved to a given paramset.
 */
public struct ParamsetInfo: Serializable {

    /**
     * The tuning algorithm used for this axis.
     */
    public var type: String

    /**
     * The version of the tuning algorithm used for this axis.
     */
    public var version: Int

    /**
     * The raw tuning parameters of this device.
     */
    public var params: [ServoTuningParam]

    public init(type: String = "", version: Int = 0, params: [ServoTuningParam] = []) {
        self.type = type
        self.version = version
        self.params = params
    }

    public static func fromByteArray(_ byteArray: Data) throws -> ParamsetInfo {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(ParamsetInfo.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "ParamsetInfo", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "ParamsetInfo", error: error)
        }
    }
}
