// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct TriggerStates: Serializable {
    public var states: [DtoAscii.TriggerState]

    public init(states: [DtoAscii.TriggerState] = []) {
        self.states = states
    }
}
