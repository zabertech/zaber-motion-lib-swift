/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii
import Dto


public struct PvtGenerateVelocitiesAndTimesRequest: Serializable {
    public var positions: [DtoAscii.MeasurementSequence]
    public var targetSpeed: Dto.Measurement
    public var targetAcceleration: Dto.Measurement
    public var resampleNumber: Int?

    public init(positions: [DtoAscii.MeasurementSequence] = [], targetSpeed: Dto.Measurement = Measurement(), targetAcceleration: Dto.Measurement = Measurement(), resampleNumber: Int? = nil) {
        self.positions = positions
        self.targetSpeed = targetSpeed
        self.targetAcceleration = targetAcceleration
        self.resampleNumber = resampleNumber
    }

    public static func fromByteArray(_ byteArray: Data) throws -> PvtGenerateVelocitiesAndTimesRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(PvtGenerateVelocitiesAndTimesRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "PvtGenerateVelocitiesAndTimesRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "PvtGenerateVelocitiesAndTimesRequest", error: error)
        }
    }
}
