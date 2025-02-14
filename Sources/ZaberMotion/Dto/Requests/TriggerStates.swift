/* This file is generated. Do not modify by hand. */

import Foundation
import SwiftBSON
import DtoSerializable
import DtoAscii


public struct TriggerStates: Serializable {
    public var states: [DtoAscii.TriggerState]

    public init(states: [DtoAscii.TriggerState] = []) {
        self.states = states
    }

    public static func fromByteArray(_ byteArray: Data) throws -> TriggerStates {
        do {
            let bson = try BSONDocument(fromBSON: byteArray)
            return try BSONDecoder().decode(TriggerStates.self, from: bson)
        } catch {
            throw SerializationError.deserializationFailed(object: "TriggerStates", error: error)
        }
    }

    public func toByteArray() throws -> Data {
        do {
            let bson = try BSONEncoder().encode(self)
            return bson.toData()
        } catch {
            throw SerializationError.serializationFailed(object: "TriggerStates", error: error)
        }
    }
}
