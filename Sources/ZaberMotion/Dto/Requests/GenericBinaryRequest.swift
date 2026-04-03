// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable
import DtoBinary


public struct GenericBinaryRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var command: DtoBinary.CommandCode
    public var data: Int
    public var checkErrors: Bool
    public var timeout: Double

    public init(interfaceId: Int = 0, device: Int = 0, command: DtoBinary.CommandCode = CommandCode(rawValue: 0)!, data: Int = 0, checkErrors: Bool = false, timeout: Double = 0.0) {
        self.interfaceId = interfaceId
        self.device = device
        self.command = command
        self.data = data
        self.checkErrors = checkErrors
        self.timeout = timeout
    }
}
