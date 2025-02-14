/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct LoadParamset: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var toParamset: DtoAscii.ServoTuningParamset
    public var fromParamset: DtoAscii.ServoTuningParamset

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, toParamset: DtoAscii.ServoTuningParamset = ServoTuningParamset(rawValue: 0)!, fromParamset: DtoAscii.ServoTuningParamset = ServoTuningParamset(rawValue: 0)!) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.toParamset = toParamset
        self.fromParamset = fromParamset
    }

    public static func fromByteArray(_ byteArray: Data) throws -> LoadParamset {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(LoadParamset.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "LoadParamset", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "LoadParamset", error: error)
        }
    }
}
