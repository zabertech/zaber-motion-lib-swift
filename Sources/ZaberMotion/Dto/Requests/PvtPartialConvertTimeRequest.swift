/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii


public struct PvtPartialConvertTimeRequest: Serializable {
    public var sequenceData: [DtoAscii.PvtPartialSequenceItem]
    public var fromAbsolute: Bool

    public init(sequenceData: [DtoAscii.PvtPartialSequenceItem] = [], fromAbsolute: Bool = false) {
        self.sequenceData = sequenceData
        self.fromAbsolute = fromAbsolute
    }
}
