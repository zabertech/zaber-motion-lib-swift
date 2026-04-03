// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct DiscoverMdnsRequest: Serializable {
    public var duration: Int
    public var interfaceIpAddress: String?

    public init(duration: Int = 0, interfaceIpAddress: String? = nil) {
        self.duration = duration
        self.interfaceIpAddress = interfaceIpAddress
    }
}
