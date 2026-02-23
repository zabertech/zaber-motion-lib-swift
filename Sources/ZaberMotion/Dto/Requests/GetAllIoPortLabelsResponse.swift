/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable
import DtoAscii


public struct GetAllIoPortLabelsResponse: Serializable {
    public var labels: [DtoAscii.IoPortLabel]

    public init(labels: [DtoAscii.IoPortLabel] = []) {
        self.labels = labels
    }
}
