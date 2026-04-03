// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct PvtBufferGetSequenceDataResponse: Serializable {
    public var sequenceData: [DtoAscii.PvtSequenceItem]

    public init(sequenceData: [DtoAscii.PvtSequenceItem] = []) {
        self.sequenceData = sequenceData
    }
}
