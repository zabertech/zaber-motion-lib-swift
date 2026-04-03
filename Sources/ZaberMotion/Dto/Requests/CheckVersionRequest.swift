// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct CheckVersionRequest: Serializable {
    public var version: String
    public var host: String

    public init(version: String = "", host: String = "") {
        self.version = version
        self.host = host
    }
}
