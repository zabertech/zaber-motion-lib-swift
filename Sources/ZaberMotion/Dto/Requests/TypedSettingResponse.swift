// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct TypedSettingResponse: Serializable {
    public var value: DtoAscii.TypedSetting

    public init(value: DtoAscii.TypedSetting = .double(0.0)) {
        self.value = value
    }
}
