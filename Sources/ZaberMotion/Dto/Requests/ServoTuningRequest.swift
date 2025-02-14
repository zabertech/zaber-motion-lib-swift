/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct ServoTuningRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var paramset: DtoAscii.ServoTuningParamset

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, paramset: DtoAscii.ServoTuningParamset = ServoTuningParamset(rawValue: 0)!) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.paramset = paramset
    }

    public static func fromByteArray(_ byteArray: Data) throws -> ServoTuningRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(ServoTuningRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "ServoTuningRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "ServoTuningRequest", error: error)
        }
    }
}
