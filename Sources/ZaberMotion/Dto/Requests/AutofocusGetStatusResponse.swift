// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoMicroscopy


public struct AutofocusGetStatusResponse: Serializable {
    public var status: DtoMicroscopy.AutofocusStatus

    public init(status: DtoMicroscopy.AutofocusStatus = AutofocusStatus()) {
        self.status = status
    }
}
