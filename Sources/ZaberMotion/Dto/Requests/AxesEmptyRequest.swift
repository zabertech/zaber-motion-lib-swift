/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct AxesEmptyRequest: Serializable {
    public var interfaces: [Int]
    public var devices: [Int]
    public var axes: [Int]

    public init(interfaces: [Int] = [], devices: [Int] = [], axes: [Int] = []) {
        self.interfaces = interfaces
        self.devices = devices
        self.axes = axes
    }

    public static func fromByteArray(_ byteArray: Data) throws -> AxesEmptyRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(AxesEmptyRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "AxesEmptyRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "AxesEmptyRequest", error: error)
        }
    }
}
