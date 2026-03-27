/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii


public struct PvtPartialConvertTimeResponse: Serializable {
    public var sequenceData: [DtoAscii.PvtPartialSequenceItem]

    public init(sequenceData: [DtoAscii.PvtPartialSequenceItem] = []) {
        self.sequenceData = sequenceData
    }
}
