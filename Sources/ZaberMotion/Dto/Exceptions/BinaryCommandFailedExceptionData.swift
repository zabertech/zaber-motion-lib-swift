// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

/**
 * Contains additional data for BinaryCommandFailedException.
 */
public struct BinaryCommandFailedExceptionData: Serializable {

    /**
     * The response data.
     */
    public var responseData: Int

    public init(responseData: Int = 0) {
        self.responseData = responseData
    }
}
