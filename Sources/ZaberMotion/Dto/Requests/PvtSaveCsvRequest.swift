// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct PvtSaveCsvRequest: Serializable {
    public var sequenceData: [DtoAscii.PvtSequenceItem]
    public var path: String
    public var dimensionNames: [String]?

    public init(sequenceData: [DtoAscii.PvtSequenceItem] = [], path: String = "", dimensionNames: [String]? = nil) {
        self.sequenceData = sequenceData
        self.path = path
        self.dimensionNames = dimensionNames
    }
}
