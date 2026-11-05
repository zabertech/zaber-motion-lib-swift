// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct DeviceGetLockstepInfoResponse: Serializable {
    public var infos: [DtoAscii.LockstepInfo]

    public init(infos: [DtoAscii.LockstepInfo] = []) {
        self.infos = infos
    }
}
