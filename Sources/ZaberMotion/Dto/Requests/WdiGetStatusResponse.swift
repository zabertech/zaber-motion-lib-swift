// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoMicroscopy


public struct WdiGetStatusResponse: Serializable {
    public var status: DtoMicroscopy.WdiAutofocusProviderStatus

    public init(status: DtoMicroscopy.WdiAutofocusProviderStatus = WdiAutofocusProviderStatus()) {
        self.status = status
    }
}
