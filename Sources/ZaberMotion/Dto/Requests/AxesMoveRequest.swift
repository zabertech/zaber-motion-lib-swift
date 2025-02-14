/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import Dto


public struct AxesMoveRequest: Serializable {
    public var interfaces: [Int]
    public var devices: [Int]
    public var axes: [Int]
    public var position: [Dto.Measurement]

    public init(interfaces: [Int] = [], devices: [Int] = [], axes: [Int] = [], position: [Dto.Measurement] = []) {
        self.interfaces = interfaces
        self.devices = devices
        self.axes = axes
        self.position = position
    }

    public static func fromByteArray(_ byteArray: Data) throws -> AxesMoveRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(AxesMoveRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "AxesMoveRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "AxesMoveRequest", error: error)
        }
    }
}
