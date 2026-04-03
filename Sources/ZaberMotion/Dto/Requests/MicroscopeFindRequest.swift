// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoMicroscopy


public struct MicroscopeFindRequest: Serializable {
    public var interfaceId: Int
    public var thirdParty: DtoMicroscopy.ThirdPartyComponents?

    public init(interfaceId: Int = 0, thirdParty: DtoMicroscopy.ThirdPartyComponents? = nil) {
        self.interfaceId = interfaceId
        self.thirdParty = thirdParty
    }
}
