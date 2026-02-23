/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoMicroscopy


public struct WdiGetStatusResponse: Serializable {
    public var status: DtoMicroscopy.WdiAutofocusProviderStatus

    public init(status: DtoMicroscopy.WdiAutofocusProviderStatus = WdiAutofocusProviderStatus()) {
        self.status = status
    }
}
