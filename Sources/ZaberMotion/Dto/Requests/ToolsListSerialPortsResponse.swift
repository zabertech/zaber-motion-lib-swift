/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct ToolsListSerialPortsResponse: Serializable {
    public var ports: [String]

    public init(ports: [String] = []) {
        self.ports = ports
    }

    public static func fromByteArray(_ byteArray: Data) throws -> ToolsListSerialPortsResponse {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(ToolsListSerialPortsResponse.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "ToolsListSerialPortsResponse", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "ToolsListSerialPortsResponse", error: error)
        }
    }
}
