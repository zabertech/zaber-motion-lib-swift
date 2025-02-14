/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

public struct WaitToClearWarningsRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var axis: Int
    public var timeout: Double
    public var warningFlags: [String]

    public init(interfaceId: Int = 0, device: Int = 0, axis: Int = 0, timeout: Double = 0.0, warningFlags: [String] = []) {
        self.interfaceId = interfaceId
        self.device = device
        self.axis = axis
        self.timeout = timeout
        self.warningFlags = warningFlags
    }

    public static func fromByteArray(_ byteArray: Data) throws -> WaitToClearWarningsRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(WaitToClearWarningsRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "WaitToClearWarningsRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "WaitToClearWarningsRequest", error: error)
        }
    }
}
