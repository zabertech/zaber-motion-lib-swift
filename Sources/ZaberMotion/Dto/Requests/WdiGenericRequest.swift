/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
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

    public static func fromByteArray(_ byteArray: Data) throws -> WdiGenericRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(WdiGenericRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "WdiGenericRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "WdiGenericRequest", error: error)
        }
    }
}
