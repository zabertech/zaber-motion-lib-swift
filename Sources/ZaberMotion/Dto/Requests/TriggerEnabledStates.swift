// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoAscii


public struct TriggerEnabledStates: Serializable {
    public var states: [DtoAscii.TriggerEnabledState]

    public init(states: [DtoAscii.TriggerEnabledState] = []) {
        self.states = states
    }
}
