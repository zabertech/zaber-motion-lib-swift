// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct PvtPartialConvertTimeResponse: Serializable {
    public var sequenceData: [DtoAscii.PvtPartialSequenceItem]

    public init(sequenceData: [DtoAscii.PvtPartialSequenceItem] = []) {
        self.sequenceData = sequenceData
    }
}
