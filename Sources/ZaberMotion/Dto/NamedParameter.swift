// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Named parameter with optional value.
 */
public struct NamedParameter: Serializable {

    /**
     * Name of the parameter.
     */
    public var name: String

    /**
     * Optional value of the parameter.
     */
    public var value: Double?

    public init(name: String = "", value: Double? = nil) {
        self.name = name
        self.value = value
    }
}
