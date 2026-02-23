/* This file is generated. Do not modify by hand. */

import Foundation
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
}
