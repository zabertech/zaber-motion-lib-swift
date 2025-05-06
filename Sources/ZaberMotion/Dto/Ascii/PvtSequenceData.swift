/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Data representing a sequence of pvt points with defined positions, velocities and times.
 */
public struct PvtSequenceData: Serializable {

    /**
     * Pvt sequence positions for each axis.
     */
    public var positions: [MeasurementSequence]

    /**
     * Pvt velocities for each axis.
     */
    public var velocities: [MeasurementSequence]

    /**
     * Relative times corresponding to points in PVT sequence.
     */
    public var times: MeasurementSequence

    public init(positions: [MeasurementSequence] = [], velocities: [MeasurementSequence] = [], times: MeasurementSequence = MeasurementSequence()) {
        self.positions = positions
        self.velocities = velocities
        self.times = times
    }

    public static func fromByteArray(_ byteArray: Data) throws -> PvtSequenceData {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(PvtSequenceData.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "PvtSequenceData", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "PvtSequenceData", error: error)
        }
    }
}
