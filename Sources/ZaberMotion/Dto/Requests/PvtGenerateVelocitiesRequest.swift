/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct PvtGenerateVelocitiesRequest: Serializable {
    public var positions: [DtoAscii.MeasurementSequence]
    public var velocities: [DtoAscii.OptionalMeasurementSequence]?
    public var times: DtoAscii.MeasurementSequence
    public var timesRelative: Bool

    public init(positions: [DtoAscii.MeasurementSequence] = [], velocities: [DtoAscii.OptionalMeasurementSequence]? = nil, times: DtoAscii.MeasurementSequence = MeasurementSequence(), timesRelative: Bool = false) {
        self.positions = positions
        self.velocities = velocities
        self.times = times
        self.timesRelative = timesRelative
    }

    public static func fromByteArray(_ byteArray: Data) throws -> PvtGenerateVelocitiesRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(PvtGenerateVelocitiesRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "PvtGenerateVelocitiesRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "PvtGenerateVelocitiesRequest", error: error)
        }
    }
}
