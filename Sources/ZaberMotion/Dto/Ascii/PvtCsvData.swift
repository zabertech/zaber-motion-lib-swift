/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * Data representing content loaded from PVT CSV file, with sequence data and sequence names.
 */
public struct PvtCsvData: Serializable {

    /**
     * The positions, velocities and times of the PVT sequence.
     */
    public var sequenceData: PvtSequenceData

    /**
     * The names of the columns in the CSV header.
     * If the header columns do not contain names, these will default to `Series 1`, `Series 2`, etc..
     */
    public var seriesNames: [String]

    public init(sequenceData: PvtSequenceData = PvtSequenceData(), seriesNames: [String] = []) {
        self.sequenceData = sequenceData
        self.seriesNames = seriesNames
    }

    public static func fromByteArray(_ byteArray: Data) throws -> PvtCsvData {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(PvtCsvData.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "PvtCsvData", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "PvtCsvData", error: error)
        }
    }
}
