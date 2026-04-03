// ===== THIS FILE IS GENERATED FROM A TEMPLATE ===== //
// ============== DO NOT EDIT DIRECTLY ============== //

import Foundation
import DtoSerializable

public struct WdiGenericFloatRequest: Serializable {
    public var interfaceId: Int
    public var registerId: Int
    public var count: Int
    public var offset: Int
    public var registerBank: String
    public var data: [Double]

    public init(interfaceId: Int = 0, registerId: Int = 0, count: Int = 0, offset: Int = 0, registerBank: String = "", data: [Double] = []) {
        self.interfaceId = interfaceId
        self.registerId = registerId
        self.count = count
        self.offset = offset
        self.registerBank = registerBank
        self.data = data
    }
}
