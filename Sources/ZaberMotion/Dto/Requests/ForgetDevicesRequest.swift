/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct ForgetDevicesRequest: Serializable {
    public var interfaceId: Int
    public var exceptDevices: [Int]

    public init(interfaceId: Int = 0, exceptDevices: [Int] = []) {
        self.interfaceId = interfaceId
        self.exceptDevices = exceptDevices
    }

    public static func fromByteArray(_ byteArray: Data) throws -> ForgetDevicesRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(ForgetDevicesRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "ForgetDevicesRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "ForgetDevicesRequest", error: error)
        }
    }
}
