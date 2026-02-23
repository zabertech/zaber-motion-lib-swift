/* This file is generated. Do not modify by hand. */

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
