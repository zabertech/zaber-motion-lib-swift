// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct PvtSubmitSequenceDataRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var sequenceData: [DtoAscii.PvtSequenceItem]

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, sequenceData: [DtoAscii.PvtSequenceItem] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.sequenceData = sequenceData
    }
}
