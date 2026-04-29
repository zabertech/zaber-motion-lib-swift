// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct GetAxisSettingsTypedResponse: Serializable {
    public var values: [DtoAscii.GetAxisSettingTypedResult]

    public init(values: [DtoAscii.GetAxisSettingTypedResult] = []) {
        self.values = values
    }
}
