// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct GetSettingResults: Serializable {
    public var results: [DtoAscii.GetSettingResult]

    public init(results: [DtoAscii.GetSettingResult] = []) {
        self.results = results
    }
}
