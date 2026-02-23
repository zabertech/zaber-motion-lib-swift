/* This file is generated. Do not modify by hand. */

import Foundation
import DtoSerializable

public struct WdiGenericRequest: Serializable {
    public var interfaceId: Int
    public var registerId: Int
    public var size: Int
    public var count: Int
    public var offset: Int
    public var registerBank: String
    public var data: [Int]

    public init(interfaceId: Int = 0, registerId: Int = 0, size: Int = 0, count: Int = 0, offset: Int = 0, registerBank: String = "", data: [Int] = []) {
        self.interfaceId = interfaceId
        self.registerId = registerId
        self.size = size
        self.count = count
        self.offset = offset
        self.registerBank = registerBank
        self.data = data
    }
}
