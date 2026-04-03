// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct GetAllIoPortLabelsResponse: Serializable {
    public var labels: [DtoAscii.IoPortLabel]

    public init(labels: [DtoAscii.IoPortLabel] = []) {
        self.labels = labels
    }
}
