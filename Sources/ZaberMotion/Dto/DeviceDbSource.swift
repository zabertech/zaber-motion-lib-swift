/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

/**
 * A source that device information can be retrieved from.
 */
public struct DeviceDbSource: Serializable {

    /**
     * Whether the source is a web service or a local DB file.
     */
    public var sourceType: DeviceDbSourceType

    /**
     * The URL of the web service or path to the local DB file.
     */
    public var urlOrFilePath: String?

    public init(sourceType: DeviceDbSourceType = DeviceDbSourceType(rawValue: 0)!, urlOrFilePath: String? = nil) {
        self.sourceType = sourceType
        self.urlOrFilePath = urlOrFilePath
    }
}
