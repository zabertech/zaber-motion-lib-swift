/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable

/**
 * The label of an IO port.
 */
public struct IoPortLabel: Serializable {

    /**
     * The type of the port.
     */
    public var portType: IoPortType

    /**
     * The number of the port.
     */
    public var channelNumber: Int

    /**
     * The label of the port.
     */
    public var label: String

    public init(portType: IoPortType = IoPortType(rawValue: 0)!, channelNumber: Int = 0, label: String = "") {
        self.portType = portType
        self.channelNumber = channelNumber
        self.label = label
    }

    public static func fromByteArray(_ byteArray: Data) throws -> IoPortLabel {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(IoPortLabel.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "IoPortLabel", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "IoPortLabel", error: error)
        }
    }
}
