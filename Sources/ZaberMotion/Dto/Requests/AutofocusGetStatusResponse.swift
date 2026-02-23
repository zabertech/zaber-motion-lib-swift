/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoMicroscopy


public struct AutofocusGetStatusResponse: Serializable {
    public var status: DtoMicroscopy.AutofocusStatus

    public init(status: DtoMicroscopy.AutofocusStatus = AutofocusStatus()) {
        self.status = status
    }
}
