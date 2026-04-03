// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Contains additional data for InvalidResponseException.
 */
public struct InvalidResponseExceptionData: Serializable {

    /**
     * The response data.
     */
    public var response: String

    public init(response: String = "") {
        self.response = response
    }
}
