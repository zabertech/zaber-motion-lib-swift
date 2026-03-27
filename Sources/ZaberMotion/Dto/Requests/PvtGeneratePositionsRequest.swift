/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii


public struct PvtGeneratePositionsRequest: Serializable {
    public var sequenceItems: [DtoAscii.PvtPartialSequenceItem]

    public init(sequenceItems: [DtoAscii.PvtPartialSequenceItem] = []) {
        self.sequenceItems = sequenceItems
    }
}
