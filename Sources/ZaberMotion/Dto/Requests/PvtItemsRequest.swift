/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii


public struct PvtItemsRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var streamId: Int
    public var pvt: Bool
    public var type: StreamSegmentType
    public var sequenceData: [DtoAscii.PvtSequenceItem]

    public init(interfaceId: Int = 0, device: Int = 0, streamId: Int = 0, pvt: Bool = false, type: StreamSegmentType = StreamSegmentType(rawValue: 0)!, sequenceData: [DtoAscii.PvtSequenceItem] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.streamId = streamId
        self.pvt = pvt
        self.type = type
        self.sequenceData = sequenceData
    }
}
