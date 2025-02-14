/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * A parameter used to establish the servo tuning of an axis.
 */
public struct ServoTuningParam: Serializable {

    /**
     * The name of the parameter to set.
     */
    public var name: String

    /**
     * The value to use for this parameter.
     */
    public var value: Double

    public init(name: String = "", value: Double = 0.0) {
        self.name = name
        self.value = value
    }

    public static func fromByteArray(_ byteArray: Data) throws -> ServoTuningParam {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(ServoTuningParam.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "ServoTuningParam", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "ServoTuningParam", error: error)
        }
    }
}
