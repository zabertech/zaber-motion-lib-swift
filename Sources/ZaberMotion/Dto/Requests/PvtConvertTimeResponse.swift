/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii


public struct PvtConvertTimeResponse: Serializable {
    public var sequenceData: [DtoAscii.PvtSequenceItem]

    public init(sequenceData: [DtoAscii.PvtSequenceItem] = []) {
        self.sequenceData = sequenceData
    }
}
