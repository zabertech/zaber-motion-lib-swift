/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct SetServoTuningRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var paramset: DtoAscii.ServoTuningParamset
    public var tuningParams: [DtoAscii.ServoTuningParam]
    public var setUnspecifiedToDefault: Bool

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, paramset: DtoAscii.ServoTuningParamset = ServoTuningParamset(rawValue: 0)!, tuningParams: [DtoAscii.ServoTuningParam] = [], setUnspecifiedToDefault: Bool = false) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.paramset = paramset
        self.tuningParams = tuningParams
        self.setUnspecifiedToDefault = setUnspecifiedToDefault
    }

    public static func fromByteArray(_ byteArray: Data) throws -> SetServoTuningRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(SetServoTuningRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "SetServoTuningRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "SetServoTuningRequest", error: error)
        }
    }
}
