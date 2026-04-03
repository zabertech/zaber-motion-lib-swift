// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct GetAxisSettingResults: Serializable {
    public var results: [DtoAscii.GetAxisSettingResult]

    public init(results: [DtoAscii.GetAxisSettingResult] = []) {
        self.results = results
    }
}
