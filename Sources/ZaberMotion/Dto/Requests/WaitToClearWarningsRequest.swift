// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct WaitToClearWarningsRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var timeout: Double
    public var warningFlags: [String]

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, timeout: Double = 0.0, warningFlags: [String] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.timeout = timeout
        self.warningFlags = warningFlags
    }
}
