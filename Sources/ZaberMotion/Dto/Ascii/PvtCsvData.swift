// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Data representing content loaded from PVT CSV file, with sequence data and sequence names.
 */
public struct PvtCsvData: Serializable {

    /**
     * The points and actions of the PVT sequence.
     */
    public var sequenceData: [PvtSequenceItem]

    /**
     * The names of the columns in the CSV header.
     * If the header columns do not contain names, these will default to `Series 1`, `Series 2`, etc..
     */
    public var seriesNames: [String]

    public init(sequenceData: [PvtSequenceItem] = [], seriesNames: [String] = []) {
        self.sequenceData = sequenceData
        self.seriesNames = seriesNames
    }
}
