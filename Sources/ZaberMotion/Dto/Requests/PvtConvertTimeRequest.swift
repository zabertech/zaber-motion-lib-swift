// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct PvtConvertTimeRequest: Serializable {
    public var sequenceData: [DtoAscii.PvtSequenceItem]
    public var fromAbsolute: Bool

    public init(sequenceData: [DtoAscii.PvtSequenceItem] = [], fromAbsolute: Bool = false) {
        self.sequenceData = sequenceData
        self.fromAbsolute = fromAbsolute
    }
}
