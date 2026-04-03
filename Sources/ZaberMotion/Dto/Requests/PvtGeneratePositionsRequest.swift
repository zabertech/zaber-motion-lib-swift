// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct PvtGeneratePositionsRequest: Serializable {
    public var sequenceItems: [DtoAscii.PvtPartialSequenceItem]

    public init(sequenceItems: [DtoAscii.PvtPartialSequenceItem] = []) {
        self.sequenceItems = sequenceItems
    }
}
