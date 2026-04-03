// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Data representing content loaded from PVT CSV file, with partial sequence data and sequence names.
 */
public struct PvtPartialCsvData: Serializable {

    /**
     * The points and actions of the PVT sequence.
     */
    public var sequenceData: [PvtPartialSequenceItem]

    /**
     * The names of the columns in the CSV header.
     * If the header columns do not contain names, these will default to `Series 1`, `Series 2`, etc..
     */
    public var seriesNames: [String]

    public init(sequenceData: [PvtPartialSequenceItem] = [], seriesNames: [String] = []) {
        self.sequenceData = sequenceData
        self.seriesNames = seriesNames
    }
}
