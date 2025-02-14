/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct ServoTuningParamsetResponse: Serializable {
    public var paramset: DtoAscii.ServoTuningParamset

    public init(paramset: DtoAscii.ServoTuningParamset = ServoTuningParamset(rawValue: 0)!) {
        self.paramset = paramset
    }

    public static func fromByteArray(_ byteArray: Data) throws -> ServoTuningParamsetResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(ServoTuningParamsetResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "ServoTuningParamsetResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "ServoTuningParamsetResponse", error: error)
        }
    }
}
