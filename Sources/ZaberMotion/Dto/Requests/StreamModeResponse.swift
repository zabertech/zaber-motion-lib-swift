// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct StreamModeResponse: Serializable {
    public var streamMode: DtoAscii.StreamMode
    public var pvtMode: DtoAscii.PvtMode

    public init(streamMode: DtoAscii.StreamMode = StreamMode(rawValue: 0)!, pvtMode: DtoAscii.PvtMode = PvtMode(rawValue: 0)!) {
        self.streamMode = streamMode
        self.pvtMode = pvtMode
    }
}
