/* This file is generated. Do not modify by hand. */

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
