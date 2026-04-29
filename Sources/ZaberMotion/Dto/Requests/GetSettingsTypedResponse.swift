// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct GetSettingsTypedResponse: Serializable {
    public var values: [DtoAscii.GetSettingTypedResult]

    public init(values: [DtoAscii.GetSettingTypedResult] = []) {
        self.values = values
    }
}
