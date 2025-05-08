/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct PvtGeneratePositionsRequest: Serializable {
    public var velocities: [DtoAscii.MeasurementSequence]
    public var times: DtoAscii.MeasurementSequence
    public var timesRelative: Bool

    public init(velocities: [DtoAscii.MeasurementSequence] = [], times: DtoAscii.MeasurementSequence = MeasurementSequence(), timesRelative: Bool = false) {
        self.velocities = velocities
        self.times = times
        self.timesRelative = timesRelative
    }

    public static func fromByteArray(_ byteArray: Data) throws -> PvtGeneratePositionsRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(PvtGeneratePositionsRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "PvtGeneratePositionsRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "PvtGeneratePositionsRequest", error: error)
        }
    }
}
