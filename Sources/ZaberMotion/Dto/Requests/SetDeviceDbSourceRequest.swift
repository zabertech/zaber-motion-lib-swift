// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import Dto


public struct SetDeviceDbSourceRequest: Serializable {

    /**
     * Whether the source is a web service or a local DB file.
     */
    public var sourceType: Dto.DeviceDbSourceType

    /**
     * The URL of the web service or path to the local DB file.
     */
    public var urlOrFilePath: String?

    public init(sourceType: Dto.DeviceDbSourceType = DeviceDbSourceType(rawValue: 0)!, urlOrFilePath: String? = nil) {
        self.sourceType = sourceType
        self.urlOrFilePath = urlOrFilePath
    }
}
