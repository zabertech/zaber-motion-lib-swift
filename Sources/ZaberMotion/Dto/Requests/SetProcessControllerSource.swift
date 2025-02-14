/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoProduct


public struct SetProcessControllerSource: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var source: DtoProduct.ProcessControllerSource

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, source: DtoProduct.ProcessControllerSource = ProcessControllerSource()) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.source = source
    }

    public static func fromByteArray(_ byteArray: Data) throws -> SetProcessControllerSource {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(SetProcessControllerSource.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "SetProcessControllerSource", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "SetProcessControllerSource", error: error)
        }
    }
}
