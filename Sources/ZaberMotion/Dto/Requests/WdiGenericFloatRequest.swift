/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
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

    public static func fromByteArray(_ byteArray: Data) throws -> WdiGenericFloatRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(WdiGenericFloatRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "WdiGenericFloatRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "WdiGenericFloatRequest", error: error)
        }
    }
}
