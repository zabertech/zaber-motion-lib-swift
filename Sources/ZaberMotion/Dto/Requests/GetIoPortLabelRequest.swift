/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct GetIoPortLabelRequest: Serializable {
    public var interfaceId: Int
    public var device: Int
    public var portType: DtoAscii.IoPortType
    public var channelNumber: Int

    public init(interfaceId: Int = 0, device: Int = 0, portType: DtoAscii.IoPortType = IoPortType(rawValue: 0)!, channelNumber: Int = 0) {
        self.interfaceId = interfaceId
        self.device = device
        self.portType = portType
        self.channelNumber = channelNumber
    }

    public static func fromByteArray(_ byteArray: Data) throws -> GetIoPortLabelRequest {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(GetIoPortLabelRequest.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "GetIoPortLabelRequest", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "GetIoPortLabelRequest", error: error)
        }
    }
}
